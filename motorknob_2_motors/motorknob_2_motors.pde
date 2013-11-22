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

// create an instance of the stepper class, specifying
// the number of steps of the motor and the pins it's
// attached to
Stepper stepper1(STEPS, 4, 5, 6, 7);
Stepper stepper2(STEPS, 8, 9, 10, 11);

// the previous reading from the analog input
int previous1 = 0;
int previous2 = 0;
void setup()
{
  // set the speed of the motor to 30 RPMs
  stepper1.setSpeed(5);
  stepper2.setSpeed(5);
}

void loop()
{
  // get the sensor value
  int val1 = analogRead(0);
  int val2 = analogRead(1);
  // move a number of steps equal to the change in the
  // sensor reading
  stepper1.step(val1 - previous1);
  stepper2.step(val2 - previous2);

  // remember the previous value of the sensor
  previous1 = val1;
  previous2 = val2;
}

