


#include <LiquidCrystal.h>


int sensorValue1 = 0; 

const int button1 = 10;
const int button2 = 11;
const int ledPin =  13; 
const int triggerPin =  2; 

// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(8, 9, 4, 5, 6, 7);
int interval = 0;
int num = 0;

void setup() {
  // set up the LCD's number of columns and rows: 
  lcd.begin(8, 2);
  // Print a message to the LCD.
  pinMode(triggerPin, OUTPUT); 
  pinMode(button1, INPUT);
  pinMode(button2, INPUT);
  
}

void loop() {




  sensorValue1 = analogRead(1);
int bState1 = digitalRead(button1);
int bState2 = digitalRead(button2);






  
  // set the cursor to column 0, line 1
  // (note: line 1 is the second row, since counting begins with 0):
  lcd.setCursor(0, 0);
  // print the number of seconds since reset:
  lcd.print("i=");
  int secs = interval/1000;
 
  
  lcd.print(bState1);
  lcd.setCursor(5, 0);
  lcd.print(bState2);
 if (bState1 == HIGH) {
   digitalWrite(ledPin,HIGH);
   digitalWrite(triggerPin,HIGH);
   
   
 }
 else if(bState2 == HIGH){
   digitalWrite(ledPin,HIGH);
 }


 else{
   digitalWrite(ledPin,LOW);
    digitalWrite(triggerPin,LOW);
   
 }


  lcd.setCursor(0, 1);
  // print the number of seconds since reset:
  lcd.print("no=");
  lcd.print(sensorValue1);

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






