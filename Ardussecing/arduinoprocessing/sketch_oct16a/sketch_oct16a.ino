int ledA=7;
int ledB=5;
int ledC=4;
int ledD=3;
void setup() {
  // put your setup code here, to run once:
  pinMode(ledA,OUTPUT);
  pinMode(ledB,OUTPUT);
  pinMode(ledC,OUTPUT);
  pinMode(ledD,OUTPUT);
  
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  
  
  if(Serial.available()>0){
    char ledState = Serial.read();
    if(ledState =='0'){
      digitalWrite(ledA,HIGH);
      delay(100);
      digitalWrite(ledA,LOW);
      
    }
     if(ledState =='1'){
      digitalWrite(ledB,HIGH);
      delay(100);
      digitalWrite(ledB,LOW);
    }
    if(ledState =='2'){
      digitalWrite(ledC,HIGH);
      delay(100);
      digitalWrite(ledC,LOW);
    }
    if(ledState =='3'){
      digitalWrite(ledD,HIGH);
      delay(100);
      digitalWrite(ledD,LOW);
    }
  }
 
}
