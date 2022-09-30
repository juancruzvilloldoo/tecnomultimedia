int colL1=round(random(0, 255)), colL2=round(random(0, 255)), colL3=round(random(0, 255));
class Dibujos {

  int cantLineas, vel, posIniX, posIniY, cantLineasPasantes, cantGrupos;

  Dibujos() {
    posIniX = 0;
    posIniY = 0;
    cantLineas=20;
    cantLineasPasantes = 200;
    cantGrupos = 5;
    vel=10;
  }

  void nuevaLinea() {
    pushStyle();
    for (int i =0; i<cantLineas; i++) {
      stroke(colL1, colL2, colL3);
      line(0, 0, mouseX, mouseY+i*5);
    }
    for (int j =0; j<cantLineas; j++) {
      stroke(colL1, colL2, colL3);
      line(800, 0, mouseX, mouseY+j*5);
    }
    for (int k =0; k<cantLineas; k++) {
      stroke(colL1, colL2, colL3);
      line(0, 600, mouseX, mouseY+k*5);
    }
    for (int l =0; l<cantLineas; l++) {
      stroke(colL1, colL2, colL3);
      line(800, 600, mouseX, mouseY+l*5);
    }
    popStyle();
  }

  void lineasTraseras() {
    if (posIniX<width) {
      for (int i =0; i<cantLineasPasantes; i++) {
        stroke(colL1+5, colL2+5, colL3+5);
        line(posIniX, posIniY+i*5, posIniX+50, posIniY+i*5);
      }
      posIniX = posIniX + vel;
    } else {
      posIniX = 0;
    }
  }
}
