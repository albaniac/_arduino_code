/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 relay pin 3
 led pin 8
  This example code is in the public domain.
 */


void setup() {                

  pinMode(5, OUTPUT);
  pinMode(8, OUTPUT);

}

void loop() {
  
 
 
 long ongeyser = 600000;
 long offgeyser = 600000;

 
 
 
  digitalWrite(5, HIGH); 
digitalWrite(8, HIGH);   // set the LED on
  delay(ongeyser);              // wait for a second
  digitalWrite(5, LOW); 
digitalWrite(8, LOW);  // set the LED off
  delay(offgeyser);              // wait for a second


}


