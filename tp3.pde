/*

 ALUMNOS
 Villoldo Juan Cruz (85012/7)
 Rossetti Matias (83641/4)
 
 LINK AL VIDEO: https://youtu.be/C18lYJna4dc
 
 El objetivo del juego es hacer que el larry logre obtener 10 peces antes que el tiempo se acabe,
 si lo logra puede pagar sus vacaciones, sino, se hunde su barco.
 estos pueden ser recolectadas de dos maneras
 llegando al otro lado del mapa sin tocar los obstaculos o
 juntando los peces que suman dos en vez de uno.
 Si el larry toca el bote pierde un pez.
 
 */

/*-----VARIABLES (INICIO)-----*/

int cantH = 10, tam, cantW = 10, personajePosY, personajePosX, dinero = 0, PresaPosW, PresaPosH; 
int [] posX = new int [cantH]; 
int [] dirX = new int [cantH]; 

float tiempo = 60;

PFont fuente;
PImage [] imagenes = new PImage [6];


/*-----VARIABLES (FINAL)-----*/

/*-----V.SETUP (INICIO)-----*/

void setup() {
  size(500, 500);
  tam = height/cantH;
  textAlign(CENTER);
  imageMode(CENTER);

  PresaPosW = round(random(0, width));
  PresaPosH = round(random(0, height));

  //Personaje
  for (int h=0; h < cantH-1; h++) {
    //PosX de la elipse
    posX[h] = round(random(tam, width-tam));
    //Dirección
    if (random(0, width)>width/2)
      dirX[h] = 1;
    else
      dirX[h] = -1;
  }

  //Ubicación Personaje
  personajePosX = width/2;
  personajePosY = height - tam/2;

  //Carga de Imagenes
  for (int i = 0; i < imagenes.length; i ++) {
    imagenes[i] = loadImage("I" + i + ".png");
  }

  //Carga de Fuente
  fuente = createFont("treasure.ttf", 23);
}

/*-----V.SETUP (FINAL)-----*/


/*-----V.DRAW (INICIO)-----*/

void draw() {  
  tiempo = tiempo - 0.05;
  tam = height/cantH;
  textFont(fuente);
  background(250);
  image(imagenes[0], 250, 250, width, height);

  //Arranque del personaje
  for (int h=0; h < cantH-1; h++) {
    image(imagenes[5], posX[h], h*tam + tam/2, tam*2, tam*2);
    posX[h] = posX[h] + dirX[h];

    //Condicion si llega a tocar obstaculo 
    if (dist(posX[h], h*tam+tam/2, personajePosX, personajePosY)<=tam-5) {
      personajePosY = height - tam/2;
      dinero = dinero - 1;
    }

    if (posX[h] < tam/2 || posX[h] > width-tam/2) {
      dirX[h] = dirX[h] * -1;
    }

    //Personaje
    image(imagenes[3], personajePosX, personajePosY, tam*2, tam*2);

    //Presa 
    image(imagenes[4], PresaPosW, PresaPosH, tam*1.3, tam*1.3);
  }
  //Condicion de que llego a otro lado
  if (personajePosX<=250 && personajePosY<=1) {
    dinero= dinero+1;
    personajePosY = height - tam/2;
  }
  //Condicion si junta pez
  if (dist(PresaPosW, PresaPosH, personajePosX, personajePosY)<=tam-5) {
    dinero = dinero + 2; 
    PresaPosW = round(random(0, width));
    PresaPosH = round(random(0, height));
  } 

  //Contador de peces  y Tiempo...Instruccion
  textSize(14);
  texto("Ayuda a Larry a comer a sus presas!\nUsa el teclado para nadar por el oceano, atrapa la mayor cantidad de presas!\n Ten cuidado con los barcos! si chocas con ellos perderas tiempo", 250, 20, 0);
  textSize(20);
  texto("Tiempo:" + round((tiempo)), width-350, height-30, 255);
  texto("Peces:" + (dinero), width-150, height-30, 255);

  //Si cruza el oceano suma un punto
  if (personajePosY < 0) {
    dinero = dinero + 1;
    personajePosY = height - tam/2;
  }

  //Victoria si llega a 10 pecess
  if (dinero >= 10) {
    ganaJuego(width, height);
  }

  //Si pierde Juego
  if (tiempo <= 0 && dinero < 10) {
    pierdeJuego();
  }
}

/*-----V.SETUP (FINAL)-----*/


/*-----V.K.PRESSED (INICIO)-----*/

void keyPressed() {
  //Movimiento del personaje
  if (keyCode == UP) {
    personajePosY = personajePosY - tam;
  } else if (keyCode == DOWN) {
    personajePosY = personajePosY + tam;
  } else if (keyCode == LEFT) {
    personajePosX = personajePosX - 7;
  } else if (keyCode == RIGHT) {
    personajePosX = personajePosX + 7;
  }
}

/*-----V.K.PRESSED (FINAL)-----*/


/*-----V.M.CLICKED (INICIO)-----*/
//Para regresar a su estado inicial
void mouseClicked() {  
  if ((dinero >= 10)||(tiempo <= 0 && dinero < 10)) {
    personajePosY = height - tam/2;
    dinero = 0;
    tiempo = 60;
  }
}
/*-----V.M.CLICKED (FINAL)-----*/



/*-----V.Pierde (INICIO)-----*/
void pierdeJuego() {
  fill(200, 0, 0, 180);
  image(imagenes[2], 250, 250, width, height);
  texto("Perdiste, Larry no pudo comer!\n Gracias por participar\n Juego Realizado por\n Villoldo Juan Cruz\n Matias Rossetti\n Tecnologia Multimedial 2022\n\n Haz Click para intentar nuevamente", width/2, height/3, 255);
}
/*-----V.Pierde (FINAL)-----*/

/*-----V.Gana (INICIO)-----*/
void ganaJuego(float ancho, float alto) {
  image(imagenes[1], 250, 250, ancho, alto);
  texto("¡Felicidades, Larry quedo muy satisfecho!\nrelajate y disfruta\nHace click para volver a empezar", width/2, height/2+50, 255);
}
/*-----V.Gana (FINAL)-----*/

/*-----V.Texto (INICIO)-----*/
void texto(String escribirT, int posX, int posY, int colorT) {
  fill(colorT);
  text(escribirT, posX, posY );
}
/*-----V.Texto (FINAL)-----*/
