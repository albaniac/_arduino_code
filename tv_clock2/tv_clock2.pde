#include <TVout.h>
#include <fontALL.h>
#include "schematic.h"
#include "TVOlogo.h"
#include <Time.h>

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
//Serial.begin(9600);

  setTime(11,50,00,2,8,2011);



}

void loop() {

  int c_x = TV.hres()/2;
  int c_y = TV.vres()/2;

  int hh = hourFormat12();

  int m = minute();
  int s = second();

  

  int s_radius = ((TV.vres())/2)-2;
  int mi_radius = ((TV.vres())/3)-2;
  int h_radius = ((TV.vres())/3)-10;

  int s_angle = s*6;
  //Serial.print(s_angle); 
  int mi_angle = m*6;
  int h_angle = hh*30;

  int s_x = c_x + s_radius * cos(s_angle);
  int s_y = c_y + s_radius * sin(s_angle);

  int mi_x = c_x + mi_radius * cos(mi_angle);
  int mi_y = c_y + mi_radius * sin(mi_angle);

  int h_x = c_x + h_radius * cos(h_angle);
  int h_y = c_y + h_radius * sin(h_angle);

  TV.clear_screen();
  TV.draw_circle(c_x,c_y,c_y-3,WHITE);

  TV.draw_line(c_x,c_y,s_x,s_y,WHITE);
  TV.draw_line(c_x,c_y,mi_x,mi_y,WHITE);
  TV.draw_line(c_x,c_y,h_x,h_y,WHITE);





}














