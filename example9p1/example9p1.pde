/*
  Example 9.1
  Demonstrating an 8 x 8 LED matrix using 
  two 74HC595 shift registers
 
  http://tronixstuff.com/tutorials > Chapter 9
 
 */

int latchpin = 8; // connect to pin 12 on the '595
int clockpin = 7; // connect to pin 11 on the '595
int datapin = 10; // connect to pin 14 on the '595

int matrixrow[8] = {
  1,2,4,8,16,32,64,128};
int matrixcolumn[8] = {
  1,2,4,8,16,32,64,128};

void pixeldisplay(int row, int column, int holdtime)
// turns on and off a pixel at row, column - with delay 'holdtime'
{
  digitalWrite(latchpin, LOW);
  shiftOut(datapin, clockpin, MSBFIRST, matrixcolumn[column-1]); // sets the digit to address
  shiftOut(datapin, clockpin, MSBFIRST, matrixrow[row-1]); // clears the digit
  digitalWrite(latchpin, HIGH);
  delay(holdtime);
}

void rowdisplay(int row, int holdtime)
// turns on and off a row of LEDs with delay 'holdtime'
{
  digitalWrite(latchpin, LOW);
  shiftOut(datapin, clockpin, MSBFIRST, 255); // we want all the cathodes on, which is 11111111 in binary, 255 decimal
  shiftOut(datapin, clockpin, MSBFIRST, matrixrow[row-1]); // clears the digit
  digitalWrite(latchpin, HIGH);
  delay(holdtime);
} 

void columndisplay(int column, int holdtime)
// turns on and off a column of LEDs with delay 'holdtime'
{
  digitalWrite(latchpin, LOW);
  shiftOut(datapin, clockpin, MSBFIRST, matrixcolumn[column-1]); 
  shiftOut(datapin, clockpin, MSBFIRST, 255); // we want all the anodes on, which is 11111111 in binary, 255 decimal
  digitalWrite(latchpin, HIGH);
  delay(holdtime);
} 

void setup()
{
  pinMode(latchpin, OUTPUT);
  pinMode(clockpin, OUTPUT);
  pinMode(datapin, OUTPUT);
}

void loop()
{
  for (int a=1; a<9; a++)
  {
    for (int b=1; b<9; b++)
    {
      pixeldisplay(a,b,50);
    }
  }
  for (int a=1; a<9; a++)
  {
    for (int b=1; b<9; b++)
    {
      pixeldisplay(b,a,50);
    }
  }
  for (int zz=1; zz<11; zz++)
  {
    for (int a=1; a<9; a++)
    {
      rowdisplay(a, 50);
    }
    for (int a=1; a<9; a++)
    {
      columndisplay(a, 50);
    }
  }
}


