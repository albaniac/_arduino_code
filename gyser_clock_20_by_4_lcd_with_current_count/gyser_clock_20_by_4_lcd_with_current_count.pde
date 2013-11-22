// include the library


#include <WProgram.h>
#include <avr/pgmspace.h>
//#include <IRremote.h>
#include <DS1307RTC.h>
#include <FrequencyTimer2.h>
double value;

#include <Wire.h>

#include <LiquidCrystal.h>
#include <Time.h>
// initialize the interface pins
LiquidCrystal lcd(7, 8, 9, 10, 11, 12);
const int ledPin =  6; 
const int triggerPin =  3; 
int trip_delay = 300000;

// power values
//Constants to convert ADC divisions into mains current values.
double ADCvoltsperdiv = 0.0048;
double VDoffset = 2.4476; //Initial value (corrected as program runs)

//Equation of the line calibration values
double factorA = 15.2; //factorA = CT reduction factor / rsens
double Ioffset = -0.08;

//Constants set voltage waveform amplitude.
double SetV = 230.0;

//Counter
int i=0;

int samplenumber = 4000;

//Used for calculating real, apparent power, Irms and Vrms.
double sumI=0.0;

int sum1i=0;
double sumVadc=0.0;

double Vadc,Vsens,Isens,Imains,sqI,Irms;
double apparentPower;

// power values complete


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
  B00000,
  B00000,
  B00000,
  B00000,
  B00000,
  B00000,
  B11111,
  B11111,

};
byte s2[8] = {

  B11111,
  B11111,
  B11111,
  B00000,
  B00000,
  B00000,
  B00000,
  B00000,
};

byte s3[8] = {
  B11000,
  B11100,
  B11110,
  B11111,
  B11111,
  B11111,
  B11111,
  B11111
};
byte s4[8] = {
  B00011,
  B00111,
  B01111,
  B11111,
  B11111,
  B11111,
  B11111,
  B11111
};
byte s5[8] = {
  B11111,
  B11111,
  B11111,
  B11111,
  B11111,
  B11110,
  B11100,
  B11000
};
byte s6[8] = {
  B11111,
  B11111,
  B11111,
  B11111,
  B11111,
  B01111,
  B00111,
  B00011
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

  Wire.begin();
  setSyncProvider(RTC.get);
  setSyncInterval(10000);

  lcd.createChar(0,s0);
  lcd.createChar(1,s1);
  lcd.createChar(2,s2);
  lcd.createChar(3,s3);
  lcd.createChar(4,s4);
  lcd.createChar(5,s5);
  lcd.createChar(6,s6);
  lcd.createChar(7,s7);



  // sets the LCD's rows and colums:
  lcd.begin(20, 4);
  lcd.clear();
  pinMode(triggerPin, OUTPUT); 
  pinMode(ledPin, OUTPUT); 


}

void c0()
{ // uses segments to build the number 0
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(4);  // call each segment to create
  lcd.write(2);
  lcd.write(3);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(0);  // call each segment to create
  lcd.write(7);
  lcd.write(0);
  lcd.setCursor(x, 2);
  lcd.write(6);  // call each segment to create
  lcd.write(1);
  lcd.write(5);




}
void c1()
{ // uses segments to build the number 1
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(7);  // call each segment to create
  lcd.write(7);
  lcd.write(3);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(7);  // call each segment to create
  lcd.write(7);
  lcd.write(0);
  lcd.setCursor(x, 2);
  lcd.write(7);  // call each segment to create
  lcd.write(7);
  lcd.write(6);

}
void c2()
{ // uses segments to build the number 2
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(2);  // call each segment to create
  lcd.write(2);
  lcd.write(3);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(1);  // call each segment to create
  lcd.write(1);
  lcd.write(5);
  lcd.setCursor(x, 2);
  lcd.write(0);  // call each segment to create
  lcd.write(1);
  lcd.write(1);

}
void c3()
{ // uses segments to build the number 3
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(2);  // call each segment to create
  lcd.write(2);
  lcd.write(3);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(1);  // call each segment to create
  lcd.write(1);
  lcd.write(0);
  lcd.setCursor(x, 2);
  lcd.write(1);  // call each segment to create
  lcd.write(1);
  lcd.write(5);
}

void c4()
{ // uses segments to build the number 4
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(0);  // call each segment to create
  lcd.write(7);
  lcd.write(3);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(6);  // call each segment to create
  lcd.write(1);
  lcd.write(0);
  lcd.setCursor(x, 2);
  lcd.write(7);  // call each segment to create
  lcd.write(7);
  lcd.write(0);

}

void c5()
{ // uses segments to build the number 5
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(4);  // call each segment to create
  lcd.write(2);
  lcd.write(2);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(6);  // call each segment to create
  lcd.write(1);
  lcd.write(1);
  lcd.setCursor(x, 2);
  lcd.write(1);  // call each segment to create
  lcd.write(1);
  lcd.write(5);
}

void c6()
{ // uses segments to build the number 6
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(4);  // call each segment to create
  lcd.write(2);
  lcd.write(2);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(0);  // call each segment to create
  lcd.write(2);
  lcd.write(3);
  lcd.setCursor(x, 2);
  lcd.write(6);  // call each segment to create
  lcd.write(1);
  lcd.write(5);

}

void c7()
{ // uses segments to build the number 7
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(2);  // call each segment to create
  lcd.write(2);
  lcd.write(3);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(7);  // call each segment to create
  lcd.write(7);
  lcd.write(0);
  lcd.setCursor(x, 2);
  lcd.write(7);  // call each segment to create
  lcd.write(7);
  lcd.write(0);

}

void c8()
{ // uses segments to build the number 0
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(4);  // call each segment to create
  lcd.write(2);
  lcd.write(3);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(0);  // call each segment to create
  lcd.write(1);
  lcd.write(0);
  lcd.setCursor(x, 2);
  lcd.write(6);  // call each segment to create
  lcd.write(1);
  lcd.write(5);

}

void c9()
{ // uses segments to build the number 0
  lcd.setCursor(x, 0); // set cursor to column 0, line 0 (first row)
  lcd.write(4);  // call each segment to create
  lcd.write(2);
  lcd.write(3);
  lcd.setCursor(x, 1); // set cursor to colum 0, line 1 (second row)
  lcd.write(6);  // call each segment to create
  lcd.write(1);
  lcd.write(0);
  lcd.setCursor(x, 2);
  lcd.write(1);  // call each segment to create
  lcd.write(1);
  lcd.write(5);
}

void cdot()
{ // uses segments to build the number 0
  lcd.setCursor(x, 1); // set cursor to column 0, line 0 (first row)
  lcd.print(".");  // call each segment to create

  lcd.setCursor(x, 2); // set cursor to colum 0, line 1 (second row)
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
  x=3;
  charr(h2);

  x=6;
  cdot();

  x=7;
  charr(m1);
  x=10;
  charr(m2);

  x=13;
  cdot();


  x=14;
  charr(s1);
  x=17;
  charr(s2);

  value = analogRead(A5);

  // current calculations
  //Summing counter
  i++;

  //Voltage at ADC
  Vadc = value * ADCvoltsperdiv;

  //Remove voltage divider offset
  Vsens = Vadc-VDoffset;

  //Current transformer scale to find Imains
  Imains = Vsens;

  //Calculates Voltage divider offset.
  sum1i++; 
  sumVadc = sumVadc + Vadc;
  if (sum1i>=1000) {
    VDoffset = sumVadc/sum1i; 
    sum1i = 0; 
    sumVadc=0.0;
  }

  //Root-mean-square method current
  //1) square current values
  sqI = Imains*Imains;
  //2) sum 
  sumI=sumI+sqI;

  if (i>=samplenumber) 
  {  
    i=0;
    //Calculation of the root of the mean of the current squared (rms)
    Irms = factorA*sqrt(sumI/samplenumber)+Ioffset;

    //Calculation of the root of the mean of the voltage squared (rms)                     
    apparentPower = Irms * SetV;

    lcd.setCursor(0, 4);
    lcd.print("Gys on");
    lcd.setCursor(7, 4);
    lcd.print("I=");
    lcd.print(Irms);

    digitalWrite(triggerPin,HIGH);
    digitalWrite(ledPin,HIGH);
    sumI=0.0;

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
















