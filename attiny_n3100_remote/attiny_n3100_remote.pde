



int pinIRLED = 4;
int pinSTLED = 7;
int buttonpin = 12;

int buttonState = 0; 
// assign the Infrared emitter/ diode to pin 13
void setup() {
  pinMode(pinIRLED, OUTPUT); 
   pinMode(pinSTLED, OUTPUT);
  pinMode(buttonpin, INPUT);  // set the pin as an output
}
// sets the pulse of the IR signal.
void pulseON(int pulseTime) {
  unsigned long endPulse = micros() + pulseTime;        // create the microseconds to pulse for
  while( micros() < endPulse) {
    digitalWrite(pinIRLED, HIGH);
digitalWrite(pinSTLED, HIGH);     // turn IR on
    delayMicroseconds(13);                              // half the clock cycle for 38Khz (26.32×10-6s) - e.g. the 'on' part of our wave
    digitalWrite(pinIRLED, LOW);
digitalWrite(pinSTLED, LOW);     // turn IR off
    delayMicroseconds(13);                              // delay for the other half of the cycle to generate wave/ oscillation
  }
}
void pulseOFF(unsigned long startDelay) {
  unsigned long endDelay = micros() + startDelay;       // create the microseconds to delay for
  while(micros() < endDelay);
}
void takePicture() {
  for (int i=0; i < 2; i++) {
    pulseON(2000);                                      // pulse for 2000 uS (Microseconds)
    pulseOFF(27850);                                    // turn pulse off for 27850 us
    pulseON(390);                                       // and so on
    pulseOFF(1580);
    pulseON(410);
    pulseOFF(3580);
    pulseON(400);
    pulseOFF(63200);
  }                                                     // loop the signal twice.
}
void loop() {
   buttonState = digitalRead(buttonpin);
  //while (buttonpin == HIGH){
    if(buttonState == HIGH) {    
    // turn LED on:    
   
   takePicture();
   //delay(1000);
    }
}
    
    
    
    //takePicture();                                        // take the picture
  //}                                         // delay in milliseconds which allows us to do timelapse photography - 1 second = 1000 milli





