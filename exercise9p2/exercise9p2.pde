/*
  Exercise 9.1
  Animate a figure on the 8x8 LED matrix display
  using Arduino and two 74HC595 shift registers
  More information at: http://tronixstuff.com/tutorials > Chapter 9
*/

int latchpin = 3; // connect to pin 12 on the '595
int clockpin = 2; // connect to pin 11 on the '595
int datapin = 4; // connect to pin 14 on the '595
byte pinForRow[8] = {
  5,6,7,8,9,10,11,12};
  
int alien1[72] = {156,199,125,63,63,125,199,156,
                0,156,199,125,63,63,125,199,
                0,0,156,199,125,63,63,125,
                0,0,0,56,199,125,63,63,
                0,0,0,0,156,199,125,63,
                0,0,0,0,0,156,199,125,
                0,0,0,0,0,0,156,199,
                0,0,0,0,0,0,0,156,
                0,0,0,0,0,0,0,0};

// wow, that is a large array! Each 'line' above will represent the alien - starting from on the screen, to moving 1 row to the right until it has gone. 

void setup()
{
  pinMode(latchpin, OUTPUT);
  pinMode(clockpin, OUTPUT);
  pinMode(datapin, OUTPUT);
    for (int i=0; i<8; i++){
    pinMode(pinForRow[i], OUTPUT);
  }
  delay(500);
}

void movealientoright(int duration) // needs duration loop to hold image
// moves the character defined in the array 'alien1' off to the right
// duration is the number of ticks to hold the alien in each position
{  
  int mul2=0;
  for (int xx=8; xx>=0; xx--) // for 8 images
  {
     for (int dd=0; dd<duration; dd++)
     {
        for (int q=7; q>=0; q--) // for 8 columns per image
        {
          mul2=(xx*8)+q;
          columndisplay(alien1[mul2], q,0);
        }
     }
  }
}

void movealienfromleft(int duration) // needs duration loop to hold image
// moves the character defined in the array 'alien1' off to the right
// duration is the number of ticks to hold the alien in each position
{  
  int mul2=0;
  for (int xx=0; xx<=8; xx++) // for 8 images
  {
     for (int dd=0; dd<duration; dd++)
     {
        for (int q=0; q<8; q++) // for 8 columns per image
        {
          mul2=(xx*8)+q;
          columndisplay(alien1[mul2], q,0);
        }
     }
  }
}

void columndisplay(int coldata, int row, int holdtime) 
// turns on and off a column of LEDs represented by coldata, in column location column (0~7), with delay 'holdtime'
{
  int matrixcolumn[8] = {
    1,2,4,8,16,32,64,128    };
  digitalWrite(latchpin, LOW);
  digitalWrite(pinForRow[row], HIGH);
  //shiftOut(datapin, clockpin, MSBFIRST, matrixcolumn[column]); 
  shiftOut(datapin, clockpin, MSBFIRST, coldata); // we want all the anodes on, which is 11111111 in binary, 255 decimal
  digitalWrite(latchpin, HIGH);
  delay(holdtime);
  digitalWrite(pinForRow[row], LOW);
} 

void cls()
// sets all LEDs off
{
  for (int c=0; c<9; c++)
  {
    columndisplay(0,c,0);
  }
}

void loop()
{
  //movealienfromleft(200);
  movealientoright(200);
  
  cls();
}




