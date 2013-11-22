
#include <Stepper.h>

//#define STEPS 20
//#define COIL1 8
//#define COIL2 9
//#define COIL3 10
//#define COIL4 11



//Stepper stepper(STEPS,COIL1,COIL2,COIL3,COIL4);
Stepper stepper1(20,9,10,11,12);
Stepper stepper2(20,5,6,7,8);
int pos = 0;
// slot1 ( motor 1 ) pin4  orange wire 

// slot2 ( motor 2 ) pin3  yellow wire 

void setup()
{
  stepper1.setSpeed(150);
  stepper2.setSpeed(150);
  
  hommotor1();
  hommotor2();
}


void loop(){
  stepper1.step(-60);
  stepper2.step(-60);
  delay(300);
  hommotor1();
  hommotor2();
  delay(300);
  stepper1.step(60);
  stepper2.step(60);
  delay(300);
  hommotor1();
  hommotor2();
  delay(300);
}
void hommotor1(){
  int sensorValue = digitalRead(4);
  while (sensorValue == 0){
   int sensorValue = digitalRead(4);
    if (sensorValue == 1) {
      digitalWrite(13, HIGH);
      delay(300);
      break;
    }
    stepper1.step(1);

  }
digitalWrite(13, LOW);
}


void hommotor2(){
  int sensorValue = digitalRead(3);
  while (sensorValue == 0){
   int sensorValue = digitalRead(3);
    if (sensorValue == 1) {
      digitalWrite(13, HIGH);
      delay(300);
      break;
    }
    stepper2.step(-1);

  }
digitalWrite(13, LOW);
}



