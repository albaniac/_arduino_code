/*
  Example 9.1
 Demonstrating an 8 x 8 LED matrix using 
 two 74HC595 shift registers
 
 http://tronixstuff.com/tutorials > Chapter 9
 
 */

int latchpin = 3; // connect to pin 12 on the '595
int clockpin = 2; // connect to pin 11 on the '595
int datapin = 4; // connect to pin 14 on the '595

//int matrixrow[8] = {
//  1,2,4,8,16,32,64,128};
int matrixcolumn[16] = {
  1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768};
byte pinForRow[8] = {
  5,6,7,8,9,10,11,12};

void pixeldisplay(int row, int column, int holdtime)
// turns on and off a pixel at row, column - with delay 'holdtime'
{
  digitalWrite(latchpin, LOW);
  shiftOut(datapin, clockpin, MSBFIRST, matrixcolumn[column]);
  shiftOut(datapin, clockpin, MSBFIRST, matrixcolumn[column-1]); // sets the digit to address
  //shiftOut(datapin, clockpin, MSBFIRST, matrixrow[row-1]); // clears the digit
  digitalWrite(pinForRow[row], HIGH);
  digitalWrite(latchpin, HIGH);
  delay(holdtime);
  digitalWrite(pinForRow[row], LOW);
}

void rowdisplay(int row, int holdtime)
// turns on and off a row of LEDs with delay 'holdtime'
{
  digitalWrite(latchpin, LOW);


  shiftOut(datapin, clockpin, LSBFIRST, 255); // we want all the cathodes on, which is 11111111 in binary, 255 decimal
  digitalWrite(pinForRow[row], HIGH); // clears the digit
  digitalWrite(latchpin, HIGH);
  delay(holdtime);
  // digitalWrite(pinForRow[row], LOW);
} 

void setup()
{
  pinMode(latchpin, OUTPUT);
  pinMode(clockpin, OUTPUT);
  pinMode(datapin, OUTPUT);
  for (int i=0; i<8; i++){
    pinMode(pinForRow[i], OUTPUT);
  }


}

void loop()
{
  for (int a=0; a<8; a++)
  {
    for (int b=0; b<8; b++)
    {
      pixeldisplay(a,b,50);
    }
  }
  for (int a=0; a<8; a++)
  {
    for (int b=0; b<8; b++)
    {
      pixeldisplay(b,a,50);
    }
    //}
    //
    //for (int zz=1; zz<15; zz++)
    // {
    //  for (int a=0; a<8; a++)
    //  {
    //    rowdisplay(a, 50);
    //  }
    // }

    //{
    //pixeldisplay(0,0,5);
    //pixeldisplay(1,1,5);
    //pixeldisplay(2,2,5);
    //pixeldisplay(3,3,5);
  }
}






