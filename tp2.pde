//VILLOLDO JUAN CRUZ - 85012/7
//LINK AL VIDEO: https://youtu.be/INWbWLLHB2c

PImage gato;
int cantLinea, vel,posSigLin = 5;


void setup () {
  size(600, 600);
  rectMode(CENTER);
  imageMode(CENTER);
  gato = loadImage("gato.jpg");
  cantLinea = 1000;
  vel = 1;
}

void draw() {
  background(255);
  image(gato, width/2, height/2, width/2, height/2);
  fill(0);
  for (int i=0; i<cantLinea; i=i+2) {
    nuevaLinea(i*map(mouseX,0,600,0,10), 0, 3, height*2);
    
  }
}


void nuevaLinea(float posXLin, int posYLin, int anchoLin, int altoLin) {
  rect(posXLin, posYLin, anchoLin, height*2);
}
