/*
  LiquidCrystal Library - Hello World
 
 Demonstrates the use a 16x2 LCD display.  The LiquidCrystal
 library works with all LCD displays that are compatible with the 
 Hitachi HD44780 driver. There are many of them out there, and you
 can usually tell them by the 16-pin interface.
 
 This sketch prints "Hello World!" to the LCD
 and shows the time.
 
  The circuit:
 * LCD RS pin to digital pin 12
 * LCD Enable pin to digital pin 11
 * LCD D4 pin to digital pin 5
 * LCD D5 pin to digital pin 4
 * LCD D6 pin to digital pin 3
 * LCD D7 pin to digital pin 2
 * LCD R/W pin to ground
 * 10K resistor:
 * ends to +5V and ground
 * wiper to LCD VO pin (pin 3)
 
 Library originally added 18 Apr 2008
 by David A. Mellis
 library modified 5 Jul 2009
 by Limor Fried (http://www.ladyada.net)
 example added 9 Jul 2009
 by Tom Igoe
 modified 22 Nov 2010
 by Tom Igoe
 
 This example code is in the public domain.

 http://www.arduino.cc/en/Tutorial/LiquidCrystal
 */

// include the library code:
#include <LiquidCrystal.h>
const int analogInPin1 = 1;
const int analogInPin2 = 2; // Analog input pin that the potentiometer is attached to
 // Analog output pin that the LED is attached to

int sensorValue1 = 0; 
int sensorValue2 = 0; // value read from the pot
int smap1;
int smap2;



// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(8, 9, 4, 5, 6, 7);

void setup() {
   
  lcd.begin(16, 2);
  
 
}

void loop() {
  sensorValue1 = analogRead(analogInPin1);
  smap1 = map(sensorValue1, 0, 1023, 0, 300);
  sensorValue2 = analogRead(analogInPin2);
  smap2 = map(sensorValue2, 0, 1023, 0, 300);
  lcd.setCursor(0, 0);
  lcd.print(smap1);
   lcd.setCursor(0, 1);
  lcd.print(smap2);
  
}

