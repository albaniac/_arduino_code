
#include <Stepper.h>

//#define STEPS 20
//#define COIL1 8
//#define COIL2 9
//#define COIL3 10
//#define COIL4 11

//Stepper stepper(STEPS,COIL1,COIL2,COIL3,COIL4);
Stepper stepper1(20,8,9,10,11);
Stepper stepper2(20,4,5,6,7);
int pos = 0;

void setup()
{
  stepper1.setSpeed(500);
  stepper2.setSpeed(500);
}


void loop(){
  stepper1.step(-60);
  stepper2.step(-60);
  delay(300);
  stepper1.step(60);
  stepper2.step(60);
  delay(300);
}

