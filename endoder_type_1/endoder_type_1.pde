#define PIN_HIGHBIT (A1)
#define PIN_LOWBIT  (A0)
//#define PIN_PWR     (3)
#define BAUDRATE    (9600)
#define DEBUG         (1)

// globals
int state, prevState = 0, count = 0;
/* old state, new state, change (+ means clockwise)
 * 0 2 +
 * 1 0 +
 * 2 3 +
 * 3 1 +
 * 0 1 -
 * 1 3 -
 * 2 0 -
 * 3 2 -
 */
int encoderStates[4][4] = {
 {  0, -1,  1,  0 },
 {  1,  0,  0, -1 },
 { -1,  0,  0,  1 },
 {  0,  1, -1,  0 },
};

void setup() {
  pinMode(PIN_HIGHBIT, INPUT);
  pinMode(PIN_LOWBIT, INPUT);
  //pinMode(PIN_PWR, OUTPUT);
 // digitalWrite(PIN_PWR, LOW);
  digitalWrite(PIN_LOWBIT, HIGH);
  digitalWrite(PIN_HIGHBIT, HIGH);
  Serial.begin(BAUDRATE);
}

void loop() {
  state = (digitalRead(PIN_HIGHBIT) << 1) | digitalRead(PIN_LOWBIT);
  count += encoderStates[prevState][state];
//Serial.println(count);
//#ifdef DEBUG
  if (state != prevState) {
    Serial.print(state, DEC);
    Serial.print(' ');
    Serial.print(prevState, DEC);
    Serial.print(' ');
    Serial.println(count);
  }
  
//#endif

  prevState = state;
}
