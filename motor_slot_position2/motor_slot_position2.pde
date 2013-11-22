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
  pinMode(5, INPUT);
  pinMode(13, OUTPUT); 
  stepper1.setSpeed(5);
  stepper2.setSpeed(5);
  hommotor();
}

void loop() {
  int sensorValue = digitalRead(5);
stepper1.step(200);
delay(500);
//stepper1.step(-100);
hommotor();
delay(500);
  if (sensorValue == 1) {
    digitalWrite(13, HIGH);
  }
  else { 
    digitalWrite(13, LOW);
  }





}
void hommotor(){
  int sensorValue = digitalRead(5);
  while (sensorValue == 0){
   int sensorValue = digitalRead(5);
    if (sensorValue == 1) {
      digitalWrite(13, HIGH);
      break;
    }
    stepper1.step(-1);

  }

}






