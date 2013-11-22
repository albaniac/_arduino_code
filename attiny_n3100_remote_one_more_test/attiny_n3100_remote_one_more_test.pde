// This sketch will send out a Nikon D50 trigger signal (probably works with most Nikons)
// See the full tutorial at http://www.ladyada.net/learn/sensors/ir.html
// this code is public domain, please enjoy!
 
int IRledPin =  4;    // LED connected to digital pin 13
 int pinSTLED = 7;
 int buttonpin = 12;
 
 int buttonState = 0; 
// The setup() method runs once, when the sketch starts
 
void setup()   {                
  // initialize the IR digital pin as an output:
  pinMode(IRledPin, OUTPUT);      
 pinMode(pinSTLED, OUTPUT);
  pinMode(buttonpin, INPUT);
}
 
void loop()                     
{
  buttonState = digitalRead(buttonpin);
  //while (buttonpin == HIGH){
    if(buttonState == HIGH) {    
    // turn LED on:    
   
    SendNikonCode();
   //delay(1000);
    }
}
  
  
  
 
 
 
   // wait one minute (60 seconds * 1000 milliseconds)

 
// This procedure sends a 38KHz pulse to the IRledPin 
// for a certain # of microseconds. We'll use this whenever we need to send codes
void pulseIR(long microsecs) {
  // we'll count down from the number of microseconds we are told to wait
 
  cli();  // this turns off any background interrupts
 
  while (microsecs > 0) {
    // 38 kHz is about 13 microseconds high and 13 microseconds low
   digitalWrite(IRledPin, HIGH);
 digitalWrite(pinSTLED, HIGH);  // this takes about 3 microseconds to happen
   delayMicroseconds(7);         // hang out for 10 microseconds
   digitalWrite(IRledPin, LOW);
digitalWrite(pinSTLED, LOW);   // this also takes about 3 microseconds
   delayMicroseconds(7);         // hang out for 10 microseconds
 
   // so 26 microseconds altogether
   microsecs -= 26;
  }
 
  sei();  // this turns them back on
}
 
void SendNikonCode() {
  // This is the code for my particular Nikon, for others use the tutorial
  // to 'grab' the proper code from the remote
 
  pulseIR(1000);
  delayMicroseconds(500);
  pulseIR(1000);
  delayMicroseconds(500);
  pulseIR(1000);
  delayMicroseconds(500);
  pulseIR(1000);
 
 
  delay(65); // wait 65 milliseconds before sending it again
 
  pulseIR(1000);
  delayMicroseconds(500);
  pulseIR(1000);
  delayMicroseconds(500);
  pulseIR(1000);
  delayMicroseconds(500);
  pulseIR(1000);
}
