/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 relay pin 3
 led pin 8
  This example code is in the public domain.
 */
const int analogInPin1 = A1; 
const int analogInPin2 = A2; 

long sensorValue1 = 0;
long sensorValue2 = 0;

void setup() {                
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
  pinMode(3, OUTPUT);
  pinMode(8, OUTPUT);
 // Serial.begin(9600); 
}

void loop() {
  
sensorValue1 = analogRead(analogInPin1);  
 sensorValue2 = analogRead(analogInPin2); 
   
 long  outputValue1 = map(sensorValue1, 0, 1023, 0, 1000);  
 long  outputValue2 = map(sensorValue2, 0, 1023, 0, 1000);  
 
 long ongeyser = (outputValue1 * 1800) + 500;
 long offgeyser = (outputValue2 * 1800) + 500;
 //Serial.print("sensor1 = " );                       
  //Serial.print(ongeyser);      
  //Serial.print("\t sensor2 = ");      
 // Serial.println(offgeyser); 
 
 
 
  digitalWrite(3, HIGH); 
digitalWrite(8, HIGH);   // set the LED on
  delay(ongeyser);              // wait for a second
  digitalWrite(3, LOW); 
digitalWrite(8, LOW);  // set the LED off
  delay(offgeyser);              // wait for a second


}


