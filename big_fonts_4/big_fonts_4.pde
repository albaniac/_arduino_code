// include the library
#include <LiquidCrystal.h>

// initialize the interface pins
LiquidCrystal lcd(8, 9, 4, 5, 6, 7);

// the 8 arrays that form each segment of the custom numbers
byte s0[8] = {
 B11111,
	B11111,
	B11111,
	B11111,
	B11111,
	B11111,
	B11111,
	B11111
};
byte s1[8] = {
B11111,
	B00000,
	B00000,
	B00000,
	B00000,
	B00000,
	B00000,
	B00000
};
byte s2[8] = {
B11111,
	B11100,
	B11100,
	B11100,
	B11100,
	B11100,
	B11111,
	B11111
};

byte s3[8] = {
B11111,
	B00000,
	B00000,
	B00000,
	B00000,
	B00000,
	B11111,
	B11111
};
byte s4[8] = {
  B00111,
  B00111,
  B00111,
  B00111,
  B00111,
  B00111,
  B11111,
  B11111
};
byte s5[8] = {
  B11111,
  B11111,
  B11100,
  B11100,
  B11100,
  B11100,
  B11100,
  B11100
};
byte s6[8] = {
  B11100,
  B11100,
  B11100,
  B11100,
  B11100,
  B11100,
  B11111,
  B11111
};
byte s7[8] = {
  B00000,
  B00000,
  B00000,
  B00000,
  B00000,
  B00000,
  B11111,
  B11111
};





// loop counter
int x = 0;


void setup()
{
  // assignes each segment a write number
  lcd.createChar(0,s0);
  lcd.createChar(1,s1);
  lcd.createChar(2,s2);
  lcd.createChar(3,s3);
  lcd.createChar(4,s4);
  lcd.createChar(5,s5);
  lcd.createChar(6,s6);
  lcd.createChar(7,s7);



  // sets the LCD's rows and colums:
  lcd.begin(16, 2);
lcd.clear();
}

void c0()
{ // uses segments to build the number 0
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(5);  // call each segment to create
  lcd.write(0);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(6);  // call each segment to create
  lcd.write(4);

}
void c1()
{ // uses segments to build the number 0
  lcd.setCursor(x+1, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(0);  // call each segment to create

  lcd.setCursor(x+1, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(0);  // call each segment to create

}
void c2()
{ // uses segments to build the number 0
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(3);  // call each segment to create
  lcd.write(0);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(2);  // call each segment to create
  lcd.setCursor(x+1, 1);
  lcd.write(3);

}
void c3()
{ // uses segments to build the number 0
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(3);  // call each segment to create
  lcd.write(0);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(7);  // call each segment to create
  lcd.write(0);
}

void c4()
{ // uses segments to build the number 0
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(6);  // call each segment to create
  lcd.write(0);
  lcd.setCursor(x+1, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(0);  // call each segment to create

}

void c5()
{ // uses segments to build the number 0
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(5);  // call each segment to create
  lcd.write(1);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(3);  // call each segment to create
  lcd.write(0);
}

void c6()
{ // uses segments to build the number 0
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(5);  // call each segment to create
  lcd.write(1);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(0);  // call each segment to create
  lcd.write(4);
}

void c7()
{ // uses segments to build the number 0
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(1); 
  //lcd.setCursor(x+1, 0); // call each segment to create
  lcd.write(0);
  lcd.setCursor(x+1, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(0);  // call each segment to create

}

void c8()
{ // uses segments to build the number 0
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(2);  // call each segment to create
  lcd.write(0);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(6);  // call each segment to create
  lcd.setCursor(x+1, 1);
  lcd.write(0);

}

void c9()
{ // uses segments to build the number 0
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(5);  // call each segment to create
  lcd.write(0);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(3);
  lcd.setCursor(x+1, 1);// call each segment to create
  lcd.write(0);
}

void cdot()
{ // uses segments to build the number 0
  lcd.setCursor(x+1, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(7);  // call each segment to create

  lcd.setCursor(x+1, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(1);  // call each segment to create


}


void loop()
{
  c0();    // displays custom 0 on the LCD
  x = x + 2;    // sifts cursor over 4 columns
  c1();
  x = x + 2;
  c2();
  x = x + 2;
  c3();
  x = x + 2;
  c4();
  x = x + 2;

  cdot();
  delay(4000);
  lcd.clear();
  x = 0;
  c5();
  x = x + 2;
  c6();    // displays custom 0 on the LCD
  x = x + 2;    // sifts cursor over 4 columns
  c7();
  x = x + 2;
  c8();
  x = x + 2;
  c9();
  x = x + 2;

  cdot();
  delay(4000);
  lcd.clear();
  x = 0;





} 









