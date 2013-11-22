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

//float dist = 0;

float ax = 25;
float ay = 125;
float bx = 75;
float by = 125;
float cx = 80;
float cy = 148;
float dx = 30;
float dy = 148;

int del_let(500);

void setup() 
{ 

  myservo1.attach(8);
  myservo2.attach(5);
  myservo3.attach(7);
  myservo4.attach(6);
  Serial.begin(9600);
  penup();
  eraserup();
  // attaches the servo on pin 9 to the servo object 
} 


void loop() 
{ 

  /*
  
  
  onee(10,125);
  delay(1000);
  three(28,125);

  delay(1000);
  toww(52,125);
  delay(1000);
  eight(68,125);
  delay(1000);
  
  
} 

void penup()
{
  myservo3.write(10);
}

void pendn()
{
  myservo3.write(85);
}

void eraserup()
{
  myservo4.write(45);
}

void eraserdn()
{
  myservo4.write(10);
  
}




void putline (float xi,float yi,float xd, float yd)
{
  float distt = sqrt(sq(xd - xi) + sq(yd - yi));
  int numpart = distt / 0.5;
  float ddx = (xd - xi) / numpart;
  float l_slope = (yd - yi)/(xd - xi);




  if (yi == yd){
    // Serial.println("horizontal line");
    if (xi < xd){


      for(float xaxis = xi; xaxis < xd; xaxis += 0.5)
      {
        pos(xaxis,yi);
        delay(2);

      }
    }
    else if (xi > xd){
      for(float xaxis = xi; xaxis > xd; xaxis -= 0.5)
      {
        //for(float yaxis = yi; yaxis < yd; yaxis += 0.5)
        // {

        pos(xaxis,yi);
        delay(2);

        //Serial.print(xaxis,DEC);
        //Serial.println(yi,DEC);
      }
    }
  }
  else if (xi == xd){
    //Serial.println("vertical line");
    if (yi < yd) {


      for(float yaxis = yi; yaxis < yd; yaxis += 0.5)
      {
        pos(xi,yaxis);
        delay(5);
      }
    }
    else if ( yi > yd ){
      for(float yaxis = yi; yaxis > yd; yaxis -= 0.5)
      {
        pos(xi,yaxis);
        delay(5);
      }
      //Serial.print(xi,DEC);
    } //Serial.println(yaxis,DEC);

  }
  else 

    //Serial.println("diagonalline");

  for (float point = 1; point < numpart; point += 0.5)
  {
    float xpoint = xi + (ddx * point );
    float ypoint = l_slope * (xpoint - xi) + yi;
    pos(xpoint , ypoint);
    delay(5);

    //Serial.print(xpoint,DEC);
    //Serial.println(ypoint,DEC);

  }



}

void corner_points()
{

  penup();
  delay(1000);


  pos(ax,ay);
  pendn();
  delay(1000);
  penup();
  delay(1000);
  pos(bx,by);
  pendn();
  delay(1000);


  penup();
  delay(1000);

  pos(cx,cy);
  delay(1000);
  pendn();
  delay(1000);
  penup();
  delay(1000);

  pos(dx,dy);
  delay(1000);

  pendn();
  delay(1000);
  penup();
  delay(1000);
}



void testborder()
{
  penup();
  delay(1000);
  pendn();
  delay(1000);
  putline(ax , ay , bx , by);
  delay(1000);
  putline(bx , by , cx , cy); 
  delay(1000);
  putline(cx , cy , dx , dy);
  delay(1000);
  putline(dx , dy , ax , ay);
  penup();
  delay(1000);
}

void pos ( float x,float y)

{
  float l1 = 80.4;
  float l2 = 93;
  //float c2 = sq(x);
  //float c2 = (sq(x) + sq(y) - sq(l1) - sq (l2));
  double cb2 = 2*l1*l2;

  double c2 = (sq(x) + sq(y) - sq(l1) - sq (l2)) / cb2;
  double s2 = sqrt(1-sq(c2));
  double k1 = (l1 + l2 * c2);
  double k2 = (l2 * s2);

  double base_ang = rtod((atan2(y,x) - atan2(k2,k1)));
  double elbow_ang = rtod(atan2(s2,c2)) + 90;

  myservo1.write(base_ang);
  myservo2.write(elbow_ang);


}

double rtod(double fradians)
{
  return(fradians * 180.0 / PI);
}


void onee ( float xp, float yp)

{
  penup();
  delay(del_let);
  pos(17 + xp,23 + yp);
  delay(del_let);
  pendn();
  delay(del_let);

  for ( int repeat= 0 ; repeat < 3; repeat ++)
  {

    putline(17+xp,23+yp,12+xp,0+yp);
    delay(del_let);
    putline(12+xp,0+yp,17+xp,23+yp);
    delay(del_let);
  }

  penup();
}



void toww(float xp,float yp)

{
  penup();
  delay(del_let);

  pos(5 + xp,23 + yp);
  delay(del_let);
  pendn();
  delay(del_let);

  for ( int repeat= 0 ; repeat < 3; repeat ++)
  {


    putline(5+xp,23+yp,16.5+xp,23+yp);
    delay(del_let);
    putline(16.5+xp,23+yp,14.5+xp,11.5+yp);
    delay(del_let);
    putline(14.5+xp,11.5+yp,2.5+xp,11.5+yp);
    delay(del_let);
    putline(2.5+xp,11.5+yp,0+xp,0+yp);
    delay(del_let);
    putline(0+xp,0+yp,12+xp,0+yp);
    delay(del_let);

    putline(12+xp,0+yp,0+xp,0+yp);
    delay(del_let);

    putline(0+xp,0+yp,2.5+xp,11.5+yp);
    delay(del_let);
    putline(2.5+xp,11.5+yp,14.5+xp,11.5+yp);
    delay(del_let);
    putline(14.5+xp,11.5+yp,16.5+xp,23+yp);
    delay(del_let);
    putline(16.5+xp,23+yp,5+xp,23+yp);
    delay(del_let);



  }
  penup();
  delay(del_let);

}

void three( float xp,float yp)
{

  penup();
  delay(del_let);

  pos(6 + xp,23 + yp);
  delay(del_let);
  pendn();
  delay(del_let);

  for ( int repeat= 0 ; repeat < 3; repeat ++)
  {


    putline(6 + xp,23+yp,17+xp,23+yp);
    delay(del_let);
    putline(17 +xp,23+yp,14.5+xp,11.5+yp);
    delay(del_let);
    putline(14.5+xp,11.5+yp,3.5+xp,11.5+yp);
    delay(del_let);
    putline(3.5+xp,11.5+yp,14.5+xp,11.5+yp);
    delay(del_let);
    putline(14.5+xp,11.5+yp,12 +xp,0 +yp);
    delay(del_let);
    putline(12+xp,0+yp,0 +xp,0 +yp);
    delay(del_let);

    putline(0+xp,0+yp,12 +xp,0 +yp);
    delay(del_let);
    putline(12+xp,0+yp,14.5 +xp,11.5 +yp);
    delay(del_let);
    putline(14.5+xp,11.5+yp,3.5+xp,11.5+yp);
    delay(del_let);
    putline(3.5+xp,11.5+yp,14.5+xp,11.5+yp);
    delay(del_let);
    putline(14.5+xp,11.5+yp,17+xp,23+yp);
    delay(del_let);
    putline(17+xp,23+yp,6+xp,23+yp);
    delay(del_let);



  }

  penup();

}

void four ( float xp,float yp)
{

  penup();
  delay(del_let);

  pos(6 + xp,23 + yp);
  delay(del_let);
  pendn();
  delay(del_let);

  for ( int repeat= 0 ; repeat < 3; repeat ++)
  {
    putline(6 + xp,23+yp,3.5+xp,11.5+yp);
    delay(del_let);
    putline(3.5 + xp,11.5+yp,14.5+xp,11.5+yp);
    delay(del_let);
    putline(14.5 + xp,11.5+yp,17+xp,23 + yp);
    delay(del_let);
    putline(17 + xp,23+yp,12 +xp,0 + yp);
    delay(del_let);
    putline(12 + xp,0+yp,14.5 +xp,11.5 + yp);
    delay(del_let);
    putline(14.5 + xp,11.5+yp,3.5 +xp,11.5 + yp);
    delay(del_let);
    putline(3.5 + xp,11.5+yp,6 +xp,23 + yp);
    delay(del_let);



  }


  penup();
}

void five (float xp, float yp)

{
  penup();
  delay(del_let);

  pos(17 + xp,23 + yp);
  delay(del_let);
  pendn();
  delay(del_let);

  for ( int repeat= 0 ; repeat < 3; repeat ++)
  {
    putline(17 + xp,23 +yp,6 +xp,23 + yp);
    delay(del_let);
    putline(6 + xp,23 +yp,3.5 +xp,11.5 + yp);
    delay(del_let);
    putline(3.5 + xp,11.5 +yp,14.5 +xp,11.5 + yp);
    delay(del_let);
    putline(14.5 + xp,11.5 +yp,12 +xp,0 + yp);
    delay(del_let);
    putline(12 + xp,0 +yp,1 +xp,0 + yp);
    delay(del_let);

    putline(1 + xp,0 +yp,12 +xp,0 + yp);
    delay(del_let);
    putline(12 + xp,0 +yp,14.5 +xp,11.5 + yp);
    delay(del_let);
    putline(14.5 + xp,11.5 +yp,3.5 +xp,11.5 + yp);
    delay(del_let);
    putline(3.5 + xp,11.5 +yp,6 +xp,23 + yp);
    delay(del_let);
    putline(6 + xp,23 +yp,17 +xp,23 + yp);
    delay(del_let);


  }

  penup();

}

void six ( float xp, float yp)
{
  penup();
  delay(del_let);

  pos(17 + xp,23 + yp);
  delay(del_let);
  pendn();
  delay(del_let);

  for ( int repeat= 0 ; repeat < 3; repeat ++)
  {

    putline(17 + xp,23 +yp,6 +xp,23 + yp);
    delay(del_let);
    putline(6 + xp,23 +yp,1 +xp,0 + yp);
    delay(del_let);
    putline(1 + xp,0 +yp,12 +xp,0 + yp);
    delay(del_let);
    putline(12 + xp,0 +yp,14.5 +xp,11.5 + yp);
    delay(del_let);
    putline(14.5 + xp,11.5 +yp,3.5 +xp,11.5 + yp);
    delay(del_let);

    putline(3.5 + xp,11.5 +yp,6 +xp,23 + yp);
    delay(del_let);
    putline(6 + xp,23 +yp,17 +xp,23 + yp);
    delay(del_let);



  }

  penup();

}


void seven ( float xp, float yp )
{

  penup();
  delay(del_let);

  pos(6 + xp,23 + yp);
  delay(del_let);
  pendn();
  delay(del_let);

  for ( int repeat= 0 ; repeat < 3; repeat ++)
  {


    putline(6+ xp,23 +yp,17 +xp,23 + yp);
    delay(del_let);
    putline(17+ xp,23 +yp,12 +xp,0 + yp);
    delay(del_let);

    putline(12+ xp,0 +yp,17 +xp,0 + yp);
    delay(del_let);
    putline(17+ xp,23 +yp,6 +xp,23 + yp);
    delay(del_let);



  }


  penup();

}

void eight ( float xp, float yp)

{
  penup();
  delay(del_let);

  pos(6 + xp,23 + yp);
  delay(del_let);
  pendn();
  delay(del_let);

  for ( int repeat= 0 ; repeat < 4; repeat ++)
  {


    putline(6+ xp,23 +yp,3.5 +xp,11.5 + yp);
    delay(del_let);
    putline(3.5+ xp,11.5 +yp,14.5 +xp,11.5 + yp);
    delay(del_let);
    putline(14.5+ xp,11.5 +yp,12 +xp,0 + yp);
    delay(del_let);
    putline(12+ xp,0 +yp,1 +xp,0 + yp);
    delay(del_let);
    putline(1+ xp,0 +yp,3.5 +xp,11.5 + yp);
    delay(del_let);
    putline(3.5+ xp,11.5 +yp,14.5 +xp,11.5 + yp);
    delay(del_let);
    putline(14.5+ xp,11.5 +yp,17 +xp,23 + yp);
    delay(del_let);
    putline(17+ xp,23 +yp,6 +xp,23 + yp);
    delay(del_let);


  }

  penup();

}


void nine ( float xp, float yp)

{
  penup();
  delay(del_let);

  pos(6 + xp,23 + yp);
  delay(del_let);
  pendn();
  delay(del_let);

  for ( int repeat= 0 ; repeat < 3; repeat ++)
  {


    putline(6+ xp,23 +yp,3.5 +xp,11.5 + yp);
    delay(del_let);
    putline(3.5+ xp,11.5 +yp,14.5 +xp,11.5 + yp);
    delay(del_let);
    putline(14.5+ xp,11.5 +yp,12 +xp,0 + yp);
    delay(del_let);
    putline(12+ xp,0 +yp,1 +xp,0 + yp);
    delay(del_let);

    putline(1 + xp,0 +yp,12 +xp,0 + yp);
    delay(del_let);
    putline(12+ xp,0 +yp,17 +xp,23 + yp);
    delay(del_let);
    putline(17+ xp,23 +yp,6 +xp,23 + yp);
    delay(del_let);



  }

  penup();



}


void zerro(float xp , float yp)
{

  penup();
  delay(del_let);

  pos(0+xp,0+yp);
  delay(del_let);
  pendn();
  delay(del_let);
  putline(0+xp,0+yp,11+xp,0+yp);
  delay(del_let);
  putline(11+xp,0+yp,13.5+xp,23+yp);
  delay(del_let);
  putline(13.5+xp,23+yp,2.5+xp,23+yp);
  delay(del_let);
  putline(2.5+xp,23+yp,0+xp,0+yp);
  delay(del_let);


  putline(0+xp,0+yp,11+xp,0+yp);
  delay(del_let);
  putline(11+xp,0+yp,13.5+xp,23+yp);
  delay(del_let);
  putline(13.5+xp,23+yp,2.5+xp,23+yp);
  delay(del_let);
  putline(2.5+xp,23+yp,0+xp,0+yp);
  delay(del_let);

  penup();

}






























