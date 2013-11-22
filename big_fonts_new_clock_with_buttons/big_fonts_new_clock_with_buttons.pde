// include the library
#include <LiquidCrystal.h>
#include <Time.h>
// initialize the interface pins
LiquidCrystal lcd(8, 9, 4, 5, 6, 7);
int  adc_key_val[5] ={
  30, 150, 360, 535, 760 };
int NUM_KEYS = 5;
int adc_key_in;
int key=-1;
int oldkey=-1;

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
  B11111,
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
  B00000,
  B00000
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
  setTime(11,50,00,2,8,2011);
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
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(7);
  lcd.write(0);  // call each segment to create

  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(7);
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
  lcd.write(3);  // call each segment to create
  lcd.write(0);
}

void c4()
{ // uses segments to build the number 0
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(6);  // call each segment to create
  lcd.write(0);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(7);
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
  lcd.write(7);
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
  lcd.print(".");  // call each segment to create

  lcd.setCursor(x+1, 1); // set cursor to colum 0, line 1 (second row)
  lcd.print(".");  // call each segment to create

  //dig[11]={c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,cdot};


}


void loop()
{
  int h = hourFormat12();

  int m = minute();
  int s = second();

  int h1 = h/ 10;
  int h2 = h % 10; 
  int m1 = m/ 10;
  int m2 = m % 10; 
  int s1 = s/ 10;
  int s2 = s % 10; 

  x=0;
  charr(h1);
  x=2;
  charr(h2);

  x=4;
  cdot();

  x=6;
  charr(m1);
  x=8;
  charr(m2);

  x=10;
  cdot();


  x=12;
  charr(s1);
  x=14;
  charr(s2);

  adc_key_in = analogRead(0);
  key = get_key(adc_key_in);

  if (key != oldkey)				    // if keypress is detected
  {
    delay(50);		// wait for debounce time
    adc_key_in = analogRead(0);    // read the value from the sensor  
    key = get_key(adc_key_in);		        // convert into key press
    if (key != oldkey)				
    {			

      switch(key){
      case 1:



        adjustTime(-60);
        delay(100);
        break;


      case 2:


        adjustTime(+60);
        delay(100);
        break;  

      case 3:


        adjustTime(-3600);
        delay(100);
        break;



      case 0:


        adjustTime(+3600);
        delay(100);
        break;

      }
    }
  }





} 

void charr (int digi) {
  // print a weekday, based on the day number
  switch (digi) {
  case 0:
    c0();
    break;
  case 1:
    c1();
    break;
  case 2:
    c2();
    break;
  case 3:
    c3();
    break;
  case 4:
    c4();
    break;
  case 5:
    c5();
    break;
  case 6:
    c6();
    break;
  case 7:
    c7();
    break;
  case 8:
    c8();
    break;
  case 9:
    c9();
    break;

  }
}

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














