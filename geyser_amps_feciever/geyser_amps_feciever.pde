
/* intervalometer Copywrite 2011 ekaggrat singh kalsi*/


#include <LiquidCrystal.h>


int sensorValue1 = 0; 


const int ledPin =  13; 
const int triggerPin =  3; 


// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(7, 8, 9, 10, 11, 12);
int interval = 0;
int num = 0;

void setup() {
  // set up the LCD's number of columns and rows: 
  lcd.begin(8, 2);
  // Print a message to the LCD.
  pinMode(triggerPin, OUTPUT); 
 pinMode(ledPin, OUTPUT); 

}

void loop() {

  sensorValue1 = analogRead(1);
 

  //interval = sensorValue1;
  unsigned long interval = map(sensorValue1,0,1024,1,3000); 
  //unsigned long interval = (sensorValue1); 
  unsigned long interTime = interval * 1000;




  lcd.setCursor(0, 0);

}
























