//com3:valentin san roman 
//https://youtu.be/THTzUXHnjL0
// Variables de configuración
color colorBase = color(100, 200, 200);
color colorAlterno = color(255, 0, 0);
int cantidadColumnas = 15;
int cantidadFilas = 10;
int tamañoCelda = 25;

// Imagen
PImage miImagen;
int posicionImagenX = 20;
int posicionImagenY = 50;

void setup() {
  size(800, 400); // Resolución obligatoria

  
  miImagen = loadImage("dados.png");

  // Verifica que se haya cargado correctamente
  if (miImagen == null) {
    
  } else {
    miImagen.resize(250, 300);
  }
}

void draw() {
  background(255);


  if (miImagen != null) {
    image(miImagen, posicionImagenX, posicionImagenY);
  }

  // Dibuja fondo blanco en la derecha para que no se superpongan cosas
  fill(255);
  noStroke();
  rect(300, 0, width - 300, height);

  // Dibuja la cuadrícula a la derecha
  int offsetX = 320;
  int offsetY = 50;
  dibujarCuadrilla(cantidadColumnas, cantidadFilas, offsetX, offsetY);
}

// Función propia con parámetros que NO retorna
void dibujarCuadrilla(int cols, int rows, int offsetX, int offsetY) {
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      float centroX = offsetX + x * tamañoCelda + tamañoCelda / 2;
      float centroY = offsetY + y * tamañoCelda + tamañoCelda / 2;

      color c = obtenerColorCelda(mouseX, mouseY, centroX, centroY);
      fill(c);
      stroke(0);
      ellipse(centroX, centroY, tamañoCelda * 0.8, tamañoCelda * 0.8);
    }
  }
}

// Función propia que SÍ RETORNA un color
color obtenerColorCelda(float mx, float my, float cx, float cy) {
  float distancia = dist(mx, my, cx, cy);
  if (distancia < 50) {
    return colorAlterno;
  } else {
    return colorBase;
  }
}

// Evento de teclado para cambiar colores
void keyPressed() {
  if (key == 'r' || key == 'R') {
    colorBase = color(100, 200, 200);
    colorAlterno = color(255, 0, 0);
  } else if (key == 'c' || key == 'C') {
    colorBase = color(random(255), random(255), random(255));
    colorAlterno = color(random(255), random(255), random(255));
  }
}
