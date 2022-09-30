//Link al video: https://youtu.be/8GQ57gmf2UU

Escenario fondo;

void setup() {
  size(800, 600 );
  fondo = new Escenario();
}

void draw() {
  fondo.dibujarFondo();
}

void mouseClicked() {
  fondo.mezclarColores();
}
