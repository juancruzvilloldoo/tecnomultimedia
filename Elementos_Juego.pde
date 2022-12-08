class Elementos {
  int tiempo, posXOb, posYOb;
  int [] posXM = new int[3];
  int [] posYM = new int[3];
  PImage hoja, obstaculo;

  Elementos() {
    tiempo=120000;
    posXM[0]=round(random(50, 750));
    posXM[1]=round(random(50, 750));
    posXM[2]=round(random(50, 750));
    posYM[0]=round(random(50, 550));
    posYM[1]=round(random(50, 550));
    posYM[2]=round(random(50, 550));
    posXOb=round(random(0, 800));
    posYOb=round(random(0, 600));

    //Carga de Imagenes

    hoja = loadImage("hoja.png");
    obstaculo = loadImage("Obstaculo.png");
  }

  void moneda() {
    push();
    fill(255, 255, 0);
    noStroke();
    imageMode(CENTER);
    image(hoja, posXM[0], posYM[0]);
    image(hoja, posXM[1], posYM[1]);
    image(hoja, posXM[2], posYM[2]);
    nuevaPartida.personajes.colisionConMonedaP1(posXM[0], posYM[0]);
    nuevaPartida.personajes.colisionConMonedaP1(posXM[1], posYM[1]);
    nuevaPartida.personajes.colisionConMonedaP1(posXM[2], posYM[2]);
    nuevaPartida.personajes.colisionConMonedaP2(posXM[0], posYM[0]);
    nuevaPartida.personajes.colisionConMonedaP2(posXM[1], posYM[1]);
    nuevaPartida.personajes.colisionConMonedaP2(posXM[2], posYM[2]);
    randomMonedas();
    pop();
  }

  void contador() {
    if (tiempo>0) {
      for (int i=0; i<60; i++) {
        tiempo = tiempo - 1;
      }
    }
  }

  void obstaculo() {
    push();
    fill(128, 64, 0);
    noStroke();
    imageMode(CENTER);
    image(obstaculo, posXOb, posYOb);
    nuevaPartida.personajes.colisionConObstaculoP1(posXOb, posYOb);
    nuevaPartida.personajes.colisionConObstaculoP2(posXOb, posYOb);
    pop();
  }

  void randomMonedas() {
    if (tiempo<100000 && tiempo>99000) {
      posXM[0]=round(random(50, 750));
      posXM[1]=round(random(50, 750));
      posXM[2]=round(random(50, 750));
      posYM[0]=round(random(50, 550));
      posYM[1]=round(random(50, 550));
      posYM[2]=round(random(50, 550));
    } else if (tiempo<80000 && tiempo>79000) {
      posXM[0]=round(random(50, 750));
      posXM[1]=round(random(50, 750));
      posXM[2]=round(random(50, 750));
      posYM[0]=round(random(50, 550));
      posYM[1]=round(random(50, 550));
      posYM[2]=round(random(50, 550));
    } else if (tiempo<60000&&tiempo>59000) {
      posXM[0]=round(random(50, 750));
      posXM[1]=round(random(50, 750));
      posXM[2]=round(random(50, 750));
      posYM[0]=round(random(50, 550));
      posYM[1]=round(random(50, 550));
      posYM[2]=round(random(50, 550));
    } else if (tiempo<40000&&tiempo>39000) {
      posXM[0]=round(random(50, 750));
      posXM[1]=round(random(50, 750));
      posXM[2]=round(random(50, 750));
      posYM[0]=round(random(50, 550));
      posYM[1]=round(random(50, 550));
      posYM[2]=round(random(50, 550));
    } else if (tiempo<20000&&tiempo>19000) {
      posXM[0]=round(random(50, 750));
      posXM[1]=round(random(50, 750));
      posXM[2]=round(random(50, 750));
      posYM[0]=round(random(50, 550));
      posYM[1]=round(random(50, 550));
      posYM[2]=round(random(50, 550));
    }
  }

  void corroboraTiempo(int puntosP1, int puntosP2) {
    if (tiempo == 0 && puntosP1>puntosP2) {
      push();
      fill(0);
      rect(0, 0, width, height);
      fill(255);
      text("Gana Jugador 1", width, height);
      pop();
    } else if (tiempo == 0 && puntosP1<puntosP2) {
      push();
      fill(0);
      rect(0, 0, width, height);
      fill(255);
      text("Gana Jugador 2", width, height);
      pop();
    }

    if (tiempo == 0 && puntosP1>puntosP2||tiempo == 0 && puntosP1<puntosP2&&keyCode==82) {
      tiempo=120000;
    }
  }
}
