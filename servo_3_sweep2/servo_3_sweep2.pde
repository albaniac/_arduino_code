// Sweep
// by BARRAGAN <http://barraganstudio.com> 
// This example code is in the public domain.


#include <Servo.h> 

Servo myservo1;  // create servo object to control a servo 
Servo myservo2;               // a maximum of eight servo objects can be created 

//int pos = 0;    // variable to store the servo position 

void setup() 
{ 
  myservo1.attach(5);
  myservo2.attach(6);  // attaches the servo on pin 9 to the servo object 
} 


void loop() 
{ 
            // in steps of 1 degree 
    myservo1.write(90);
    myservo2.write(90);     // tell servo to go to position in variable 'pos' 
                    // waits 15ms for the servo to reach the position 
   
} 

