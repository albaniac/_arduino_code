
#include <LiquidCrystal.h>
//For analog read
double value;
int incomingByte = 0;

#define NETWORK_SIG_SIZE 3

#define VAL_SIZE         2
#define CHECKSUM_SIZE    1
#define PACKET_SIZE      (NETWORK_SIG_SIZE + VAL_SIZE + CHECKSUM_SIZE)

// The network address byte and can be change if you want to run different devices in proximity to each other without interfearance
#define NET_ADDR 5

const byte g_network_sig[NETWORK_SIG_SIZE] = {
  0x8F, 0xAA, NET_ADDR}; 


#define LED_PIN     13


#define BUTTON_PRESSED LOW
#define BUTTON_NOT_PRESSED HIGH







const int ledPin =  13; 
const int triggerPin =  6; 
LiquidCrystal lcd(7, 8, 9, 10, 11, 12);
int trip_delay = 300000;

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

void setup()
{
  lcd.begin(8, 2);
  pinMode(triggerPin, OUTPUT); 
  pinMode(ledPin, OUTPUT); 
  Serial.begin(2400); 
  //Serial.begin(115200);
}

void loop()
{ 
  value = analogRead(A5);


  incomingByte = 0;







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






    lcd.setCursor(0, 0);
    lcd.print("Gys on");
    lcd.setCursor(0, 1);
    lcd.print("I=");
    lcd.print(Irms);

    digitalWrite(triggerPin,HIGH);
    digitalWrite(ledPin,HIGH);

    //if (Irms > 7.50){
    if (readUInt(true) ){

      digitalWrite(triggerPin,LOW);
      digitalWrite(ledPin,LOW);
      lcd.setCursor(0, 0);
      lcd.print("Tripped!");
      delay(3000);
    }



    //Reset values ready for next sample.
    sumI=0.0;
    incomingByte = 0;
  }
}



unsigned int readUInt(bool wait)
{
  int pos = 0;          // Position in the network signature
  unsigned int val;     // Value of the unsigned int
  byte c = 0;           // Current byte

  if((Serial.available() < PACKET_SIZE) && (wait == false))
  {
    return 0xFFFF;
  }

  while(pos < NETWORK_SIG_SIZE)
  { 
    while(Serial.available() == 0); // Wait until something is avalible
    c = Serial.read();

    if (c == g_network_sig[pos])
    {
      if (pos == NETWORK_SIG_SIZE-1)
      {
        byte checksum;

        while(Serial.available() < VAL_SIZE + CHECKSUM_SIZE); // Wait until something is avalible
        val      =  Serial.read();
        val      += ((unsigned int)Serial.read())*256;
        checksum =  Serial.read();

        if (checksum != ((val/256) ^ (val&0xFF)))
        {
          // Checksum failed
          pos = -1;
        }
      }
      ++pos;
    }
    else if (c == g_network_sig[0])
    {
      pos = 1;
    }
    else
    {
      pos = 0;
      if (!wait)
      {
        return 0xFFFF;
      }
    }
  }
  return val;
}

