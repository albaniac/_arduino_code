/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 
  This example code is in the public domain.
 */

void setup() {                
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
  pinMode(13, OUTPUT);
pinMode(12, OUTPUT);
pinMode(11, OUTPUT);
pinMode(10, OUTPUT);
pinMode(9, OUTPUT);
pinMode(8, OUTPUT);
pinMode(7, OUTPUT);
pinMode(6, OUTPUT);
pinMode(5, OUTPUT);
pinMode(4, OUTPUT);
pinMode(3, OUTPUT);
pinMode(2, OUTPUT);
}

void loop() {
  digitalWrite(13, HIGH);
digitalWrite(12, HIGH);
//digitalWrite(11, HIGH);
//digitalWrite(10, HIGH);
//digitalWrite(9, HIGH);
//digitalWrite(8, HIGH);
//digitalWrite(7, HIGH);

//digitalWrite(6, HIGH);
//digitalWrite(5, HIGH);
//digitalWrite(4, HIGH);
digitalWrite(3, HIGH);
digitalWrite(2, HIGH);
//digitalWrite(1, HIGH);
delay (1000);

digitalWrite(2,LOW);
delay(1000);
               }
