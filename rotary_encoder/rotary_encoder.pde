// Arduino Rotary Encoder from Mouse Scroll Wheel
// and SparkFun 4 Digit Serial 7-Segment Display
// by Steve Kamerman 12/18/2010
// http://www.stevekamerman.com/2010/12/understanding-a-mouse-scroll-wheel/

// These MUST be on interrupt pins!
#define encoderPinA 2
#define encoderPinB 3

#define displayTXPin 10
#define displayRXPin 11

// used only for sprintf()
#include <stdio.h>

// If you don't have NewSoftSerial, grab it from:
// http://arduiniana.org/libraries/NewSoftSerial/
#include <NewSoftSerial.h>
NewSoftSerial displaySerial(displayRXPin, displayTXPin);

// the value - this must be volatile because it is modified
// during an interrupt function and used in a normal function
volatile unsigned int encoderPos = 0;

void setup() {
  // setup the encoder
  pinMode(encoderPinA, INPUT);
  pinMode(encoderPinB, INPUT);
  attachInterrupt(0, readEncoderA, CHANGE);
  attachInterrupt(1, readEncoderB, CHANGE);  
 
  // setup the display
  pinMode(displayTXPin, OUTPUT);
  displaySerial.begin(9600);
  // reset display
  displaySerial.print("v");
  // Set display brightness
  displaySerial.print(0x7A, BYTE);
  displaySerial.print(0x05, BYTE);
  // set the display to "   0"
  displaySerial.print("xxx0");
}
void loop(){
  displayNumber(encoderPos);
}

// prints the given number, right justified padded with spaces
// sprtinf() is not a great idea if you want to save space
// but I'm really not too worried about it :)
void displayNumber(int num){
  char buf[4];
  sprintf(buf, "%4d", num);
  displaySerial.print(buf);
}

void readEncoderA(){
  if (digitalRead(encoderPinA) == HIGH){
    encoderPos += (digitalRead(encoderPinB) == LOW)? 1: -1;
  }else{
    encoderPos += (digitalRead(encoderPinB) == HIGH)? 1: -1;
  }
}
void readEncoderB(){
  if (digitalRead(encoderPinB) == HIGH){
    encoderPos += (digitalRead(encoderPinA) == HIGH)? 1: -1;
  }else{
    encoderPos += (digitalRead(encoderPinA) == LOW)? 1: -1;
  }
}
