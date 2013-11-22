#include <Time.h>





//example use of LCD4Bit_mod library


#include <LCD4Bit_mod.h> 
//create object to control an LCD.  
//number of lines in display=1
LCD4Bit_mod lcd = LCD4Bit_mod(2); 

//Key message
char msgs[5][15] = {
  "Right Key OK ", 
  "Up Key OK    ", 
  "Down Key OK  ", 
  "Left Key OK  ", 
  "Select Key OK" };
int  adc_key_val[5] ={
  30, 150, 360, 535, 760 };
int NUM_KEYS = 5;
int adc_key_in;
int key=-1;
int oldkey=-1;

void setup() { 
  pinMode(13, OUTPUT);  //we'll use the debug LED to output a heartbeat

  lcd.init();
  //optionally, now set up our application-specific display settings, overriding whatever the lcd did in lcd.init()
  //lcd.commandWrite(0x0F);//cursor on, display on, blink on.  (nasty!)
  lcd.clear();


}

void loop() {

  lcd.cursorTo(1,0);
  lcd.printIn(hour());
  lcd.cursorTo(2, 0);  //line=2, x=0
  lcd.printIn("tanu loves esk");









}





