#include <TimerOne.h>

/*

 Scrolling Digital Clock
 
 Paul Cox Dec 2010
 
 */
const int latchpin = 3;
//Pin connected to clock pin (SH_CP) of 74HC595
const int clockpin = 2;
////Pin connected to Data in (DS) of 74HC595
const int datapin = 4;

// device pins
byte rows[8] = {
  12,11,10,9,8,7,6,5};


// arduino pin mapping

byte screen[8] = {
  0, 0, 0, 0, 0, 0, 0, 0};
volatile byte screenRow = 0;
volatile byte screenCol = 0;

// big font
byte zero[] = {
  6,
  0B00000000,
  0B00111110,
  0B01111111,
  0B01000001,
  0B01111111,
  0B00111110
};

byte one[] = {
  5,
  0B00000000,
  0B01000100,
  0B01111111,
  0B01111111,
  0B01000000
};

byte two[] = {
  7,
  0B00000000,
  0B01100010,
  0B01110011,
  0B01011001,
  0B01001001,
  0B01101111,
  0B01100110
};

byte three[] = {
  7,
  0B00000000,
  0B00100010,
  0B01100011,
  0B01001001,
  0B01001001,
  0B01111111,
  0B00110110
};

byte four[] = {
  8,
  0B00000000,
  0B00011000,
  0B00011100,
  0B00010110,
  0B00010011,
  0B01111111,
  0B01111111,
  0B00010000
};

byte five[] = {
  7,
  0B00000000,
  0B00100111,
  0B01100111,
  0B01000101,
  0B01000101,
  0B01111101,
  0B00111001
};

byte six[] = {
  7,
  0B00000000,
  0B00111100,
  0B01111110,
  0B01001011,
  0B01001001,
  0B01111001,
  0B00110000
};

byte seven[] = {
  7,
  0B00000000,
  0B00000011,
  0B01100011,
  0B01110001,
  0B00011001,
  0B00001111,
  0B00000111
};

byte eight[] = {
  7,
  0B00000000,
  0B00110110,
  0B01111111,
  0B01001001,
  0B01001001,
  0B01111111,
  0B00110110,
};

byte nine[] = {
  7,
  0B00000000,
  0B00000110,
  0B01001111,
  0B01001001,
  0B01101001,
  0B00111111,
  0B00011110
};

byte colon[] = {
  3,
  0B00000000,
  0B00110110,
  0B00110110
};

byte space[] = {
  5,
  0B00000000,
  0B00000000,
  0B00000000,
  0B00000000,
  0B00000000
};

byte*  nums[] = { 
  zero, one, two, three, four,
  five, six, seven, eight, nine,
  colon, space };

int  time[] = {
  0,0,10,0,0,10,0,0,11,11,11,11,11,11,11};
int  iTimeIndex = 0;
int  iTimeMax = 15;
int  iCharIndex = 0;
int  iCharMax = 0;
int  iMillis = 0;

unsigned long   ulmSperS = 1000;
unsigned long   ulmSperM = (ulmSperS * 60);
unsigned long   ulmSperH = (ulmSperM * 60);

#define    REFRESH_INTERVAL      1
#define    UPDATE_INTERVAL       1

byte**  font = nums;
int matrixcolumnon[8] = {
  1,2,4,8,16,32,64,128};

int matrixcolumnof[8] = {
  0,0,0,0,0,0,0,0};
void setup()
{
  Timer1.initialize(REFRESH_INTERVAL);
  pinMode(latchpin, OUTPUT);
  pinMode(datapin, OUTPUT);  
  pinMode(clockpin, OUTPUT);

  for (int i=0; i<8; i++){
    pinMode(rows[i], OUTPUT);
  };
  Timer1.attachInterrupt(doubleBuffer);
  resetAnim();
}

void doubleBuffer()
{
  
  digitalWrite((rows[screenRow-1]), LOW);
  digitalWrite(latchpin, LOW);
  shiftOut(datapin, clockpin, MSBFIRST, matrixcolumnon[screenCol-1]);
  digitalWrite(latchpin, HIGH);




  screenCol++;
  if (screenCol >= 8)
  {
    screenCol = 0;
    screenRow++;
    if (screenRow >= 8)
    {
      screenRow = 0;
    }
  }

  if((screen[screenRow] >> screenCol) & B1 == B1)
  {
    digitalWrite((rows[screenRow-1]), HIGH);
    digitalWrite(latchpin, LOW);
    shiftOut(datapin, clockpin, MSBFIRST, matrixcolumnof[screenCol-1]);
    digitalWrite(latchpin, HIGH);
  }
  else
  {
    digitalWrite((rows[screenRow-1]), LOW);
    digitalWrite(latchpin, LOW);
    shiftOut(datapin, clockpin, MSBFIRST, matrixcolumnon[screenCol-1]);
    digitalWrite(latchpin, HIGH);
  }
}



void allOFF()
{
  for (int i = 0; i < 8; i++)
  {
    screen[i] = 0;
  }
}

void scrollLeft()
{
  for (int i = 0; i < 7; i++)
  {
    screen[i] = screen[i+1];
  }
}

void scrollRight()
{
  for (int i = 7; i > 0; i--)
  {
    screen[i] = screen[i-1];
  }
}

void makeTime()
{
  // calc hms since we started
  unsigned long  ulMillis = millis();
  int iHour = ulMillis / ulmSperH;
  int iMin = (ulMillis - (iHour * ulmSperH)) / ulmSperM;
  int iSec = (ulMillis - (iHour * ulmSperH) - (iMin * ulmSperM)) / ulmSperS;

  time[0] = floor(iHour / 10);
  time[1] = iHour - (time[0] * 10);

  time[3] = floor(iMin / 10);
  time[4] = iMin - (time[3] * 10);

  time[6] = floor(iSec / 10);
  time[7] = iSec - (time[6] * 10);
}

void on(byte row, byte column)
{
  screen[column-1] |= (B1 << (row - 1));
}

void off(byte row, byte column)
{
  screen[column-1] &= ~(B1 << (row - 1));
}

void resetAnim()
{
  for (int i = 0; i < 8; i++)
  {
    screen[i] = B11111111;
    delay(25);
  }
  for (int i = 0; i < 8; i++)
  {
    screen[i] = B00000000;
    delay(25);
  }
}

void loop()
{
  makeTime();
  drawTime();
  delay(UPDATE_INTERVAL);
  updateTime();
}

void drawTime()
{
  int    iLoop = 7;
  int    iC = iCharIndex;
  int    iCM = iCharMax;
  int    iT = iTimeIndex;

  while(iLoop >= 0)
  {
    screen[iLoop] = font[time[iT]][iC];
    iC++;
    if (iC > iCM)
    {
      iT++;
      if (iT >= iTimeMax)
      {
        iT = 0;
      }
      iC = 1;
      iCM = font[time[iT]][0];
    }
    iLoop--;
  }
}

void updateTime()
{
  iCharIndex++;
  if (iCharIndex > iCharMax)
  {
    iTimeIndex++;
    if (iTimeIndex >= iTimeMax)
    {
      iTimeIndex = 0;
    }
    iCharIndex = 1;
    iCharMax = font[time[iTimeIndex]][0];
  }
}


