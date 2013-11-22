byte counter;

void setup(){
  
  Serial.begin(2400);
  counter = 0;
  
}

void loop(){
  Serial.print(counter);
  counter++;
  delay(10);
  
}


