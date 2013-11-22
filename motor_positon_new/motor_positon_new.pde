
#include <Stepper.h>

#define STEPS 2048
#define COIL1 2
#define COIL2 3
#define COIL3 4
#define COIL4 5

Stepper stepper(STEPS,COIL1,COIL2,COIL3,COIL4);
int pos = 0;

void setup()
{
  stepper.setSpeed(9);
}


void loop(){
  int vval = analogRead(0);

  if ((vval - pos)!= 0){
    if((vval - pos) > 2){
      stepper.step(1);
      pos;
    }
    else if((vval - pos)<-2){
      stepper.step(-1);
      pos--;
    }
  }
  else{
    digitalWrite(COIL1,LOW);
    digitalWrite(COIL2,LOW);
    digitalWrite(COIL3,LOW);
    digitalWrite(COIL4,LOW);
  }
}

