

#include <Stepper.h>

// change this to the number of steps on your motor
#define STEPS 2048

// create an instance of the stepper class, specifying
// the number of steps of the motor and the pins it's
// attached to
Stepper stepper1(STEPS, 4, 5, 6, 7);
Stepper stepper2(STEPS, 8, 9, 10, 11);

int rval=0; 
int gval=0; 


char buff[]= "0000000000";


// the previous reading from the analog input
int previous1 = 0;
int previous2 = 0;
void setup()
{
  // set the speed of the motor to 30 RPMs
  stepper1.setSpeed(5);
  stepper2.setSpeed(5);

  Serial.begin(9600);
}

void loop()
{

  int val1 = map(rval, 0, 125, 0, 1024);
  int val2 = map(gval, 0, 125, 0, 1024);


 

  while (Serial.available()>0) {
    for (int i=0; i<10; i++) {
      buff[i]=buff[i+1];
    }
    buff[10]=Serial.read();
    if (buff[10]=='R') {
      rval=int(buff[9]);
    }
    if (buff[10]=='G') {
      gval=int(buff[9]);
    }


  }
  delay(10);


 
  stepper1.step(val1 - previous1);
  stepper2.step(val2 - previous2);

  // remember the previous value of the sensor
  previous1 = val1;
  previous2 = val2;









}


