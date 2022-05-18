float posx, posy, direccion, tamano, segundos, ancho;
float pxx, pyy;
float movimiento;
float velocidad;
float dy, dx, direccionx, direcciony;

color color1;

PFont personajes;
String estado; 

PImage booker;
PImage elizabeth;
PImage creador;
PImage principal;
PImage Songbird;

void setup() {

  size (600, 400);
  background(255);

  pxx = 600;
  pyy = 400;

  movimiento= random(10, 40);
  velocidad = 2;

  dx = width/2;
  dy = height/2;

  direccionx = random(-2, 2);
  direcciony= random(-2, 2);

  elizabeth = loadImage("elizabeth.png");
  booker= loadImage("booker.png");
  creador = loadImage("creador.png");
  principal= loadImage("principal.png");
  Songbird = loadImage("Songbird.png");
  personajes = loadFont ("Castellar-48.vlw");
  color1 = color(random(255));
}

void draw() {
  noCursor();
  image(Songbird, mouseX, mouseY, 80, 80);
  if (frameCount%30 == 0) { 
    segundos++;
  }
  if (segundos<=1 && segundos <=5) {
    estado= "inicio";
  } else if (segundos>=11 && segundos <=12) {
    estado = "booker";
  } else if (segundos>=21 && segundos <= 22) {
    estado = "elizabeth";
  } else if (segundos>=28 && segundos <= 31) {
    estado = "titulo";
  } else if (segundos>=31.1 && segundos <= 50) {
    estado = "director";
  } else if (segundos>=50.5 && segundos <= 55) {
    estado = "estudio";
  }

  if (estado.equals("inicio")) {
    float opaco = map(segundos, 0, 20, 0, 255);
    textFont(personajes);
    fill(255);
    textSize(34);
    text("Irrational games presenta", 10, 200);
    fill(0, opaco);
    noStroke();
    rect(0, 0, 600, 400);
    color1 = color(random(255));
    posx = random(width);
    posy = random(height);
    tamano = random(90, 200);
    ancho = random(0, 20);
    noFill();
    stroke(color1);
    strokeWeight(ancho);
    ellipse(posx, posy, tamano, tamano);
  }

  if (estado.equals("booker")) {
    float opaco2 = map(segundos, 8, 20, 0, 255);
    textSize(40);
    fill(255, opaco2);
    noStroke();
    rect(0, 0, 600, 400);
    fill(143, 31, 7, opaco2);
    text("Booker", pxx, 200);
    text("Dewitt", pxx, 300);
    pxx-=velocidad;
    imageMode(CENTER);
    image(booker, 500, pyy+700, 400, 900);
    pyy-=velocidad;
  }

  if (estado.equals("elizabeth")) {
    float opaco2 = map(segundos, 20, 25, 0, 255);
    fill(255, opaco2);
    noStroke();
    rect(0, 0, 600, 400);
    textFont(personajes);
    fill(160, 101, 33, opaco2);
    text("Elizabeth", pxx-150, 200);
    text("Dewitt", pxx-150, 300);
    pxx+=velocidad;
    imageMode(CENTER);
    image(elizabeth, 100, pyy+1050, 400, 900);
    pyy-=velocidad;
  }

  if (estado.equals("titulo")) {
    noStroke();
    fill(255);
    rect(0, 0, 600, 400);
    image(creador, pxx-200, 200, 800, 600);
    pxx+=1;
    textFont(personajes);
    textSize(50);
    fill(250, 128, 114);
    text("Protagonizan", 30, pyy+500);
    textSize(90);
    fill(255, 0, 0);
    text("BIOSHOCK", 30, pyy+570);
    text("INFINITE", 50, pyy+640);
    pyy+=velocidad;
  }

  if (estado.equals("director")) {
    float opaco2 = map(segundos, 30, 35, 0, 255);
    fill(255, opaco2);
    noStroke();
    rect(0, 0, 600, 400);
    textFont(personajes);
    textSize(50);
    fill(218, 165, 32);
    text("Director", pxx, 130);
    textSize(90);
    fill(206, 182, 108);
    text("Ken", pxx, 200);
    text("Levine", pxx, 290);
    pxx-=velocidad;
  }

  if (estado.equals("estudio")) {
    fill(255);
    noStroke();
    rect(0, 0, 600, 400);
    if (dx>= width-400/2||dx< 400/2) {
      direccionx = direccionx *-1;
    }
    if (dy>= height-100/2||dy< 100/2) {
      direcciony = direcciony *-1;
    }
    image(principal, dx, dy, 400, 200);
    dx = dx+direccionx;
    dy = dy+direcciony;
  }
}
