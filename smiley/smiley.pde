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
  lcd.setCursor(0, 0);
 // char dayy = Weekday(day());
  //lcd.print(dayy);

  lcd.setCursor(0, 1);
  // print the number of seconds since reset:
  lcd.print(hour());
  lcd.print(":");
  lcd.print(minute());
  lcd.print(":");
  lcd.print(second());
}
void Weekday (int dayNum) {
  // print a weekday, based on the day number
  switch (dayNum) {
  case 1:
    "Sunday";
    break;
  case 2:
    "Monday";
    break;
  case 3:
    "Tuesday";
    break;
  case 4:
    "Wednesday";
    break;
  case 5:
    "Thursday";
    break;
  case 6:
    "Friday";
    break;
  case 7:
    "Saturday";
    break;
  }
}







