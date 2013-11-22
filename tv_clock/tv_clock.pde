#include <TVout.h>
#include <fontALL.h>
#include "schematic.h"
#include "TVOlogo.h"

TVout TV;

int zOff = 150;
int xOff = 0;
int yOff = 0;
int cSize = 50;
int view_plane = 64;
float angle = PI/60;

const int buttonPin1 = 2;
const int buttonPin2 = 3;
const int buttonPin3 = 4;
const int buttonPin4 = 5;
const int ledPin =  13;    

// variables will change:
int buttonState1 = 0;
int buttonState2 = 0;
int buttonState3 = 0;
int buttonState4 = 0;//



void setup() {
  TV.begin(PAL,120,96);

  pinMode(buttonPin1, INPUT);
  pinMode(buttonPin2, INPUT);
  pinMode(buttonPin3, INPUT);
  pinMode(buttonPin4, INPUT);



  //circles
  TV.clear_screen();
  TV.draw_circle(TV.hres()/2,TV.vres()/2,TV.vres()/3,WHITE);
  TV.delay(500);
  TV.draw_circle(TV.hres()/2,TV.vres()/2,TV.vres()/2,WHITE,INVERT);
  TV.delay(2000);



}

void loop() {
  buttonState1 = digitalRead(buttonPin1);
  buttonState2 = digitalRead(buttonPin2);
  buttonState3 = digitalRead(buttonPin3);
  buttonState4 = digitalRead(buttonPin4);

  if (buttonState1 == HIGH) {     
    // turn LED on:    
    digitalWrite(ledPin, HIGH); 
    TV.clear_screen();
    TV.draw_circle(TV.hres()/2,TV.vres()/2,TV.vres()/3,WHITE); 
  } 
  if (buttonState2 == HIGH) {     
    // turn LED on:    
    digitalWrite(ledPin, HIGH); 
    TV.clear_screen();
    TV.draw_circle(TV.hres()/2,TV.vres()/2,TV.vres()/4,WHITE);  
  } 
  if (buttonState3 == HIGH) {     
    // turn LED on:    
    digitalWrite(ledPin, HIGH); 
    TV.clear_screen();
    TV.draw_circle(TV.hres()/2,TV.vres()/2,TV.vres()/5,WHITE);  
  } 
  if (buttonState4 == HIGH) {     
    // turn LED on:    
    digitalWrite(ledPin, HIGH);  
    TV.clear_screen();
    TV.draw_circle(TV.hres()/2,TV.vres()/2,TV.vres()/6,WHITE); 
  } 
  else {
    // turn LED off:
    digitalWrite(ledPin, LOW); 
  }






}










