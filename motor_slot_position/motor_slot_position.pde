/*
  DigitalReadSerial
 Reads a digital input on pin 2, prints the result to the serial monitor 
 
 This example code is in the public domain.
 */
#include <Stepper.h>
Stepper stepper1(2048,8,9,10,11);
Stepper stepper2(2048,4,5,6,7);
int pos = 0;

void setup() {
  Serial.begin(9600);
  pinMode(2, INPUT);
  pinMode(13, OUTPUT); 
  stepper1.setSpeed(5);
  stepper2.setSpeed(5);

}

void loop() {
  int sensorValue = digitalRead(2);
  if (sensorValue == 1) {
    digitalWrite(13, HIGH);
  }
  else { 
    digitalWrite(13, LOW);
  }

  //while (sensorValue == 0){
   //stepper1.step(-6);
   //if (sensorValue == 1) {
    //break;
 // }
   

  //}



}





