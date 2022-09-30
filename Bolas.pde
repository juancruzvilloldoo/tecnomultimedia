int colC1=round(random(0, 255)), colC2=round(random(0, 255)), colC3=round(random(0, 255));

class Bolas {
  int cant;

  Bolas() {
    cant = 5;
  }

  void dibujar() {
    for (int i =0; i<cant; i++) {
      pushStyle();
      fill(colC1, colC2, colC3);
      noStroke();
      circle(random(0, 800), random(0, 600), 50);
      popStyle();
    }
  }
}
