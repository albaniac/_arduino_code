// Sweep
// by BARRAGAN <http://barraganstudio.com> 
// This example code is in the public domain.

#include <math.h>
#include <Servo.h> 

Servo myservo1;  // create servo object to control a servo 
Servo myservo2;               // a maximum of eight servo objects can be created 
Servo myservo3; 
Servo myservo4; 

// variable to store the servo position 



void setup() 
{ 
  myservo1.attach(8);
 // myservo2.attach(6);
   myservo2.attach(5);
    //myservo4.attach(8);

 // Serial.begin(9600);
  
 // myservo3.write(90);
//myservo4.write(90);
   //pos(ax,ay);
  // attaches the servo on pin 9 to the servo object 
} 


void loop() 
{ 

  myservo1.write(66.8);
 myservo2.write(176.4);
 
} 






