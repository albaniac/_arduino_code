
#include <Time.h>


int number[][32]={
  {
    1,1,1,1,1,1,1,1, 
    1,0,0,0,0,0,0,1, 
    1,0,0,0,0,0,0,1, 
    1,1,1,1,1,1,1,1      }//0
  ,
  {
    0,0,0,0,0,0,0,0, 
    0,1,0,0,0,0,0,1, 
    1,1,1,1,1,1,1,1, 
    0,0,0,0,0,0,0,0      }//1
  ,
  {
    1,0,0,1,1,1,1,1, 
    1,0,0,1,0,0,0,1, 
    1,0,0,1,0,0,0,1, 
    1,1,1,1,0,0,0,1      }//2
  ,
  {
    1,0,0,1,0,0,0,1, 
    1,0,0,1,0,0,0,1, 
    1,0,0,1,0,0,0,1, 
    1,1,1,1,1,1,1,1      }//3
  ,
  {
    1,1,1,1,0,0,0,0, 
    0,0,0,1,0,0,0,0, 
    0,0,0,1,0,0,0,0, 
    1,1,1,1,1,1,1,1      }//4
  ,
  {
    1,1,1,1,0,0,0,1, 
    1,0,0,1,0,0,0,1, 
    1,0,0,1,0,0,0,1, 
    1,0,0,1,1,1,1,1      }//5
  ,
  {
    1,1,1,1,1,1,1,1, 
    1,0,0,1,0,0,0,1, 
    1,0,0,1,0,0,0,1, 
    1,0,0,1,1,1,1,1      }//6
  ,
  {
    1,0,0,0,0,0,0,0, 
    1,0,0,0,0,0,0,0, 
    1,0,0,0,0,0,0,0, 
    1,1,1,1,1,1,1,1      }//7
  ,
  {
    1,1,1,1,1,1,1,1, 
    1,0,0,1,0,0,0,1, 
    1,0,0,1,0,0,0,1, 
    1,1,1,1,1,1,1,1      }//8
  ,
  {
    1,1,1,1,0,0,0,1, 
    1,0,0,1,0,0,0,1, 
    1,0,0,1,0,0,0,1, 
    1,1,1,1,1,1,1,1      }//9
  ,
};
int cc[] = {
  0,0,0,0,0,0,0,0, 0,1,1,0,0,1,1,0, 0,1,1,0,0,1,1,0, 0,0,0,0,0,0,0,0};

//int letterSpace = 5000; 4 letter
int letterSpace = 3000;
//int dotTime = 1800;4 letter
int dotTime = 1800;

void setup()
{
  // initialize the digital pin as an output.
  pinMode(2, OUTPUT);    
  pinMode(3, OUTPUT);    
  pinMode(4, OUTPUT);    
  pinMode(5, OUTPUT);    
  pinMode(6, OUTPUT);    
  pinMode(7, OUTPUT);    
  pinMode(8, OUTPUT);    
  pinMode(9, OUTPUT);    

  setTime(11,02,00,2,8,2011);

}

void printLetter(int letter[])
{
  int y;

  // printing the first y row of the letter
  for (y=0; y<8; y++)
  {
    digitalWrite(y+2, letter[y]);
  }
  delayMicroseconds(dotTime);

  // printing the second y row of the letter
  for (y=0; y<8; y++)
  {
    digitalWrite(y+2, letter[y+8]);
  }
  delayMicroseconds(dotTime);

  // printing the third y row of the letter
  for (y=0; y<8; y++)
  {
    digitalWrite(y+2, letter[y+16]);
  }
  delayMicroseconds(dotTime);

  for (y=0; y<8; y++)
  {
    digitalWrite(y+2, letter[y+24]);
  }
  delayMicroseconds(dotTime);





  // printing the sspace between the letters
  for (y=0; y<8; y++)
  {
    digitalWrite(y+2, 0);
  }
  delayMicroseconds(letterSpace);
}





void loop()
{

  int h = hourFormat12();

  int m = minute();
  int s = second();

  int h1 = h / 10;
  int h2 = h % 10;
  int m1 = m / 10;
  int m2 = m % 10;
  int s1 = s / 10;
  int s2 = s % 10;

printLetter(number[h1]);
printLetter(number[h2]);
 printLetter(cc);
printLetter(number[m1]);
printLetter(number[m2]);
 printLetter(cc);
printLetter(number[s1]);
printLetter(number[s2]);




 /* printLetter(d1);
  printLetter(d2);
  printLetter(cc);
  printLetter(d3);
  printLetter(d5);
  printLetter(cc);
  printLetter(d8);
  printLetter(d9);
*/
  // delay(82.5);// for four digits
  delay(65);// for 6 digits
}





