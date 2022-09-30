class Escenario {
  Bolas locas;
  Dibujos lineas;
  int col1=round(random(0, 255)), col2=round(random(0, 255)), col3=round(random(0, 255));

  Escenario() {
    noCursor();
    locas = new Bolas();
    lineas = new Dibujos();
  }

  void dibujarFondo() {
    background(col1, col2, col3);
    lineas.nuevaLinea();
    lineas.lineasTraseras();      
    locas.dibujar();
  }

  void mezclarColores() {
    colC1 = round(random(0, 255));
    colC2 = round(random(0, 255));
    colC3 = round(random(0, 255));
    colL1 = round(random(0, 255));
    colL2 = round(random(0, 255));
    colL3 = round(random(0, 255));
    col1 = round(random(0, 255));
    col2 = round(random(0, 255));
    col3 = round(random(0, 255));
  }
}
