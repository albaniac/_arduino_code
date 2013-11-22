#include <Time.h>



// include the library code:
#include <LiquidCrystal.h>

// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(8, 9, 4, 5, 6, 7);
int  adc_key_val[5] ={
  30, 150, 360, 535, 760 };
int NUM_KEYS = 5;
int adc_key_in;
int key=-1;
int oldkey=-1;

void setup() {
  // set up the LCD's number of columns and rows: 
  lcd.begin(16, 2);
  // Print a message to the LCD.
  //char dayy;
  setTime(11,50,00,2,8,2011);
  Serial.begin(9600);
}

void loop() {
  // set the cursor to column 0, line 1
  // (note: line 1 is the second row, since counting begins with 0):
  int h = hourFormat12();
  int m = minute();
  int s = second();
  
  int h1 = h/ 10;
  int h2 = h % 10; 
  int m1 = m/ 10;
  int m2 = m % 10; 
  int s1 = s/ 10;
  int s2 = s % 10; 





  lcd.setCursor(7, 1);
  // print the number of seconds since reset:
  
  lcd.print(h1);
  lcd.print(h2);
  lcd.setCursor(9, 1);
  lcd.print(":");
  lcd.setCursor(10, 1);
  lcd.print(m1);
  lcd.print(m2);
  lcd.setCursor(12, 1);
  lcd.print(":");
  lcd.setCursor(13, 1);
  lcd.print(s1);
  lcd.print(s2);
  lcd.setCursor(0, 0);
  printWeekday(day());

  adc_key_in = analogRead(0);    // read the value from the sensor  
  digitalWrite(13, HIGH);  
  key = get_key(adc_key_in);		        // convert into key press

  if (key != oldkey)				    // if keypress is detected
  {
    delay(50);		// wait for debounce time
    adc_key_in = analogRead(0);    // read the value from the sensor  
    key = get_key(adc_key_in);		        // convert into key press
    if (key != oldkey)	{
      switch(key){
      case 1:

        lcd.setCursor(0, 1); 
        lcd.print("       ");
        lcd.setCursor(0, 1);  //line=2, x=0
        lcd.print("up");
        Serial.println(key);
        adjustTime(-60);
        delay(100);
        break;


      case 2:

        lcd.setCursor(0, 1);
        lcd.print("       ");
        lcd.setCursor(0, 1);   //line=2, x=0
        lcd.print("down");
        Serial.println(key);
        adjustTime(+60);
        delay(100);
        break;  

      case 3:

        lcd.setCursor(0, 1);
        lcd.print("       ");
        lcd.setCursor(0, 1);  //line=2, x=0
        lcd.print("left"); 
        Serial.println(key);
        adjustTime(-3600);
        delay(100);
        break;

      case 4:

        lcd.setCursor(0, 1); 
        lcd.print("       ");
        lcd.setCursor(0, 1);  //line=2, x=0
        lcd.print("select");
        Serial.println(key);
        adjustTime(+86400);
        delay(1000);
        break;

      case 0:

        lcd.setCursor(0, 1);
        lcd.print("       ");
        lcd.setCursor(0, 1);         //line=2, x=0
        lcd.print("right");
        Serial.println(key);
        adjustTime(+3600);
        delay(100);
        break;

      }

    }
  }

  //delay(1000);
  digitalWrite(13, LOW);
}
// Convert ADC value to key number
int get_key(unsigned int input)
{
  int k;

  for (k = 0; k < NUM_KEYS; k++)
  {
    if (input < adc_key_val[k])
    {

      return k;
    }
  }

  if (k >= NUM_KEYS)
    k = -1;     // No valid key pressed

  return k;
}







void printWeekday (int dayNum) {
  // print a weekday, based on the day number
  switch (dayNum) {
  case 1:
    lcd.print ("Sunday");
    break;
  case 2:
    lcd.print ("Monday");
    break;
  case 3:
    lcd.print ("Tuesday");
    break;
  case 4:
    lcd.print ("Wednesday");
    break;
  case 5:
    lcd.print ("Thursday");
    break;
  case 6:
    lcd.print ("Friday");
    break;
  case 7:
    lcd.print ("Saturday");
    break;
  }
}













