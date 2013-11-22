/** 
 * IllyClock, with display on dual RG (16x8) LED matrix;
 */

#include <WProgram.h>
#include <avr/pgmspace.h>
//#include <IRremote.h>

#include <FrequencyTimer2.h>

#include <Time.h>



const int ledPin =  13; 

byte soft_prescaler = 0;
byte activeRow      = 0;

// used for blinking a whole 8x8 sprite;
long     blinkCounter = 0;
boolean  blinkBlank   = false;

byte level = 1;
byte wait = (8-level) * 35;

// parameters for matrix display;
#define CLOCK_PIN        2
#define LATCH_PIN        3
#define SER_DATA_PIN     4

// pins assigned to LED matrix rows;
byte pinForRow[8] = {
//5,6,7,8,9,10,11,12};
12,11,10,9,8,7,6,5};
// video memory is two arrays of 16 bit integers, one per colour;
volatile uint16_t screenMem[8] = {
  0};


boolean blinkLow  = true;
boolean blinkHigh = false;


// used to display clock digits on half of an 8x8 display;


byte digit[][8] = {
{  // index 27
    B00000, 
    B01110,
    B01010,
    B01010,
    B01010,
    B01010,
    B01110,
    B00000,// 0
  },
  {
    B00000, 
    B00010,
    B00110,
    B00010,
    B00010,
    B00010,
    B00010,
    B00000,// 1
  },
  {
    B00000, 
    B01110,
    B00010,
    B00010,
    B00100,
    B01000,
    B01110,
    B00000,// 2
  },
  {
    B00000, 
    B01110,
    B00010,
    B00010,
    B01110,
    B00010,
    B01110,
    B00000,// 3
  },
  {
    B00000, 
    B01010,
    B01010,
    B01010,
    B01110,
    B00010,
    B00010,
    B00000,// 4
  },
  {
    B00000, 
    B01110,
    B01000,
    B01000,
    B01110,
    B00010,
    B01110,
    B00000,// 5
  },
  {
    B00000, 
    B01110,
    B01000,
    B01000,
    B01110,
    B01010,
    B01110,
    B00000,// 6
  },
  {
    B00000, 
    B01110,
    B00010,
    B00100,
    B01000,
    B01000,
    B01000,
    B00000,// 7
  },
  {
    B00000, 
    B01110,
    B01010,
    B01010,
    B01110,
    B01010,
    B01110,
    B00000,// 8
  },
  {
    B00000, 
    B01110,
    B01010,
    B01010,
    B01110,
    B00010,
    B01110,
    B00000,// 9
  },
 

};


void setup()
{
  setTime(12,02,00,2,8,2011);
 

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
  blinkCounter++;
  if (blinkCounter > 5000)
  {
    blinkCounter = 0;
    blinkBlank = !blinkBlank;
  }
}


void displayActiveRow()
{
  // disable current row;
  digitalWrite(pinForRow[activeRow], LOW);

  // set next row;
  activeRow = (activeRow+1) % 8;

  boolean lowByteIsBlank  = blinkHigh  && blinkBlank;
  boolean highByteIsBlank = blinkLow && blinkBlank;

  // shift out values for this row;
  byte redHi = screenMem[activeRow] >> 8;
  byte redLo = screenMem[activeRow] & 0xFF;



  shiftOutRow(highByteIsBlank ? 0 : redHi, lowByteIsBlank ? 0 : redLo);

  // switch to new row;
  digitalWrite(pinForRow[activeRow], HIGH);
}



void shiftOutRow(byte redHi, byte redLo)
{
  digitalWrite(LATCH_PIN, LOW);


  shiftOut(SER_DATA_PIN, CLOCK_PIN, LSBFIRST, redHi);
  shiftOut(SER_DATA_PIN, CLOCK_PIN, LSBFIRST, redLo);   

  // return the latch pin high to signal chip that it 
  // no longer needs to listen for information
  digitalWrite(LATCH_PIN, HIGH);
}



void resetDisplay()
{
  for (byte i = 0; i < 8; i++)  screenMem[i] = 0;
  \
}



void loop()
{
  int h = hourFormat12();

  int m = minute();
  int s = second();
  setScreenMem(h,m);
  
  //if (irrecv.decode(&results)) {

   // unsigned long codd = results.value;
    //Serial.println(codd);
    //if (codd == 16728255){
     // adjustTime(-60);
       // delay(100);
        //break;

    
    //}
    //irrecv.resume(); // Receive the next value
  //}
  
  
  
  
}


// statically displays the given character/sprite;


void setScreenMem(int hour, int minute)
{
  int h1 = hour / 10;
  int h2 = hour % 10;
  int m1 = minute / 10;
  int m2 = minute % 10;

  for (byte i = 0; i < 8; i++)
  {
    //uint16_t 
    unsigned long row = 0;
    
      row = (digit[h1][i]<< 4 )+(digit[h2][i]>> 0 ) +(digit[m1][i]<< 12 )+ (digit[m2][i] << 8);
  
  



    screenMem[i] = row ;
  
  }
  
}

















