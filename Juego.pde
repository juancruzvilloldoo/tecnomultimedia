class Juego {
  int estado =0;
  PImage fondoIngame, fondoInicio;
  PFont fuente;
  Personaje personajes;
  Elementos componentes;

  Juego() {
    rectMode(CENTER);
    personajes = new Personaje();
    componentes = new Elementos();

    //Carga de Imagenes
    fondoIngame = loadImage("FondoIngame.jpg");
    fondoInicio = loadImage("FondoInicio.jpg");
    
    //Carga de Fuente
    fuente = createFont("Cookies.ttf", 23);
    

  }

  void pantallaDeJuegoPrincipal() {
    if (estado==1) {  //Pantalla de Juego
      background(255);
      image(fondoIngame, 0, 0);
      personajes.dibujarPersonaje1();
      personajes.dibujarPersonaje2();
      componentes.contador();
      componentes.moneda();
      componentes.obstaculo();
    }

    if (estado==0) { //Primer Pantalla
      background(255);
      image(fondoInicio, 0, 0);
  
      textFont(fuente);
      //Boton Principal Izq
      fill(230);
      fill(0);
      textSize(24);
      text("Inicio", 166, 510);


      //Boton Principal Izq
      push();
      fill(230);
      fill(0);
      textSize(24);
      text("Creditos", 550, 510);
      pop();
    }

    if (estado==2) {  //Creditos
      background(255);
      push();
      fill(0);
      textSize(48);
      text("Juego realizado por\nMatias Rossetti\nVilloldo Juan Cruz\nTecnologia Multimedial 2022\nUNLP", 50, 150);
      pop();

      push();
      fill(230);
      rect(400, 500, 150, 80);
      fill(0);
      textSize(24);
      text("Volver", 350, 510);
      pop();
    }
  }

  void movimientoElementos() {
    if (estado==1) {
      personajes.movimientoDePersonaje1();
      personajes.movimientoDePersonaje2();
    }
  }

  void pantallas() {
    //Boton Creditos    
    if (mouseX > 525 && mouseX < 675 && mouseY > 460 && mouseY < 640 && estado == 0) {
      estado = 2;
    }

    //Boton Inicio Juego   
    if (mouseX > 125 && mouseX < 275 && mouseY > 460 && mouseY < 640 && estado == 0) {
      estado = 1;
    }


    //Boton Volver de los Creditos  
    if (mouseX > 325 && mouseX < 575 && mouseY > 460 && mouseY < 640 && estado == 2) {
      estado = estado - 2;
    }
    
    
  }
}
