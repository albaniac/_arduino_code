//RECEIVER
//------------
int ir_pin = 11;				 //Sensor pin 1 wired through a 220 ohm resistor
int led_pin = 13;				   //"Ready to Receive" flag, not needed but nice
//int debug = 1;				   //Serial connection must be started to debug
//int start_bit = 2000;			 //Start bit threshold (Microseconds)
//int bin_1 = 1000;				   //Binary 1 threshold (Microseconds)
//int bin_0 = 400;				     //Binary 0 threshold (Microseconds)


void setup() {
 pinMode(led_pin, OUTPUT);		 //This shows when we're ready to receive
 pinMode(ir_pin, INPUT);
 digitalWrite(led_pin, LOW);	 //not ready yet
 //Serial.begin(9600);
}

void loop() {
// int key = getIRKey();		 //Fetch the key
 


//int getIRKey() {
 //int data[12];
 digitalWrite(led_pin, LOW);     //Ok, i'm ready to recieve
 while(pulseIn(ir_pin, LOW) < 2200) { //Wait for a start bit
 }

 digitalWrite(led_pin, HIGH);
 delay(500);			     //Return key number
}
