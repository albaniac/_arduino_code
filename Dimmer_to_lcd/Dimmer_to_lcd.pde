#include <LiquidCrystal.h>
#include <Time.h>
// initialize the interface pins
LiquidCrystal lcd(8, 9, 4, 5, 6, 7);

const int ledPin = 9;      // the pin that the LED is attached to

void setup()
{
  // initialize the serial communication:
  Serial.begin(9600);
  // initialize the ledPin as an output:
  pinMode(ledPin, OUTPUT);
  lcd.begin(16, 2);
  lcd.clear();
  
}

void loop() {
   int brightness;

  // check if data has been sent from the computer:
  if (Serial.available()) {
    // read the most recent byte (which will be from 0 to 255):
    brightness = Serial.read();
    // set the brightness of the LED:
    lcd.setCursor(0, 0);
    lcd.print(brightness);
    //analogWrite(ledPin, brightness);
  }
}


