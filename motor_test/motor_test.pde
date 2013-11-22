
#include <Stepper.h>

#define STEPS 2048
#define COIL1 8
#define COIL2 9
#define COIL3 10
#define COIL4 11

Stepper stepper(STEPS,COIL1,COIL2,COIL3,COIL4);
int pos = 0;

void setup()
{
  stepper.setSpeed(9);
}


void loop(){
  stepper.step(10);
}

