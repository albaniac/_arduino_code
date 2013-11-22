/*
 * MotorKnob
 *
 * A stepper motor follows the turns of a potentiometer
 * (or other sensor) on analog input 0.
 *
 * http://www.arduino.cc/en/Reference/Stepper
 * This example code is in the public domain.
 */

#include <Stepper.h>

// change this to the number of steps on your motor
#define STEPS 2048
#define COIL1 2
#define COIL2 3
#define COIL3 4
#define COIL4 5


// create an instance of the stepper class, specifying
// the number of steps of the motor and the pins it's
// attached to
Stepper stepper(STEPS, 2, 3, 4, 5);

// the previous reading from the analog input
int previous = 0;

void setup()
{
  // set the speed of the motor to 30 RPMs
  stepper.setSpeed(9);
}

void loop()
{
  // get the sensor value
  int vval = analogRead(0)*2;
  if ((vval - previous)!= 0){
    // move a number of steps equal to the change in the
    // sensor reading
    stepper.step(vval - previous);

  }
  else {
    digitalWrite(COIL1,LOW);
    digitalWrite(COIL2,LOW);
    digitalWrite(COIL3,LOW);
    digitalWrite(COIL4,LOW);
  }


  // remember the previous value of the sensor
  previous = vval;
}

