#define NUM_ELEM(x) (sizeof (x) / sizeof (*(x)))

int lilypad[] = {
  1,1,1,1,1,1,1,1, //L
  1,0,0,0,0,0,0,0,
  1,0,0,0,0,0,0,0,
  1,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,

  1,1,1,1,0,1,0,0, //i
  0,0,0,0,0,0,0,0,

  1,1,1,1,1,1,1,1, //l
  0,0,0,0,0,0,0,0,

  1,0,0,0,0,1,1,0, //y
  0,1,0,0,1,0,0,0,
  0,0,1,1,0,0,0,0,
  0,0,0,1,1,1,1,0,
  0,0,0,0,0,0,0,0,

  1,1,1,1,1,1,1,1, //p
  0,0,0,0,1,0,0,1,
  0,0,0,0,1,0,0,1,
  0,0,0,0,0,1,1,1,
  0,0,0,0,0,0,0,0,

  1,1,1,1,0,0,0,0, //a
  1,0,0,1,0,0,0,0,
  1,0,0,1,1,0,0,0,
  1,1,1,1,1,0,0,0,
  0,0,0,0,0,0,0,0,

  1,1,1,1,0,0,0,0, //d
  1,0,0,1,0,0,0,0,
  0,0,0,1,0,0,0,0,
  1,1,1,1,1,1,1,1,
  0,0,0,0,0,0,0,0};


int ledPin9 = 9; // LED connected to digital pin 13
int ledPin8 = 8; // LED connected to digital pin 13
int ledPin7 = 7; // LED connected to digital pin 13
int ledPin6 = 6; // LED connected to digital pin 13
int ledPin5 = 5; // LED connected to digital pin 13
int ledPin4 = 4; // LED connected to digital pin 13
int ledPin3 = 3; // LED connected to digital pin 13
int ledPin2 = 2; // LED connected to digital pin 13
//int ground = 5; // LED connected to digital 5 "ground"

//int ledPinArray[8] = {
//  2,3,4,5,6,7,8,9};
  int ledPinArray[8] = {
  9,8,7,6,5,4,3,2};
// The setup() method runs once, when the sketch starts

int columnDelay;
int sizeWord = 0;
void setup() { 
  // initialize the digital pin as an output:
  for(int i = 0; i < 8; i++){
    pinMode(ledPinArray[i],OUTPUT);
  }
  //pinMode(ground, OUTPUT); 
  //digitalWrite(ground, LOW); 

  columnDelay = 2.5; //wait 2.5ms between each column flash
  //Serial.begin(9600);
  //Serial.print("Number of lilypad: ");
  //Serial.println(NUM_ELEM(lilypad));
  //delay(2000);
  sizeWord = NUM_ELEM(lilypad);
}

// the loop() method runs over and over again,
// as long as the Arduino has power

/*void loop() 
 {
 for(int i = 0; i < 8; i++){
 digitalWrite(ledPinArray[i],HIGH);
 }
 
 delay(1000); // wait for a second
 for(int i = 0; i < 8; i++){
 digitalWrite(ledPinArray[i],LOW);
 }
 delay(1000); // wait for a second
 }*/

void loop()
{
  //Serial.print("Number of lilypad: ");
  //Serial.println(NUM_ELEM(lilypad));
  //delay(1000);
  printWord(lilypad);
  delay(82.3); //wait a little bit between each display of the word LilyPad
}

void printWord(int wordVar[]) {

  int numRows = sizeWord/8;
  for(int j = 0; j < numRows; j++) {
    for(int i = 0; i<8; i++) {
      digitalWrite(i+2, wordVar[i+j*8]);
    }
    delay(columnDelay);
  }
} 

