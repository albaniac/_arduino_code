//Pin connected to latch pin (ST_CP) of 74HC595
const int latchPin = 3;
//Pin connected to clock pin (SH_CP) of 74HC595
const int clockPin = 2;
////Pin connected to Data in (DS) of 74HC595
const int dataPin = 4;

char inputString[2];
byte pinForRow[8] = {12,11,10,9,8,7,6,5};
void setup() {
  //set pins to output because they are addressed in the main loop
  pinMode(latchPin, OUTPUT);
  pinMode(dataPin, OUTPUT);  
  pinMode(clockPin, OUTPUT);

 for (int i=0; i<8; i++){
    pinMode(pinForRow[i], OUTPUT);
}
}

void loop() {
  //digitalWrite(9, HIGH);
  //digitalWrite(10, HIGH);
  //digitalWrite(11, HIGH);
  //digitalWrite(12, HIGH);
  // iterate over the 16 outputs of the two shift registers
  for (int thisLed = 0; thisLed < 16; thisLed++) {
    // write data to the shift registers:
    //registerWrite(thisLed, HIGH);
     for (int i=0; i<8; i++){
         registerWrite(thisLed, HIGH);
    digitalWrite(pinForRow[i], HIGH);
     }
    // if this is not the first LED, turn off the previous LED:
    //if (thisLed > 0) {
     // registerWrite(thisLed - 1, LOW);
    //} 
    // if this is  the first LED, turn off the highest LED:
   // else {
    //  registerWrite(15, LOW);
    //} 
   // // pause between LEDs:
    delay(25);
  }

}

// This method sends bits to the shift registers:

void registerWrite(int whichPin, int whichState) {
  // the bits you want to send. Use an unsigned int,
  // so you can use all 16 bits:
  unsigned int bitsToSend = 0;    

  // turn off the output so the pins don't light up
  // while you're shifting bits:
  digitalWrite(latchPin, LOW);

  // turn on the next highest bit in bitsToSend:
  bitWrite(bitsToSend, whichPin, whichState);

  // break the bits into two bytes, one for 
  // the first register and one for the second:
  byte registerOne = highByte(bitsToSend);
  byte registerTwo = lowByte(bitsToSend);

  // shift the bytes out:
  shiftOut(dataPin, clockPin, LSBFIRST, registerTwo);
  shiftOut(dataPin, clockPin, LSBFIRST, registerOne);

  // turn on the output so the LEDs can light up:
  digitalWrite(latchPin, HIGH);
}
