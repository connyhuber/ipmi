PImage foto;
int estado;

int mivariable = 0;


float y = -10;     // punto donde inicia
float velocidad = 2; 
float yFinal = 100; // punto donde para

float velo = 5;
float opacidad = 0;
float opacity = 0;
float opacidadd = 0; //opacidad se repite ya que si se volvía a usar la misma variable dejaba de funcionar
boolean apareciendo = true;

PFont fuenteclubpenguin;
PFont nunito;

float yeye;
boolean subir = true;

float xdecuna;
float velocidaddecuna = 7;
float velocidadverde = 15;

int botonX = 220, botonY = 300, botonW = 200, botonH = 60;

int tiempoCambio = 14000; 
int cambio;         

String textoPuffles = "Los Puffles son unos animales pequeños y peludos nativos de la isla de Club Penguin, estos podían ser adoptados como mascotas por los jugadores a cambio de monedas.\nPodías pasearlos, alimentarlos y jugar con ellos, pero en caso de ser descuidados podían abandonarte para volver al bosque.";
int caracteresMostrados = 0; 
int velocidadTexto = 2;

String textocolaboraciones = "También, ocasionalmente contaba con actualizaciones en colaboración con otras franquicias, permitiendo obtener items exclusivos y nuevos mapas limitados que los usuarios podían recorrer y descubrir a la par de completar misiones.";
int caracterescolaboraciones;

String textominijuegos = "El juego contó con más de 30 minijuegos principales tanto individuales como multijugador, en los que podías ganar monedas para comprar artículos.";
int caracteresminijuegos;

String textomembresia = "Si bien el juego era gratuito, existía la membresía, la cual daba acceso a los usuarios que la pagaran a un mayor rango de costumización de su pingüino, su iglú (casa) y sus mascotas.";
int caracteresmembresia;

float ypinguino = -100;
float yswag = 400;
float yfinalswag = 200;
float ymembresia = -200; //donde empieza
float yfinalmembresia = 63; //donde termina-para
float surfinicio = -200;
float yfinalsurf = 50;
float xpizzatron = -200;
float xfinalpizzatron = 10;

float ysad = 300;
float salto = 30;
float sadsalto = 3;
boolean sube = true;  //Aca también tuve que hacer floats iguales porque al usarlos repetidamente estos se corrompían y dejaban de funcionar

float xdojo = 700;
float xfinaldojo = 430;
float velocidaddedojo = 7;


void setup (){
size (640, 480);
estado = 0; 
println( estado );
frameRate(60);

fuenteclubpenguin = createFont("BUMBASTIKA", 2);
nunito = createFont("nunito", 10);
yeye = height;
xdecuna = width; 
 }

void draw(){  
println( frameCount);

if (estado < 5 && millis() - cambio > tiempoCambio) { //cambiar a 5!!!!!!!!!!!!!!!!!!!
    estado++;
    cambio = millis(); // reinicia el contador
    println("Cambio automático de pantalla, estado = " + estado);
}

  
//-----------------pantalla 1
if( estado == 0 ){
foto = loadImage("fondo.png"); //fondo
image(foto, 0, 0, 640, 640 );

foto = loadImage("pinguino viejo3.png");    
image(foto, ypinguino, 295, 190, 190 );
ypinguino += velocidad/2; //pinguino movimiento

//explicación del titulo
textFont(nunito);
fill(0, 0, 60, opacidad);
textSize(22);
textLeading(20);
if (apareciendo) {
opacidad += velo;}
if (opacidad >= 255) {
opacidad = 255;
apareciendo = false; }
text("Club Penguin fué un juego online multijugador masivo que consistía en un mundo que tenía una serie de juegos y actividades virtuales. Los jugadores utilizaban avatares de pingüinos y podían interactuar en un mapa abierto de temática antártica.", 150, 120, 350, 350 );
    
//titulo movimiento
textFont(fuenteclubpenguin);
fill(0,0, 100);
textSize(40);
textAlign(CENTER);
text("CLUB PENGUIN",width/2, y);
if (y < yFinal) {
y += velocidad; }
  
  
//----------------------pantalla 2
}else if( estado == 1 ){
background(0);
foto = loadImage("fondo2.png"); //fondo
image(foto, 0, 0, 640, 640 );

foto = loadImage("puffless (1).png"); //puffles: 
if (xdecuna > 230){
xdecuna -= velocidaddecuna;
}
image(foto, xdecuna, 230, 400, 300 );


foto = loadImage("puffleverde.png"); //puffle verde:
if (subir) {
yeye -= velocidadverde;   // sube
if (yeye <= 170) {   // llega a arriba
subir = false;     // cambia a bajar
}
} else {
yeye += velocidadverde/2;   // baja
if (yeye >= height-100){ //límite 
}
}
image(foto, width/2 - foto.width/2 , yeye);

textFont(nunito);
textLeading(18);
textSize(21);
fill(0, 0, 60);
String textoVisible = textoPuffles.substring(0, min(caracteresMostrados, textoPuffles.length()));
text(textoVisible, 30, 20, 400, 400);
fill(0, 0, 60);
if (caracteresMostrados < textoPuffles.length()) {
    caracteresMostrados += velocidadTexto; // aumenta 
  }
    
    
//--------------------pantalla 3
}else if( estado == 2 ){  
foto = loadImage("fondo.png"); //fondo
image(foto, 0, 0, 640, 640 );

foto = loadImage("swag.png"); //pinguino 1
image(foto, 200, yswag, 400, 400 );
if (yswag > yfinalswag){ //Pinguino 1 sube
  yswag -= velocidaddecuna;}

foto = loadImage("membresia (1).png"); //foto de la membresia
if (ymembresia < yfinalmembresia){ //membresia baja
  ymembresia += velocidaddecuna;}
image(foto, 315, ymembresia, 170, 150 );

foto = loadImage("saddd (1).png"); //pinguino 2
if (sube){ //Pinguino 2 salta
  ysad -= sadsalto;
  if (ysad <= 300 - salto){
    sube = false; }
} else {
  ysad += sadsalto;
  if (ysad >= 300){
    sube = true;
  }
}
image(foto, 20, ysad, 200, 200 );


textLeading(15);
textSize(22);
fill(0, 0, 60);
textAlign(CENTER);
String texto = textomembresia.substring(0, min(caracteresmembresia, textomembresia.length()));
text(texto, 10, 30, 300, 300);
if (caracteresmembresia < textomembresia.length()) {
    caracteresmembresia += velocidadTexto; // aumenta progresivamente
  }

  
//------------------pantalla 4
  }else if( estado == 3 ){
foto = loadImage("fondo2.png"); //fondo
image(foto, 0, 0, 640, 640 );

foto = loadImage("pizzatron.png"); 
image(foto, xpizzatron, 50, 200, 200 );
if (xpizzatron < xfinalpizzatron){
  xpizzatron += velocidaddedojo; } //viene desde la izquierda

foto = loadImage("dojo.png");
image(foto, xdojo, 50, 200, 200 );
if (xdojo > xfinaldojo){
  xdojo -= velocidaddedojo; } //viene desde la derecha

foto = loadImage("surf.png"); 
image(foto, 220, surfinicio, 200, 200 );
if (surfinicio < yfinalsurf){
surfinicio += velocidaddecuna; } //viene desde el medio


if (opacidadd < 180) opacidadd += velo;
tint(220, opacidadd);
foto = loadImage("pizzatron3000.png"); 
image(foto, 30, 160, 150, 150 );
foto = loadImage("catchingwaves.png"); 
image(foto, 250, 210, 150, 100 );
foto = loadImage("cardjitsu.png"); 
image(foto, 450, 220, 160, 100 );
noTint(); //opacidad de los logos

noStroke();
textLeading(13);
textSize(25);
textAlign(CENTER);
fill(0, 0, 60);
String textoso = textominijuegos.substring(0, min(caracteresminijuegos, textominijuegos.length()));
text(textoso, 20, 350, 600, 600);
if (caracteresminijuegos < textominijuegos.length()) {
    caracteresminijuegos += velocidadTexto; // va aumentando
  }
  
//-------------------pantalla 5
}else if( estado == 4 ){
foto = loadImage("fondo.png"); //fondo
image(foto, 0, 0, 640, 640 );

foto = loadImage("dory (1).png"); 
if (opacity < 255) opacity += velocidad; //opacidad de los textos
tint(255, opacity);
image(foto, 20, 340, 150, 100 );

foto = loadImage("zootopia (1).png"); 
image(foto, 200, 340, 200, 100 );

foto = loadImage("frozen (1).png"); 
image(foto, 430, 340, 150, 100 );

foto = loadImage("marvel (1).png"); 
image(foto, 100, 220, 150, 100 );

foto = loadImage("starwars (1).png");
image(foto, 330, 220, 150, 100 );

noTint();
textLeading(13);
textSize(20);
textAlign(CENTER);
String textocolaboracioness = textocolaboraciones.substring(0, min(caracterescolaboraciones, textocolaboraciones.length()));
fill(0, 0, 60);
text(textocolaboracioness, 10, 85, 600, 600);
if (caracterescolaboraciones < textocolaboraciones.length()) {
    caracterescolaboraciones += velocidadTexto; }


//--------------------pantalla 6 
}else if( estado == 5 ){  
if (opacidad < 230){
  opacidad += velocidad;
  
}
    fill(255, 102, 0); // ventana de notificación
    stroke(225);
    strokeWeight(2);
    rect(150, 200, 340, 200, 20);

    fill(0); // mensaje de la ventana
    textAlign(CENTER, CENTER);
    textSize(24);
    text("La conexión se ha perdido.", width/2, 240);

    stroke(180, 80, 0); // botón para reiniciar
    strokeWeight(2);
    fill(225, 102, 0);
    rect(botonX, botonY, botonW, botonH, 10);
    fill(225);
    textSize(20);
    text("Reintentar.", botonX + botonW/2, botonY + botonH/2);

// El botón de reinicio está inspirado en la pestaña que salía al perder la conexión en Club Penguin, por eso no le di su propia pantalla!!

  }
}

void mousePressed(){
   if (estado == 5 &&
      mouseX > botonX && mouseX < botonX + botonW &&
      mouseY > botonY && mouseY < botonY + botonH) {
    estado = 0; // vuelve al inicio
    cambio = millis(); // reinicia el contador de tiempo
    println("botón de reintentar presionado, estado = " + estado);
}
}
