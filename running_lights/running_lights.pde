/*
  Blink
 Turns on an LED on for one second, then off for one second, repeatedly.
 
 This example code is in the public domain.
 */
long intt = 50; 
void setup() {                
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
  pinMode(2, OUTPUT); 
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(8, OUTPUT);
pinMode(9, OUTPUT);
}

void loop() {
  digitalWrite(2, HIGH);   // set the LED on
  delay(intt);              // wait for a second
  digitalWrite(2, LOW);    // set the LED off
    
  digitalWrite(3, HIGH);   // set the LED on
  delay(intt);              // wait for a second
  digitalWrite(3, LOW);    // set the LED off
 
  digitalWrite(4, HIGH);   // set the LED on
  delay(intt);              // wait for a second
  digitalWrite(4, LOW);    // set the LED off
 
  digitalWrite(5, HIGH);   // set the LED on
  delay(intt);              // wait for a second
  digitalWrite(5, LOW);    // set the LED off
 
  digitalWrite(6, HIGH);   // set the LED on
  delay(intt);              // wait for a second
  digitalWrite(6, LOW);    // set the LED off
 
  digitalWrite(7, HIGH);   // set the LED on
  delay(intt);              // wait for a second
  digitalWrite(7, LOW);    // set the LED off
  
  digitalWrite(8, HIGH);   // set the LED on
  delay(intt);              // wait for a second
  digitalWrite(8, LOW); 

digitalWrite(9, HIGH);   // set the LED on
  delay(intt);              // wait for a second
  digitalWrite(9, LOW);

  // set the LED off
   // wait for a second
}

