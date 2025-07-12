PImage[] imagenes = new PImage[3];
String[] textos = {
   "La tecnología transforma\nnuestra forma de vivir,\nde comunicarnos y de crear.",
  "A través de redes,\nalgoritmos y pantallas,\nse moldean nuestras rutinas\n y decisiones.",
  "Pero también abre puertas\n a nuevas formas de arte,\nconexión y conocimiento."

};

PFont fuente;

int estado = 0;             
int tiempoInicio;
int duracion = 5000;        

// Animación del texto
float yTexto = 120;
float alpha = 0;
float escala = 0.8;

void setup() {
  size(640, 480);


  imagenes[0] = loadImage("arte1.jpg");
  imagenes[1] = loadImage("arte2.jpg");
  imagenes[2] = loadImage("arte3.jpg");


  for (int i = 0; i < 3; i++) {
    if (imagenes[i] == null) {
      println("No se pudo cargar la imagen " + (i+1));
    }
  }

  fuente = createFont("Arial", 28); 
  textFont(fuente);
  textAlign(LEFT, TOP);
  tiempoInicio = millis();
}

void draw() {
  background(20); 

  if (estado < 3) {
    image(imagenes[estado], 0, 0, width, height);

    float t = millis() - tiempoInicio;
    alpha = map(t, 0, 1500, 0, 255);
    escala = map(t, 0, 2000, 0.8, 1.1);
    yTexto += 0.1;

    fill(255, alpha);
    textSize(28 * escala);
    text(textos[estado], 80, yTexto);

    if (t > duracion) {
      estado++;
      tiempoInicio = millis();
      yTexto = 120;
      alpha = 0;
      escala = 0.8;
    }

  } else {
    background(10);
    fill(255);
    textSize(24);
    text("Fin de la presentación", 60, 80);

    fill(100, 200, 255);
    rect(60, 140, 160, 40, 10);
    fill(0);
    textSize(18);
    text("Reiniciar", 85, 150);
  }
}

void mousePressed() {
  if (estado == 3) {
    estado = 0;
    tiempoInicio = millis();
    yTexto = 120;
    alpha = 0;
    escala = 0.8;
  }
}
