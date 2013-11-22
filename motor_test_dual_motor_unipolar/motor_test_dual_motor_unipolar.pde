
#include <Stepper.h>

//#define STEPS 20
//#define COIL1 8
//#define COIL2 9
//#define COIL3 10
//#define COIL4 11

//Stepper stepper(STEPS,COIL1,COIL2,COIL3,COIL4);
Stepper stepper1(200,7,6,5,4);
//Stepper stepper2(2048,4,5,6,7);
int pos = 0;

void setup()
{
  stepper1.setSpeed(5);
  //stepper2.setSpeed(5);
}


void loop(){
  stepper1.step(-600);
  //stepper2.step(-600);
  delay(300);
  stepper1.step(600);
  //stepper2.step(600);
  delay(300);
}

