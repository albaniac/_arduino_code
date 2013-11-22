
/* intervalometer Copywrite 2011 ekaggrat singh kalsi*/


#include <LiquidCrystal.h>
#include <IRremote.h>


int RECV_PIN = 12;
int sensorValue1 = 0; 
IRrecv irrecv(RECV_PIN);

decode_results results;


const int button2 = 10;
const int button1 = 11;

const int ledPin =  13; 
const int triggerPin =  2; 
unsigned long last_tm = 0;

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
  irrecv.enableIRIn();
}

void loop() {

  sensorValue1 = analogRead(1);
  int bState1 = digitalRead(button1);
  int bState2 = digitalRead(button2);

  //interval = sensorValue1;
  unsigned long interval = map(sensorValue1,0,1024,1,3000); 
  //unsigned long interval = (sensorValue1); 
  unsigned long interTime = interval * 1000;




  lcd.setCursor(0, 0);

  lcd.print("i=");

  lcd.setCursor(2, 0);
  float  secc = interval;

  if (secc > 60){
    secc = secc/60;
    String p = "m";
    lcd.print(secc);
    lcd.print(" ");
    lcd.setCursor(7, 0);
    lcd.print("m");


  }
  else if  (secc < 60){
    secc = secc / 1 ;
    String p = "s";
    lcd.print(secc);
    lcd.print(" ");
    lcd.setCursor(7, 0);
    lcd.print("s");

  }
  lcd.setCursor(0, 1);
  lcd.print("n=");
  lcd.print("0");
  lcd.print(" ");

  if (irrecv.decode(&results)) {

    unsigned long codd = results.value;
    //Serial.println(codd);
    if (codd == 16728255){
      digitalWrite(ledPin,HIGH);
     digitalWrite(triggerPin,HIGH);
        delay(500);
    }
    irrecv.resume(); // Receive the next value
  }






  if (bState1 == HIGH) {
    digitalWrite(ledPin,HIGH);


    num=0;
    lcd.setCursor(0, 1);
    lcd.print("n=");
    lcd.print("0");

    lcd.setCursor(4, 1);
    lcd.print("   ");

    last_tm = millis();
    lcd.setCursor(5, 1);
    lcd.print("   ");

    while(bState2 == LOW){

      if( millis() - last_tm > interTime ){
        last_tm = millis();
        digitalWrite(ledPin,HIGH);
        digitalWrite(triggerPin,HIGH);
        delay(500);

        int bState2 = digitalRead(button2);
        if (bState2 == HIGH){
          break;
          last_tm = millis();
        }


        num = num + 1; 

        lcd.setCursor(0, 1);

        lcd.print("n=");
        lcd.print(num);
        lcd.print(" ");
        lcd.setCursor(5, 1);
        lcd.print("   ");

      }

      digitalWrite(ledPin,LOW);
      digitalWrite(triggerPin,LOW);


      lcd.setCursor(5, 1);
      lcd.print((millis()-last_tm)/1000);

      bState2 = digitalRead(button2);

      if (bState2 == HIGH){
        break;
        last_tm = millis();
      }
    }
  }

  else{
    digitalWrite(ledPin,LOW);
    digitalWrite(triggerPin,LOW);

  }
}


























