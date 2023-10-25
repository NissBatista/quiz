import processing.serial.*;

Serial minhaPorta;

class Button{
int Bx,By,Blargura,Baltura,cor;
String texto;
boolean clicado = false;

Button(int By,String texto){
  this.Bx = 40;
  this.By = By;
  this.Blargura = 100;
  this.Baltura = 30;
  this.texto = texto;
  this.cor = 255;
}
Button(int Bx,int By,int Blargura,int Baltura,String texto){
  this.Bx = Bx;
  this.By = By;
  this.Blargura = Blargura;
  this.Baltura = Baltura;
  this.texto = texto;
  this.cor = 255;
  
}

void display(){
  
fill(cor);
stroke(0);
rect(Bx,By,Blargura,Baltura);
if (overButton()) {
      fill(150);
}

textAlign(CENTER,CENTER);
textSize(16);
fill(0);
text(texto,Bx+Blargura/2,By+Baltura/2);
}

boolean overButton() {
    return mouseX >= Bx && mouseX <= Bx + Blargura && mouseY >= By && mouseY <= By + Baltura;
  }

  boolean isClicked() {
    return overButton() && mousePressed;
  }
  void handleClick(int pin) {
    if(!clicado){
    if (!clicado && pin == 0) {
      cor = 126;
      minhaPorta.write('0');
      println("Botão clicado: " + texto );
      clicado = true;
      cor = 126;
    }
    
    if (!clicado && pin == 1){
      cor = 126;
      minhaPorta.write('1');
      println("Botão clicado: " + texto );
      clicado = true;
      
    }
    
    if (!clicado && pin == 2){
      cor = 126;
      minhaPorta.write('2');
      println("Botão clicado: " + texto );
      clicado = true;
      }
      
     if (!clicado && pin == 3){
      cor = 126;
      minhaPorta.write('3');
      println("Botão clicado: " + texto );
      clicado = true;
      }
    }else if(clicado){
      cor = 255;
      clicado = false;
    }
  }
  
}//class


Button[] buttons = new Button[4];



void setup(){
  size(600,600);
  
  minhaPorta = new Serial(this,"COM11",9600);
  minhaPorta.bufferUntil('\n');
  
  int setY = 150;
  String[] alternativas = new String[4]; 
    alternativas[0] = "A";  
    alternativas[1] = "B"; 
    alternativas[2] = "C"; 
    alternativas[3] = "D"; 
    for(int i = 0; i < 4; i++){
  buttons[i] = new Button(setY,alternativas[i]);
  setY = setY + 50;
    }
}

  

void draw(){
  background(255);
  
  Button pergunta = new Button(80,80,450,50,"Pergunta aleatória kkkkk");
  pergunta.display();
  
  int index = 0;
  for (Button button : buttons) {
    button.display();
    if (button.isClicked()) {
      button.handleClick(index);
    }
    index++;
} 

}
