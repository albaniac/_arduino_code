
int disp_m1 = minute()/10;
int disp_m2 = minute()%10;
int hh = hour();


int disp_h = hh;

int disp_h1 = disp_h / 10;
int disp_h2 = disp_h % 10;

int disp_h12 =abs( hh - 12);
int disp_h1_12 = disp_h12 / 10;
int disp_h2_12 = disp_h12 % 10;



void setup()
{
  size (300, 300);
  PFont font;
  font = loadFont("ArialMT-15.vlw"); 
  textFont(font); 
  background(150);
  smooth();
  strokeWeight(.1);

  // int_time();
}



void int_time()
{
  fasterase(50, 100);
  fasterase(100, 100);
  fasterase(170, 100);
  fasterase(220, 100);
  hour1();
  hour2();
  min1();
  min2();
}


void draw()
{
  //background(130);
  printtime();
}

void myDelay(int ms) {
  int time = millis();
  while (millis ()-time < ms);
}

void fasterase(float xp, float yp)
{
  stroke(100);
  line(xp, yp, xp+10, yp+50);

  myDelay(100);
}

void printtime()
{
  int h = hour();

  int h1 = h / 10;
  int h2 = h % 10;


  text(h1, 15, 60); 
  text(h2, 23, 60); 



  if ( h > 12) {
    h = h - 12;
    int h1_12 = h / 10;
    int h2_12 = h % 10;

    int chk_hour1_12 = abs(disp_h1_12 - h1_12);
    int chk_hour2_12 = abs(disp_h2_12 - h2_12);

    text(disp_h1_12, 15, 190); 
    text(disp_h2_12, 23, 190); 



    if ( chk_hour1_12 > 0) {

      update_h1();
      disp_h1_12 = h1_12;
    }


    if ( chk_hour2_12 > 0) {

      update_h2();
      disp_h2_12 = h2_12;
    }
  }

  if ( h <= 12) {



    int chk_hour1 = abs(disp_h1 - h1);
    int chk_hour2 = abs(disp_h2 - h2);

    text(disp_h1, 15, 90); 
    text(disp_h2, 23, 90); 



    if ( chk_hour1 > 0) {

      update_h1();
      disp_h1 = h1;
    }


    if ( chk_hour2 > 0) {

      update_h2();
      disp_h2 = h2;
    }
  }

  int m = minute();
  int m1 = m/ 10;
  int m2 = m% 10;
  int chk_min1 = abs(disp_m1 - m1);
  int chk_min2 = abs(disp_m2 - m2);



  if ( chk_min1 > 0) {
    update_m1();
    disp_m1 = m1;
  }
  if ( chk_min2 > 0) {
    update_m2();
    disp_m2 = m2;
  }
}  

void update_h1()
{
  fasterase(50, 100);




  hour1();
}

void update_h2()
{
  fasterase(100, 100);
  hour2();
}

void update_m1()
{
  fasterase(170, 100);
  min1();
}

void update_m2()
{
  fasterase(220, 100);
  min2();
}


void hour1()
{
  int h = hour();
  if (h > 12) { 
    h = h - 12;
  }
  int h1 = h/ 10;
  text(h1, 45, 90); 

  if ( h1 == 0) {
    if (disp_h1_12 ==1 ) {
      fasterase(220, 100);
    }
    else 
      blank();
  }

  else
    digit(h1, 50, 100);
}

void blank()
{
}
void hour2()
{
  int h = hour();
  if (h > 12) { 
    h = h - 12;
  }
  int h2 = h % 10; 
  text(h2, 75, 90);
  digit(h2, 100, 100);
}

void min1()
{
  int m = minute();
  int m1 = m/ 10;

  digit(m1, 170, 100);
}

void min2()
{
  int m = minute();
  int m2 = m % 10;

  digit(m2, 220, 100);
}

void digit(int time, float xp, float yp)
{
  if (time == 1) {
    onee(xp, yp);
  }
  else if (time ==2) {
    twoo(xp, yp);
  }
  else if (time == 3) {
    three(xp, yp);
  }
  else  if (time == 4) {
    four(xp, yp);
  }
  else if (time == 5) {
    five(xp, yp);
  }
  else if (time == 6) {
    six(xp, yp);
  }
  else if (time == 7) {
    seven(xp, yp);
  } 
  else if (time == 8) {
    eight(xp, yp);
  }
  else if (time == 9) {
    nine(xp, yp);
  }
  else if (time == 0) {
    zero(xp, yp);
  }
}



void onee (float xp, float yp)
{
  pushMatrix();
  translate(xp, yp);
  rect(0, 0, 10, 10);
  popMatrix();
}

void twoo (float xp, float yp)
{
  pushMatrix();
  translate(xp, yp);
  rect(0, 0, 10, 20);
  popMatrix();
}

void three(float xp, float yp)
{
  pushMatrix();
  translate(xp, yp);
  rect(0, 0, 10, 30);
  popMatrix();
}

void four (float xp, float yp)
{
  pushMatrix();
  translate(xp, yp);
  rect(0, 0, 10, 40);
  popMatrix();
}

void five (float xp, float yp)
{
  pushMatrix();
  translate(xp, yp);
  rect(0, 0, 10, 50);
  popMatrix();
}

void six (float xp, float yp)
{
  pushMatrix();
  translate(xp, yp);
  rect(0, 0, 10, 60);
  popMatrix();
}

void seven (float xp, float yp)
{
  pushMatrix();
  translate(xp, yp);
  rect(0, 0, 10, 70);
  popMatrix();
}

void eight (float xp, float yp)
{
  pushMatrix();
  translate(xp, yp);
  rect(0, 0, 10, 80);
  popMatrix();
}
void nine(float xp, float yp)
{
  pushMatrix();
  translate(xp, yp);
  rect(0, 0, 10, 90);
  popMatrix();
}
void zero (float xp, float yp)
{
  pushMatrix();
  translate(xp, yp);
  rect(0, 0, 10, 5);
  popMatrix();
}

