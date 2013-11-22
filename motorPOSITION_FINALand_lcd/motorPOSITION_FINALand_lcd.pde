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
#include <LiquidCrystal.h>
const int analogInPin1 = 1;
const int analogInPin2 = 2;
int sensorValue1 = 0; 
int sensorValue2 = 0; // value read from the pot
int smap1;
int smap2;
// change this to the number of steps on your motor
#define STEPS 2048
#define COIL1 2
#define COIL2 3
#define COIL3 4
#define COIL4 5


// create an instance of the stepper class, specifying
// the number of steps of the motor and the pins it's
// attached to
Stepper stepper(STEPS, 10, 11, 12, 13);
LiquidCrystal lcd(8, 9, 4, 5, 6, 7);
// the previous reading from the analog input
int previous = 0;

void setup()
{
  // set the speed of the motor to 30 RPMs
  stepper.setSpeed(9);
   lcd.begin(16, 2);
}

void loop()
{
  sensorValue1 = analogRead(analogInPin1);
  smap1 = map(sensorValue1, 0, 1023, 0, 300);
  sensorValue2 = analogRead(analogInPin2);
  smap2 = map(sensorValue2, 0, 1023, 0, 300);
  lcd.setCursor(0, 0);
  lcd.print(smap1);
   lcd.setCursor(0, 1);
  lcd.print(smap2);
  
  
  
  
  
  
  
  
  
  // get the sensor value
  int vval = analogRead(1)*2;
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

