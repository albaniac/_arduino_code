//int motorPins[] = {2, 3, 4, 5};
int count = 0;

int delayTime = 3;
int vval = 0;
const int analogInPin1 = 0;
int motorPin1 = 2;
int motorPin2 = 3;
int motorPin3 = 4;
int motorPin4 = 5;
int pos = 0;
int oldPos = 0;
int motorPos = 0;
int tomove = 0;
int rp = 0;
void setup() {
  pinMode(motorPin1, OUTPUT);
  pinMode(motorPin2, OUTPUT);
  pinMode(motorPin3, OUTPUT);
  pinMode(motorPin4, OUTPUT);
  pinMode(13,OUTPUT);
  Serial.begin(9600);
}

void moveForward(int sp) {

  for(count = 0; count <= sp; count++){
    digitalWrite(motorPin1, HIGH);
    digitalWrite(motorPin2, LOW);
    digitalWrite(motorPin3, LOW);
    digitalWrite(motorPin4, LOW);
    delay(delayTime);
    digitalWrite(motorPin1, LOW);
    digitalWrite(motorPin2, HIGH);
    digitalWrite(motorPin3, LOW);
    digitalWrite(motorPin4, LOW);
    delay(delayTime);
    digitalWrite(motorPin1, LOW);
    digitalWrite(motorPin2, LOW);
    digitalWrite(motorPin3, HIGH);
    digitalWrite(motorPin4, LOW);
    delay(delayTime);
    digitalWrite(motorPin1, LOW);
    digitalWrite(motorPin2, LOW);
    digitalWrite(motorPin3, LOW);
    digitalWrite(motorPin4, HIGH);
    delay(delayTime);
  }
  motorPos = motorPos + sp;
  Serial.print("forward = " );
  Serial.println(sp );


}


void moveBackward(int sp) {
  rp = sp - (sp * 2);
  for(count = 0; count <= rp; count++){
    digitalWrite(motorPin1, LOW);
    digitalWrite(motorPin2, LOW);
    digitalWrite(motorPin3, LOW);
    digitalWrite(motorPin4, HIGH);
    delay(delayTime);
    digitalWrite(motorPin1, LOW);
    digitalWrite(motorPin2, LOW);
    digitalWrite(motorPin3, HIGH);
    digitalWrite(motorPin4, LOW);
    delay(delayTime);
    digitalWrite(motorPin1, LOW);
    digitalWrite(motorPin2, HIGH);
    digitalWrite(motorPin3, LOW);
    digitalWrite(motorPin4, LOW);
    delay(delayTime);
    digitalWrite(motorPin1, HIGH);
    digitalWrite(motorPin2, LOW);
    digitalWrite(motorPin3, LOW);
    digitalWrite(motorPin4, LOW);
    delay(delayTime);
    motorPos = motorPos + sp;


  }
  Serial.print("back = " );
  Serial.println(sp );
}



void loop() {

  vval = analogRead(analogInPin1);
  pos = map(vval, 0, 1024, 0, 100);

  //pos = val;
  if (pos != motorPos){
    delay(50);
    pos = analogRead(analogInPin1);
    if (pos != motorPos){
      tomove = pos - motorPos;
      Serial.print("valpos = " );
      Serial.println(pos);
      Serial.print("motorpos = " );
      Serial.println(motorPos);

      Serial.print("tomove = " );
      Serial.println(tomove);

      if (tomove > 0){
        moveForward(tomove);
        delay(10);
      }
      else if(tomove < 0)
      { 
       // tomove = tomove - (tomove * 2);

        moveBackward(tomove);
        delay(10);
      }
    }
  }

}



  //Serial.print("pot = " );                       
  //Serial.print(val); 

  //digitalWrite(13, LOW);
  //delay(10);
  //moveBackward(val);
  //digitalWrite(13, HIGH);
  //delay(10);
//}




