
#include <LiquidCrystal.h>

LiquidCrystal lcd(8, 9, 4, 5, 6, 7);

int rval=0; 
int gval=0; 
int bval=0;

char buff[]= "0000000000";

void setup() {
  Serial.begin(9600);
  lcd.begin(16, 2);
  
}

void loop() {
  lcd.print("   ");
  lcd.setCursor(0, 0);
  int rr = map(rval, 0, 125, 0, 1024);
  int gg = map(gval, 0, 125, 0, 1024);
  lcd.print(rr);
  lcd.print("   ");
  lcd.setCursor(0, 1);
  
  lcd.print(gg);

  while (Serial.available()>0) {
    for (int i=0; i<10; i++) {
      buff[i]=buff[i+1];
    }
    buff[10]=Serial.read();
    if (buff[10]=='R') {
      rval=int(buff[9]);
    }
    if (buff[10]=='G') {
      gval=int(buff[9]);
    }
   

  }
  delay(10);
}


