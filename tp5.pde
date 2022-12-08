//Link al Video: https://youtu.be/9L3BJMtg3Ug
// Pantalla Principal

Juego nuevaPartida;
import processing.sound.*;

SoundFile Inicio;

/*-----Void Setup-----*/
void setup() {

  size(800, 600 );
  nuevaPartida = new Juego();

  Inicio = new SoundFile( this, "1.mp3" );
}
/*-----Fin VD-----*/

/*-----Void Draw-----*/
void draw() {
  nuevaPartida.pantallaDeJuegoPrincipal();
  
  if (!Inicio.isPlaying())
    Inicio.play();
}
/*-----Fin VD-----*/

/*-----Eventos del teclado-----*/
void keyPressed() {
  nuevaPartida.movimientoElementos();
}
/*-----Fin EdM-----*/

/*-----Eventos del mouse-----*/
void mouseClicked() {
  nuevaPartida.pantallas();
}
/*-----Fin EdM-----*/
