/*
 * IRremote: IRrecvDemo - demonstrates receiving IR codes with IRrecv
 * An IR detector/demodulator must be connected to the input RECV_PIN.
 * Version 0.1 July, 2009
 * Copyright 2009 Ken Shirriff
 * http://arcfn.com
 */

#include <IRremote.h>

int RECV_PIN = 12;
const int ledPin =  13;

IRrecv irrecv(RECV_PIN);

decode_results results;

void setup()
{
  Serial.begin(9600);
  irrecv.enableIRIn(); // Start the receiver
}

void loop() {
  if (irrecv.decode(&results)) {
   
    unsigned long codd = results.value;
    //Serial.println(codd);
    if (codd == 16728255){
       digitalWrite(ledPin, HIGH);
       delay(1000);
       digitalWrite(ledPin, LOW);
    }
    irrecv.resume(); // Receive the next value
  }
}
