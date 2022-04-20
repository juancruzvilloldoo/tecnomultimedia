void setup() {
  size (400, 400);
  rectMode(CENTER);
}

void draw() {
  /*---INICIO CIELO--*/
  background(135, 206, 235);
  noStroke();

  //Nube 1
  fill(255);
  circle(250, 100, 50);
  circle(280, 100, 50);
  circle(300, 100, 50);
  circle(270, 80, 50);
  circle(290, 80, 50);

  //Nube 2
  circle(150, 50, 50);
  circle(180, 50, 50);
  circle(200, 50, 50);
  circle(170, 40, 50);
  circle(190, 40, 50);

  //Nube 3
  circle(350, 150, 50);
  circle(380, 150, 50);
  circle(400, 150, 50);
  circle(370, 120, 50);
  circle(390, 120, 50);

  //Sol
  fill(255, 255, 0);
  circle(50, 50, 200);
  /*---FIN CIELO--*/

  /*---INICIO ENTORNO--*/
  //Suelo
  fill(34, 139, 34);
  rect(200, 350, 400, 100);

  //Flor 1
  fill(219, 112, 147);
  circle(150, 360, 10);
  circle(155, 360, 10);
  circle(150, 365, 10);
  circle(155, 365, 10);
  fill(32, 178, 170);
  circle(153, 363, 5);

  //Flor 2
  fill(219, 112, 147);
  circle(250, 340, 10);
  circle(255, 340, 10);
  circle(250, 345, 10);
  circle(255, 345, 10);
  fill(32, 178, 170);
  circle(253, 343, 5);

  //Flor 3
  fill(219, 112, 147);
  circle(350, 380, 10);
  circle(355, 380, 10);
  circle(350, 385, 10);
  circle(355, 385, 10);
  fill(32, 178, 170);
  circle(353, 383, 5);
  /*---FIN ENTORNO--*/

  /*---INICIO MUÑECO--*/
  fill(255);
  //Cuerpo
  circle(100, 180, 70);
  circle(100, 240, 100);
  circle(100, 310, 120);
  
  //Brazos
  stroke(0);
  line(150, 240, 190, 260);
  line(50, 240, 10, 260);


  //Cara
  fill(0);
  circle(90, 170, 10);
  circle(110, 170, 10);
  circle(100, 190, 15);


  /*---FIN MUÑECO--*/
}
