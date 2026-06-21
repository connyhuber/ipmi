//Link del video: https://youtu.be/FLS07N5bXFU

PImage referencia;

float escala = 1.0;
float rotacion = 0;

color colordelcentro;
color colordelfondo;
color colordelineas;

boolean centrorgb = false; 
boolean lineasrgb = false; 

void setup() {
  size(800, 400);
  referencia = loadImage("referencia.jpg");
  referencia.resize(400, 400);

  colordelcentro = color(220, 70, 40);
  colordelfondo = color(110, 170, 160);
  colordelineas = color(255);
}

void draw() {
 background(0);
 image(referencia, 0, 0);

  //rgb del centro
  if (centrorgb) {
    colordelcentro = color(
      127 + 127*sin(frameCount*0.10),
      127 + 127*sin(frameCount*0.10 + TWO_PI/2),
      127 + 127*sin(frameCount*0.10 + 2*TWO_PI/3));
  }

  //rgb de las líneas
  if (lineasrgb) {
    colordelineas = color(
      127 + 127*sin(frameCount*0.10),
      127 + 127*sin(frameCount*0.10 + TWO_PI/2),
      127 + 127*sin(frameCount*0.10 + 2*TWO_PI/3)
    );
  }

  pushMatrix();
  translate(600, 200);
  rotate(rotacion);
  scale(escala);
  dibujarreferencia(); //funcion propia
  popMatrix();
  
}

void dibujarreferencia() {
  int separacion = 24; //----separación de los hoctagonos
  for (int fila = -8; fila <= 8; fila++) { //arriba
    for (int col = -8; col <= 8; col++) { //costados--- generan el modulo
      float x = col * separacion;
      float y = fila * separacion;
      boolean centro =
        (col >= -2 && col <= 2) && //costados del centro
        (fila >= -2 && fila <= 2); //arriba
      boolean lineasinvertidas =
        ((col == 3) && (fila >= -2 && fila <= 3)) ||
        ((fila == 3) && (col >= -2 && col <= 2));

      if (centro) {
        dibujar(x, y, colordelcentro, true);
      }
      else if (lineasinvertidas){
        dibujar(x, y, colordelfondo, true);
      }else {
        dibujar(x, y, colordelfondo, false);
      }}}}
      
//funcion propia que recibe parametros
void dibujar(float x, float y, color c, boolean orientacionizquierda) {
  pushMatrix();
  translate(x, y);
  scale(1.3);
  stroke(colordelineas);
  strokeWeight(3.5);
  boolean invertir = mouseY > height/2; //cuando el mouse sube y baja se mueven
  if (invertir) {
    orientacionizquierda = !orientacionizquierda;
  }
  if (orientacionizquierda) {
    line(-12, -12, -7, -6);
  } else {
    line(-12, -6, -7, -12); //las invierte
}
  noStroke(); //dibujan los octagonos
  fill(c);
  beginShape();
  vertex(-8, -4);
  vertex(-4, -8);
  vertex(4, -8);
  vertex(8, -4);
  vertex(8, 4);
  vertex(4, 8);
  vertex(-4, 8);
  vertex(-8, 4);
  endShape(CLOSE);
  popMatrix();
}


//Interacciones:
//presionando el mouse en el centro cambian los colores del fondo y el centro
void mousePressed() {
  float dx = mouseX - 600;
  float dy = mouseY - 200;
  
  if (abs(dx) < 80 && abs(dy) < 80) {
    colordelcentro = color(
      random(80, 255),
      random(80, 255),
      random(80, 255));

      colordelfondo = color(
      random(80, 255),
      random(80, 255),
      random(80, 255));
}}

void keyPressed() {
  //el espacio hace que el centro se vuelva rgb
  if (key == ' ') {
    centrorgb = !centrorgb;
    if (!centrorgb) {
      colordelcentro = color(220, 70, 40);
    }
  }

  //l activa un rgb en las lineas blancas
  if (key == 'l' || key == 'L') {
    lineasrgb = !lineasrgb;
    if (!lineasrgb) {
      colordelineas = color(255);
    }
  }

//--------- r para resetear --------------
  if (key == 'r' || key == 'R') {
    colordelcentro = color(220, 70, 40);
    colordelfondo = color(110, 170, 160);
    colordelineas = color(255);
    centrorgb = false;
    lineasrgb = false;
    escala = 1.0;   
}
}
