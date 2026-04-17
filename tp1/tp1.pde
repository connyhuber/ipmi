PImage foto;

void draw(){
image(foto, 0, 0, 400, 400);
println( mouseX + " / " + mouseY );
}

void setup(){
size(800, 400);
foto = loadImage("Esferalasvegas.jpg");
background(0, 10, 20);

fill(0, 0, 0); //Parte más oscura del fondo
stroke(0, 0, 0, 80);
strokeWeight(100);
rect(0, 100, 950, 500);

noStroke(); //Edificios
fill(30);
stroke(0, 0, 0, 50);
strokeWeight(6);
rect(450, 40, 120, 500);
rect(365, 120, 80, 300);
noStroke();
fill(24);
rect(700, 160, 80, 250);
fill(30);
stroke(0, 0, 0, 50);
strokeWeight(5);
rect(630, 90, 90, 250);

//Linea del 2do edificio
stroke(45);
strokeWeight(4);
line(600, 158, 450, 158);

stroke(400, 225, 100, 180); //Esfera 
fill(255, 223, 0); 
strokeWeight(9);
ellipse(600, 250, 260, 250);

noStroke(); // Luz del circulo
fill(260, 240, 100, 100);
ellipse(550, 230, 130, 130);

noStroke(); // Luz del circulo más chiquita
fill(260, 240, 100, 100);
ellipse(620, 290, 40, 40);

noStroke(); //Luz del circulo MAS MAS chiquita
fill(260, 240, 100, 100);
ellipse(510, 215, 35, 35);

noFill();  // Circulo violeta (?
stroke(180, 0, 220);
strokeWeight(3);
ellipse(680, 203, 25, 29);

noStroke(); //Piso
fill(20);
rect(0, 335, 950, 500);

noStroke(); //Parte oscura del piso
fill(3, 0, 0, 20);
rect(200, 335, 900, 34,5);
 
stroke(25); //Boca
strokeWeight(11);
line(630, 280, 643, 280);

stroke(25); // Ojos
strokeWeight(8);
line(620, 250, 580, 251); // ojo izquierdo
line(690, 251, 650, 250); // ojo derecho   
}

 
