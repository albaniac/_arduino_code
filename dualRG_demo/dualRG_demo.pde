/** 
 * Dual RG LED matrix (16 x 8)
 *
 * This is a demo for scrolling text on the "Dual RG matrix shield" which can be
 * found here: http://timewitharduino.blogspot.com/2010/02/dual-bi-color-led-matrix-shield.html
 */

#include <WProgram.h>
#include <string.h>


// used to enable/disable Serial.print, time-consuming operation;
// to minimize the code size, all references to Serial should be commented out;
//#define _DEBUG_ 1






byte soft_prescaler = 0;
byte activeRow      = 0;


// parameters for matrix display;
#define CLOCK_PIN        2
#define LATCH_PIN        3
#define SER_DATA_PIN     4

// pins assigned to LED matrix rows;
byte pinForRow[8] = {
  5,6,7,8,9,10,11,12};


#define MAX_OPTION           1  // maximum number of options in the menu;
#define DEFAULT_OPTION       0
#define OPTION_MESSAGE       0
#define OPTION_CLOCK         1



// general-purpose setting; particularly used to set the scrolling speed (wait);
// values from 0 to 7;
byte level = 2;

// used to adjust the scrolling speed;
// user can set it through the menu option 3;
// may be also set through other means, e.g. potentiometer on analog pin (not implemented yet);
byte wait = (8-level) * 40;  // used to be initially set to 200;


// video memory is two arrays of 16 bit integers, one per colour;
volatile uint16_t screenMem[8] = {
  0};




byte sprites[][8] = {
  {
    0x00,    // ________   blank
    0x00,    // ________
    0x00,    // ________
    0x00,    // ________
    0x00,    // ________
    0x00,    // ________
    0x00,    // ________
    0x00     // ________
  }
  ,
  {
    0x00,    // ________   A
    0x18,    // ___XX___
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x3C,    // __XXXX__
    0x24,    // __X__X__
    0x24,    // __X__X_
    0x00     // ________
  }
  ,
  {
    0x00,    // ________   B
    0x38,    // __XXX___
    0x24,    // __X__X__
    0x38,    // __XXX___
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x38,    // __XXX__
    0x00     // ________
  }
  ,
  {
    0x00,    // ________   C
    0x18,    // ___XX___
    0x24,    // __X__X__
    0x20,    // __X_____
    0x20,    // __X_____
    0x24,    // __X__X__
    0x18,    // ___XX__
    0x00     // ________
  }
  ,
  {
    0x00,    // ________   D
    0x38,    // __XXX___
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x38,    // __XXX__
    0x00     // ________
  }
  ,
  {
    0x00,    // ________   E
    0x3C,    // __XXXX__
    0x20,    // __X_____
    0x38,    // __XXX___
    0x20,    // __X_____
    0x20,    // __X_____
    0x3C,    // __XXXX__
    0x00     // ________
  }
  ,
  {
    0x00,    // ________   F
    0x3C,    // __XXXX__
    0x20,    // __X_____
    0x38,    // __XXX___
    0x20,    // __X_____
    0x20,    // __X_____
    0x20,    // __X_____
    0x00     // ________
  }
  ,
  {
    0x00,    // ________  G
    0x1C,    // ___XXX__
    0x20,    // __X_____
    0x20,    // __X_____
    0x2C,    // __X_XX__
    0x24,    // __X__X__
    0x1C,    // __XXXX__
    0x00     // ________
  }
  ,
  {
    0x00,    // ________  H
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x3C,    // __XXXX__
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x00     // ________
  }
  ,
  {
    0x00,    // ________  I
    0x1C,    // ___XXX__
    0x08,    // ____X___
    0x08,    // ____X___
    0x08,    // ____X___
    0x08,    // ____X___
    0x1C,    // ___XXX__
    0x00     // ________
  }
  ,
  {
    0x00,    // ________  J
    0x3C,    // __XXXX__
    0x04,    // _____X__
    0x04,    // _____X__
    0x04,    // _____X__
    0x24,    // __X__X__
    0x18,    // ___XX___
    0x00     // ________
  }
  ,
  {
    0x00,    // ________  K
    0x24,    // __X__X__
    0x28,    // __X_X___
    0x30,    // __XX____
    0x28,    // __X_X___
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  L
    0x20,    // __X_____
    0x20,    // __X_____
    0x20,    // __X_____
    0x20,    // __X_____
    0x20,    // __X_____
    0x3C,    // __XXXX__
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  M
    0x22,    // __X___X_
    0x36,    // __XX_XX_
    0x2A,    // __X_X_X_
    0x22,    // __X___X_
    0x22,    // __X___X_
    0x22,    // __X___X_
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  N
    0x24,    // __X__X__
    0x34,    // __XX_X__
    0x2C,    // __X_XX__
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  O
    0x18,    // ___XX___
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x18,    // ___XX___
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  P
    0x38,    // __XXX___
    0x24,    // __X__X__
    0x38,    // __XXX___
    0x20,    // __X_____
    0x20,    // __X_____
    0x20,    // __X_____
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  Q
    0x18,    // ___XX___
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x2C,    // __X_XX__
    0x1A,    // ___XX_X_
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  R
    0x38,    // __XXX___
    0x24,    // __X__X__
    0x38,    // __XXX___
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  S
    0x1C,    // ___XXX__
    0x20,    // __X_____
    0x18,    // ___XX___
    0x04,    // _____X__
    0x24,    // __X__X__
    0x18,    // ___XX___
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  T
    0x3E,    // __XXXXX_
    0x08,    // ____X___
    0x08,    // ____X___
    0x08,    // ____X___
    0x08,    // ____X___
    0x08,    // ____X___
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  U
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x18,    // ___XX___
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  V
    0x22,    // __X___X_
    0x22,    // __X___X_
    0x22,    // __X___X_
    0x14,    // ___X_X__
    0x14,    // ___X_X__
    0x08,    // ____X___
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  W
    0x22,    // __X___X_
    0x22,    // __X___X_
    0x22,    // __X___X_
    0x2A,    // __X_X_X_
    0x2A,    // __X_X_X_
    0x14,    // ___X_X__
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________ X
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x18,    // ___XX___
    0x18,    // ___XX___
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  Y
    0x22,    // __X___X_
    0x22,    // __X___X_
    0x14,    // ___X_X__
    0x08,    // ____X___
    0x08,    // ____X___
    0x08,    // ____X___
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  Z
    0x3E,    // __XXXXX_
    0x24,    // __X__X__
    0x08,    // ____X___
    0x10,    // ___X____
    0x22,    // __X___X_
    0x3E,    // __XXXXX_
    0x00,    // ________
  }
  ,
  {  // index 27
    0x00,    // ________  0
    0x18,    // ___XX___
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x18,    // ___XX___
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  1
    0x08,    // ____X___
    0x18,    // ___XX___
    0x28,    // __X_X___
    0x08,    // ____X___
    0x08,    // ____X___
    0x1C,    // ___XXX__
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  2
    0x18,    // ___XX___
    0x24,    // __X__X__
    0x08,    // ____X___
    0x10,    // ___X____
    0x20,    // __X_____
    0x3C,    // __XXXX__
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  3
    0x3C,    // __XXXX__
    0x04,    // _____X__
    0x18,    // ___XX___
    0x04,    // _____X__
    0x24,    // __X__X__
    0x18,    // ___XX___
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  4
    0x04,    // _____X__
    0x0C,    // ____XX__
    0x14,    // ___X_X__
    0x3C,    // __XXXX__
    0x04,    // _____X__
    0x04,    // _____X__
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  5
    0x3C,    // __XXXX__
    0x20,    // __X_____
    0x38,    // __XXX___
    0x04,    // _____X__
    0x24,    // __X__X__
    0x18,    // ___XX___
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  6
    0x18,    // ___XX___
    0x20,    // __X_____
    0x38,    // __XXX___
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x18,    // ___XX___
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  7
    0x3C,    // __XXXX__
    0x04,    // _____X__
    0x08,    // ____X__
    0x10,    // ___X___
    0x10,    // ___X____
    0x10,    // ___X____
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  8
    0x18,    // ___XX___
    0x24,    // __X__X__
    0x18,    // ___XX___
    0x24,    // __X__X__
    0x24,    // __X__X__
    0x18,    // ___XX___
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  9
    0x18,    // ___XX___
    0x24,    // __X__X__
    0x1C,    // ___XXX__
    0x04,    // _____X__
    0x24,    // __X__X__
    0x18,    // ___XX___
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  .
    0x00,    // ________
    0x00,    // ________
    0x00,    // ________
    0x00,    // ________
    0x30,    // __XX____
    0x30,    // __XX____
    0x00,    // ________
  }
  ,
  {
    0x00,    // ________  ,
    0x00,    // ________
    0x00,    // ________
    0x00,    // ________
    0x00,    // ________
    0x30,    // __XX____
    0x10,    // ___X____
    0x20,    // __X_____
  }
  ,
  {
    0x00,    // ________  !
    0x10,    // ___X____
    0x10,    // ___X____
    0x10,    // ___X____
    0x10,    // ___X____
    0x00,    // ________
    0x10,    // ___X____
    0x10,    // ________
  }
  ,
  {  // index 40
    0x00,    // ________  :
    0x00,    // ________
    0x18,    // ___XX___
    0x18,    // ___XX___
    0x00,    // ________
    0x18,    // ___XX___
    0x18,    // ___XX___
    0x00,    // ________
  }
  ,
};


char msgBuffer[] = " HAPPY BIRTHDAY GUGHI . LOVZ ZU ";
byte msgBufferPos  = 0;
byte msgBufferSize = 0;


// this is the screen memory; it stores 4 chars (ascii rather than sprites);
byte char1 = 0;
byte char2 = 0;
byte char3 = 0;
byte char4 = 0;
byte char5 = 0;



void setup()
{
  // Calculation for timer 2
  // 16 MHz / 8 = 2 MHz (prescaler 8)
  // 2 MHz / 256 = 7812 Hz
  // soft_prescaler = 15 ==> 520.8 updates per second
  // 520.8 / 8 rows ==> 65.1 Hz for the complete display
  TCCR2A = 0;           // normal operation
  TCCR2B = (1<<CS21);   // prescaler 8
  TIMSK2 = (1<<TOIE2);  // enable overflow interrupt


  // define outputs for serial shift registers
  pinMode(CLOCK_PIN,    OUTPUT);
  pinMode(LATCH_PIN,    OUTPUT);
  pinMode(SER_DATA_PIN, OUTPUT);

  // set outputs for the 8 matrix rows;
  for (int i=0; i<8; i++)
    pinMode(pinForRow[i], OUTPUT);

  resetDisplay();

  msgBufferSize = strlen(msgBuffer);

#ifdef _DEBUG_
  Serial.begin(9600);
#endif
}


ISR(TIMER2_OVF_vect)
{
  soft_prescaler++;
  if (soft_prescaler == 15)
  {
    // display the next row
    displayActiveRow();
    soft_prescaler = 0;
  }
};


void displayActiveRow()
{
  // disable current row;
  digitalWrite(pinForRow[activeRow], LOW);

  // set next row;
  activeRow = (activeRow+1) % 8;

  // shift out values for this row;
  byte redHi = screenMem[activeRow] >> 8;
  byte redLo = screenMem[activeRow] & 0xFF;



  shiftOutRow(redHi, redLo);

  // switch to new row;
  digitalWrite(pinForRow[activeRow], HIGH);
}



void shiftOutRow(byte redHi,  byte redLo)
{
  digitalWrite(LATCH_PIN, LOW);


  shiftOut(SER_DATA_PIN, CLOCK_PIN, MSBFIRST, redHi);
  shiftOut(SER_DATA_PIN, CLOCK_PIN, MSBFIRST, redLo);   

  // return the latch pin high to signal chip that it 
  // no longer needs to listen for information
  digitalWrite(LATCH_PIN, HIGH);
}


void resetDisplay()
{
  for (byte i = 0; i < 8; i++)  screenMem[i] = 0;

  char1 = 0;
  char2 = 0;
  char3 = 0;
  char4 = 0;
  char5 = 0;

  // reset the buffer pointers;
  msgBufferPos  = 0;
}



void loop()
{


  displayAndScroll(msgBuffer[msgBufferPos]);
  msgBufferPos++;
  if (msgBufferPos >= msgBufferSize)  msgBufferPos = 0;
}



void displayAndScroll(char crtChar)
{


  switch (crtChar)
  {
  case ' ':
    char1 = char2;
    char2 = char3;
    char3 = char4;
    char4 = 0;
    break;

  case 'A':  
  case 'B':  
  case 'C':  
  case 'D':  
  case 'E':  
  case 'F':
  case 'G':  
  case 'H':  
  case 'I':  
  case 'J':  
  case 'K':  
  case 'L':
  case 'M':  
  case 'N':  
  case 'O':  
  case 'P':  
  case 'Q':  
  case 'R':
  case 'S':  
  case 'T':  
  case 'U':  
  case 'V':  
  case 'W':  
  case 'X':
  case 'Y':  
  case 'Z':
    char1 = char2;
    char2 = char3;
    char3 = char4;
    char4 = crtChar - 'A' + 1;
    break;

  case '0':  
  case '1':  
  case '2':  
  case '3':  
  case '4':
  case '5':  
  case '6':  
  case '7':  
  case '8':  
  case '9':
    char1 = char2;
    char2 = char3;
    char3 = char4;
    char4 = crtChar - '0' + 27;
    break;

  case '.':
    // definition of the bitmaps for digits start at index 37;
    char1 = char2;
    char2 = char3;
    char3 = char4;
    char4 = 37;  // dot has index 37 in the character definition array;
    break;

  case ',':
    char1 = char2;
    char2 = char3;
    char3 = char4;
    char4 = 38;  // comma has index 38 in the character definition array;
    break;

  case '!':
    char1 = char2;
    char2 = char3;
    char3 = char4;
    char4 = 39;  // exclamation has index 39 in the character definition array;
    break;

  case ':':
    char1 = char2;
    char2 = char3;
    char3 = char4;
    char4 = 40;  // colon has index 40 in the character definition array;
    break;
  } 

  setScreenMem(sprites[char1], sprites[char2], sprites[char3], sprites[char4]);
}


void setScreenMem(byte sprite1[8], byte sprite2[8], byte sprite3[8], byte sprite4[8])
{
  unsigned long row[16] = {
    0  };

  // for each row;
  for (byte i = 0; i < 8; i++)
  {
    byte c1 = sprite1[i] >> 1;
    byte c2 = sprite2[i] >> 1;
    byte c3 = sprite3[i] >> 1;
    byte c4 = sprite4[i] >> 1;
    row[i] = ((((((unsigned long) c1 << 5) + c2) << 5) + c3) << 5) + c4;


  }  

  // scroll 5 times to the left (5 being the width of a char, as defined);
  for (byte x = 1; x <= 2; x++)
  {
    // for each row;
    for (byte i = 0; i < 8; i++)
    {

      screenMem[i] = row[i] >> (2-x);



    }
  }
  delay(500);
}



// statically displays the given character/sprite;
// used to display the menu option (number);
void setScreenMem(byte sprite[8])
{
  uint16_t row;
  for (byte i = 0; i < 8; i++)
  {
    row = sprite[i];
    screenMem[i] = row;

  }
}



