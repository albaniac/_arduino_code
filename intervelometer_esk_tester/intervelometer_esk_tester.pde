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
const int analogInPin1 = 0;
const int analogInPin2 = 1;

int sensorValue1 = 0; 
int sensorValue2 = 0;
// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(8, 9, 4, 5, 6, 7);
int interval = 3000;
int num = 0;
const int triggerPin =  2;
void setup() {
  // set up the LCD's number of columns and rows: 
  lcd.begin(8, 2);
  // Print a message to the LCD.
   pinMode(triggerPin, OUTPUT); 
}

void loop() {
  
  sensorValue1 = analogRead(analogInPin1);
  
  
  sensorValue2 = analogRead(analogInPin2);
  // set the cursor to column 0, line 1
  // (note: line 1 is the second row, since counting begins with 0):
  lcd.setCursor(0, 0);
  // print the number of seconds since reset:
  lcd.print("i=");
  int secs = interval/1000;
  lcd.print(sensorValue1);
  lcd.setCursor(5, 0);
  lcd.print("sec");
  
 
  lcd.setCursor(0, 1);
  // print the number of seconds since reset:
  lcd.print("no=");
  lcd.print(sensorValue2);
  
  //digitalWrite(triggerPin, HIGH);
  lcd.setCursor(7, 1);
  lcd.print("+");
  //delay(1000);
 // digitalWrite(triggerPin, LOW);
  lcd.setCursor(7, 1);
  lcd.print("-");
  
  //num = num+1;
  //delay (interval);
  
  
}

