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
double x =0;
double y =0;

void setup() 
{ 
  myservo1.attach(5);
  myservo2.attach(6);
  myservo3.attach(7);
  myservo4.attach(8);
  Serial.begin(9600);
  // attaches the servo on pin 9 to the servo object 
} 


void loop() 
{ 

  for (x = 0; x < 100; x += 1)
  {
    for (y = 0; y < 100; y += 1)
    {
      pos(x,y);
    }
  }
  delay(5000);
} 


void pos ( int x,int y)

{
  int l1 = 80;
  int l2 = 90;


  double B = sqrt(sq(x) + sq(y));
  double q1 = atan2(y , x);
  double q2 = acos((sq(l1)-sq(l2)+sq(B))/(2*l1*B));
  double an1 = rtod(q1 + q2);
  double an2 = rtod(acos((sq(l1)+sq(l2)-sq(B))/(2*l1*l2)));

  Serial.println(x,DEC);
  
  Serial.println(y,DEC);
  Serial.println(an1,DEC);
  Serial.println(an2,DEC);
}

double rtod(double fradians)
{
  return(fradians * 180.0 / PI);
}




