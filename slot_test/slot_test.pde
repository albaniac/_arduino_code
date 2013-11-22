/*
  DigitalReadSerial
 Reads a digital input on pin 2, prints the result to the serial monitor 
 
 This example code is in the public domain.
 */


void setup() {
 
  pinMode(5, INPUT);
  pinMode(13, OUTPUT); 
  
}

void loop() {
  int sensorValue = digitalRead(5);





  if (sensorValue == 1) {
    digitalWrite(13, HIGH);
  }
  else { 
    digitalWrite(13, LOW);
  }





}







