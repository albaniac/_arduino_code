// Driving a bipolar stepper motor with Arduino and a ULN2803
// Octal High Voltage High Current Darlington Transistor Array
// This example code is in the public domain. Based on several
// Arduino code samples
// http://elabz.com/
 
// constants won't change. They're used here to
// set pin numbers:
const int buttonPin = 2;     // the number of the misc. pushbutton pin
const int buttonForwardPin = 6;     // the number of the misc. pushbutton pin
const int buttonBackwardPin = 7;     // the number of the misc. pushbutton pin
const int ledPin =  13;      // the number of the forward LED pin
const int ledForwardPin =  4;      // the number of the forward LED pin
const int ledBackwardPin =  5;      // the number of the backward LED pin
const int motorPin1 =8;
const int motorPin2 =9;
const int motorPin3 =10;
const int motorPin4 =11;
const int motorDelay=10;
 
// Variables will change:
int ledForwardState = LOW; // the current state of the forward LED output pin
int ledBackwardState = LOW; // the current state of the forward LED output pin
int buttonState;             // the current reading from the misc input pin
int buttonForwardState;             // the current reading from the forward input pin
int buttonBackwardState;             // the current reading from the backward input pin
int lastButtonState = LOW;
int lastForwardButtonState = LOW;   // the previous reading from the input pin
int lastBackwardButtonState = LOW;   // the previous reading from the input pin
 
// the following variables are long's because the time, measured in miliseconds,
// will quickly become a bigger number than can be stored in an int.
long lastForwardDebounceTime = 0;  // the last time the output pin was toggled
long lastBackwardDebounceTime = 0;  // the last time the output pin was toggled
long lastDebounceTime = 0;  // the last time the output pin was toggled
long debounceDelay = 50;    // the debounce time; increase if the output flickers
 
void setup() {
  pinMode(buttonPin, INPUT);
  pinMode(buttonForwardPin, INPUT);
  pinMode(buttonBackwardPin, INPUT);
  pinMode(ledForwardPin, OUTPUT);
  pinMode(ledBackwardPin, OUTPUT);
  pinMode(motorPin1, OUTPUT);
  pinMode(motorPin2, OUTPUT);
  pinMode(motorPin3, OUTPUT);
  pinMode(motorPin4, OUTPUT);
 
}
 
void loop() {
  // read the state of the switch into a local variable:
  int reading = digitalRead(buttonPin);
 
  // check to see if you just pressed the button
  // (i.e. the input went from LOW to HIGH),  and you've waited
  // long enough since the last press to ignore any noise: 
 
  // If the switch changed, due to noise or pressing:
  if (reading != lastButtonState) {
    // reset the debouncing timer
    lastDebounceTime = millis();
  }
 
  if ((millis() - lastDebounceTime) > debounceDelay) {
    // whatever the reading is at, it's been there for longer
    // than the debounce delay, so take it as the actual current state:
    buttonState = reading;
  }
 
  // set the LED using the state of the button:
  digitalWrite(ledPin, buttonState);
 
  // save the reading.  Next time through the loop,
  // it'll be the lastButtonState:
  lastButtonState = reading;
 
    int readingForward = digitalRead(buttonForwardPin);
    int readingBackward = digitalRead(buttonBackwardPin);
  // check to see if you just pressed the button
  // (i.e. the input went from LOW to HIGH),  and you've waited
  // long enough since the last press to ignore any noise: 
 
  // If the switch changed, due to noise or pressing:
  if (readingBackward != lastBackwardButtonState) {
    // reset the debouncing timer
    lastBackwardDebounceTime = millis();
  }  
 
  if (readingForward != lastForwardButtonState) {
    // reset the debouncing timer
    lastForwardDebounceTime = millis();
  }
 
  if ((millis() - lastForwardDebounceTime) > debounceDelay) {
    // whatever the reading is at, it's been there for longer
    // than the debounce delay, so take it as the actual current state:
    buttonForwardState = readingForward;
    lastForwardButtonState = readingForward;
    forward();
}else if ((millis() - lastBackwardDebounceTime) > debounceDelay) {
    // whatever the reading is at, it's been there for longer
    // than the debounce delay, so take it as the actual current state:
    buttonBackwardState = readingBackward;
    lastBackwardButtonState = readingBackward;
    backward();
  }else{
 
   stopping();
   lastBackwardButtonState = LOW;
   lastForwardButtonState = LOW;
  }
 
  // set the LED using the state of the button:
  digitalWrite(ledPin, buttonState);
 
  // save the reading.  Next time through the loop,
  // it'll be the lastButtonState:
 
}
 
void forward()
{
   digitalWrite(ledForwardPin, HIGH);
 
// HALF STEP 
 
  digitalWrite(motorPin1, HIGH);
  digitalWrite(motorPin2, LOW);
  digitalWrite(motorPin3, HIGH);
  digitalWrite(motorPin4, LOW);
  delay(motorDelay);
 
  digitalWrite(motorPin1, HIGH);
  digitalWrite(motorPin2, LOW);
  digitalWrite(motorPin3, HIGH);
  digitalWrite(motorPin4, HIGH);
  delay(motorDelay); 
 
  digitalWrite(motorPin1, HIGH);
  digitalWrite(motorPin2, LOW);
  digitalWrite(motorPin3, LOW);
  digitalWrite(motorPin4, HIGH);
  delay(motorDelay); 
 
  digitalWrite(motorPin1, HIGH);
  digitalWrite(motorPin2, HIGH);
  digitalWrite(motorPin3, LOW);
  digitalWrite(motorPin4, HIGH);
  delay(motorDelay);
 
  digitalWrite(motorPin1, LOW);
  digitalWrite(motorPin2, HIGH);
  digitalWrite(motorPin3, LOW);
  digitalWrite(motorPin4, HIGH);
  delay(motorDelay);
 
  digitalWrite(motorPin1, LOW);
  digitalWrite(motorPin2, HIGH);
  digitalWrite(motorPin3, HIGH);
  digitalWrite(motorPin4, HIGH);
  delay(motorDelay);
 
  digitalWrite(motorPin1, LOW);
  digitalWrite(motorPin2, HIGH);
  digitalWrite(motorPin3, HIGH);
  digitalWrite(motorPin4, LOW);
  delay(motorDelay);
 
  digitalWrite(motorPin1, HIGH);
  digitalWrite(motorPin2, HIGH);
  digitalWrite(motorPin3, HIGH);
  digitalWrite(motorPin4, LOW);
  delay(motorDelay);
 
}
void backward()
{
 
 digitalWrite(ledBackwardPin, HIGH);
 
  digitalWrite(motorPin1, HIGH);
  digitalWrite(motorPin2, HIGH);
  digitalWrite(motorPin3, HIGH);
  digitalWrite(motorPin4, LOW);
  delay(motorDelay);
 
  digitalWrite(motorPin1, LOW);
  digitalWrite(motorPin2, HIGH);
  digitalWrite(motorPin3, HIGH);
  digitalWrite(motorPin4, LOW);
  delay(motorDelay); 
 
  digitalWrite(motorPin1, LOW);
  digitalWrite(motorPin2, HIGH);
  digitalWrite(motorPin3, HIGH);
  digitalWrite(motorPin4, HIGH);
  delay(motorDelay); 
 
  digitalWrite(motorPin1, LOW);
  digitalWrite(motorPin2, HIGH);
  digitalWrite(motorPin3, LOW);
  digitalWrite(motorPin4, HIGH);
  delay(motorDelay);
 
  digitalWrite(motorPin1, HIGH);
  digitalWrite(motorPin2, HIGH);
  digitalWrite(motorPin3, LOW);
  digitalWrite(motorPin4, HIGH);
  delay(motorDelay);
 
  digitalWrite(motorPin1, HIGH);
  digitalWrite(motorPin2, LOW);
  digitalWrite(motorPin3, LOW);
  digitalWrite(motorPin4, HIGH);
  delay(motorDelay);
 
  digitalWrite(motorPin1, HIGH);
  digitalWrite(motorPin2, LOW);
  digitalWrite(motorPin3, HIGH);
  digitalWrite(motorPin4, HIGH);
  delay(motorDelay);
 
  digitalWrite(motorPin1, HIGH);
  digitalWrite(motorPin2, LOW);
  digitalWrite(motorPin3, HIGH);
  digitalWrite(motorPin4, LOW);
  delay(motorDelay);
 
}
 
void stopping()
{
  digitalWrite(ledForwardPin, LOW);
  digitalWrite(ledBackwardPin, LOW);
  digitalWrite(motorPin1, HIGH);
  digitalWrite(motorPin2, HIGH);
  digitalWrite(motorPin3, HIGH);
  digitalWrite(motorPin4, HIGH);
}
