
class Button{
int Bx,By,Blargura,Baltura,cor;
String texto;
boolean clicado = false;

Button(int Bx,String texto){
  this.Bx = Bx;
  this.By = 180;
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
  void handleClick() {
    if (!clicado) {
      println("Botão clicado: " + texto );
      clicado = true;
      cor = 126;
    }else{
      clicado = false;
      cor = 255;
    }
  }

}
Button[] buttons = new Button[2];
String[] lines;
int pontuacao = 0;
void setup() {
  
  size(600, 600);
  int setX = 160;
  String[] alternativas = new String[2]; 
    alternativas[0] = "Certo";  
    alternativas[1] = "Errado"; 
    for(int i = 0; i < 2; i++){
  buttons[i] = new Button(setX,alternativas[i]);
  setX = setX + 180;
    }
    
  String url = "http://localhost:3000/questao";
  lines = loadStrings(url);
  
  if (lines != null) {
    println(lines.length);
    for (String line : lines) {
      println(line);
    }
  } else {
    println("Falha ao carregar os dados da URL.");
  }

    

    
}

void draw(){
  background(255);
  
  Button pergunta = new Button(80,80,450,50,lines[0]);
  pergunta.display();
  
  Integer.parseInt(pontuacao);
  Button score = new Button(150,180,50,50,pontuacao);
  score.display();
  
  for (Button button : buttons) {
    button.display();
    if (button.isClicked()) {
      button.handleClick();
    }
  }
}
