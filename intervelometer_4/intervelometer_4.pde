


#include <LiquidCrystal.h>


int sensorValue1 = 0; 

const int button1 = 11;
const int button2 = 10;
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

  //interval = sensorValue1;
  interval = map(sensorValue1, 0, 1023, 0, 1000); 
  unsigned long interTime = interval * 1000;




  lcd.setCursor(0, 0);

  lcd.print("i=");

  lcd.setCursor(3, 0);
  int  sec = interval;
  lcd.print(sec);
  lcd.print(" ");
  lcd.setCursor(7, 0);
  lcd.print("s");

  lcd.setCursor(0, 1);

  lcd.print("no=");

  lcd.print("0");
  lcd.print(" ");



  if (bState1 == HIGH) {
    digitalWrite(ledPin,HIGH);
    //digitalWrite(triggerPin,HIGH);
    interval = map(sensorValue1, 0, 1023, 0, 1000); 
    unsigned long interTime = interval*1000;
    num=0;
    lcd.setCursor(0, 1);
    lcd.print("no=");
    lcd.print("0");



    while(bState2 == LOW){
      digitalWrite(ledPin,HIGH);
      digitalWrite(triggerPin,HIGH);
      delay(500);

      int bState2 = digitalRead(button2);

      if (bState2 == HIGH){
        break;
      }


      digitalWrite(ledPin,LOW);
      digitalWrite(triggerPin,LOW);
      num = num + 1;
      //delay(interTime);
      

      for(int i= 0; i < interTime; i++){
        delay(1);
        bState2 = digitalRead(button2);
         if (bState2 == HIGH){
          break;
        }
        
       // lcd.setCursor(3, 1);
       // lcd.print(i);
       // lcd.print(" ");
       
      }

      lcd.setCursor(0, 1);

      lcd.print("no=");
      lcd.print(num);
      lcd.print(" ");


      bState2 = digitalRead(button2);

      if (bState2 == HIGH){
        break;
      }


    }
  }

  else{
    digitalWrite(ledPin,LOW);
    //digitalWrite(triggerPin,LOW);

  }




}













