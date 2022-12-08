class Personaje {
  int posXp1, posYp1, posXp2, posYp2, puntosP1, puntosP2;
  PImage P1, P2, fondoFin1, fondoFin2;
  Elementos componentes;
  Personaje() {
    componentes = new Elementos();
    puntosP1=0;
    puntosP2=0;
    posXp1=50;
    posYp1=50;
    posXp2=750;
    posYp2=50;

    P1 = loadImage("babosaP1.png");
    P2 = loadImage("babosaP2.png");
    fondoFin1 = loadImage("FondoFin1.jpg");
    fondoFin2 = loadImage("FondoFin2.jpg");
  }

  void dibujarPersonaje1() {
    condicionSiGanaAlguien();
    push();
    fill(200, 20, 20);
    imageMode(CENTER);
    noStroke();
    image(P1, posXp1, posYp1);
    textSize(14);
    text("Puntos=" + puntosP1, posXp1-35, posYp1+40);
    pop();
  }

  void dibujarPersonaje2() {
    condicionSiGanaAlguien();
    push();
    fill(20, 20, 200);
    imageMode(CENTER);
    noStroke();
    image(P2, posXp2, posYp2);
    textSize(14);
    text("Puntos=" + puntosP2, posXp2-35, posYp2+40);
    pop();
  }

  void colisionConMonedaP1(int posXMoneda, int posYMoneda) {
    if ((posXp1 >= posXMoneda - 50 && posXp1 <= posXMoneda+50) && (posYp1 >= posYMoneda -50 && posYp1 <= posYMoneda+50)) {
      puntosP1++;
    }
  }

  void colisionConMonedaP2(int posXMoneda, int posYMoneda) {
    if ((posXp2 >= posXMoneda - 50 && posXp2 <= posXMoneda+50) && (posYp2 >= posYMoneda -50 && posYp2 <= posYMoneda+50)) {
      puntosP2++;
    }
  }

  void colisionConObstaculoP1(int posXObstaculo, int posYObstaculo) {
    if ((posXp1 >= posXObstaculo - 50 && posXp1 <= posXObstaculo+50) && (posYp1 >= posYObstaculo -50 && posYp1 <= posYObstaculo+50)) {
      puntosP1--;
    }
  }

  void colisionConObstaculoP2(int posXObstaculo, int posYObstaculo) {
    if ((posXp2 >= posXObstaculo - 50 && posXp2 <= posXObstaculo+50) && (posYp2 >= posYObstaculo -50 && posYp2 <= posYObstaculo+50)) {
      puntosP2--;
    }
  }

  void movimientoDePersonaje1() {
    if (keyCode == UP) {
      this.posYp1 = posYp1-10;
    } else if (keyCode == DOWN) {
      this.posYp1= posYp1+10;
    } else if (keyCode == LEFT) {
      this.posXp1= posXp1-10;
    } else if (keyCode == RIGHT) {
      this.posXp1= posXp1+10;
    }

    if (keyCode == 82) {
      puntosP1=0;
      puntosP2=0;
    }
  }

  void movimientoDePersonaje2() {
    if (keyCode == 87 /*w*/) {
      this.posYp2= posYp2-10;
    } else if (keyCode == 83 /*s*/) {
      this.posYp2= posYp2+10;
    } else if (keyCode == 65 /*a*/) {
      this.posXp2= posXp2-10;
    } else if (keyCode == 68 /*d*/) {
      this.posXp2= posXp2+10;
    }
  }

  void condicionSiGanaAlguien () {
    if (puntosP1>=1000&&puntosP2<1000) {
      push();
      textSize(50);
      rectMode(CENTER);
      image(fondoFin1, 0, 0);
      fill(0);
      text("Ganaste p1", width/2, height/2);
      pop();
    } else if (puntosP2>=1000&&puntosP1<1000) {
      push();
      rectMode(CENTER);
      textSize(50);
      image(fondoFin2, 0, 0);
      fill(0);
      text("Ganaste p2", width/2, height/2);
      pop();
    }
  }

  void reiniciar (int tiempo) {
    puntosP1=0;
    puntosP2=0;
    tiempo=0;
  }
}
