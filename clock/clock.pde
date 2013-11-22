#include <Time.h>



// include the library code:
#include <LiquidCrystal.h>

// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(8, 9, 4, 5, 6, 7);


void setup() {
  // set up the LCD's number of columns and rows: 
  lcd.begin(16, 2);
  // Print a message to the LCD.
  //char dayy;
  setTime(11,50,00,2,8,2011);

}

void loop() {
  // set the cursor to column 0, line 1
  // (note: line 1 is the second row, since counting begins with 0):
    int h = hour();
int m = minute();
int s = second();
  
  
  lcd.setCursor(0, 0);
  // char dayy = Weekday(day());
  //lcd.print(dayy);

  lcd.setCursor(0, 1);
  // print the number of seconds since reset:
  lcd.print(h);
  lcd.print(":");
  lcd.print(m);
  lcd.print(":");
  lcd.print(s);
  lcd.setCursor(0, 0);
  printWeekday(day());
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







