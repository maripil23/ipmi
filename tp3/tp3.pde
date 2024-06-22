//Fernández María Pilar
//Comisión 1
//https://youtu.be/xHwGGBmknbc

PImage opart;             // Imagen original 
int nroCuad = 13;         // Numero de cuadrados enteros de la grilla
float grilTam = 400;      // Tamaño de la grilla 400x400 pixeles      
float cuadTam;            // Tamaño del cuadrado entero de la grilla
float cuadTam2;           // Tamaño de medio cuadrado para los bordes de la grilla
float circDiam;           // Diámetro del círculo de la esquina de cada cuadrado de la grilla
float inicX = 400;        // Coordenada "x" para el inicio de la grilla (400 es la mitad de la ventana)
float inicY = 0;          // Coordenada "y" para el inicio de la grilla (0 es la parte superior de la ventana)

// Variables para definir la posición inicial de la grilla con cuadrados de color rojo
int grilRojInicX = 5;     // Nro.de columna de la grilla para el inicio de la grilla de cuadrados color rojo
int grilRojInicY = 5;     // Nro.de fila de la grilla para el inicio de la grilla de cuadrados color rojo

// Variable para determinar el ángulo de inclinación de las líneas sobre los círculos
boolean anguloDefault = true;        // Esta variable cambia de valor con el click derecho del mouse (se activa = true o desactiva = false)

// Variable para habilitar o deshabilitar la animación con el movimiento con el mouse
boolean habMovMouse = false;         // Esta variable cambia de valor con el click izquierdo del mouse (se activa = true o desactiva = false)

void setup() {
  size(800, 400);                    // Tamaño de la ventana
  opart = loadImage("opart.jpg");    // Cargar la imagen desde el archivo opart.jpg
  background(255);                   // Establece el color de fondo blanco
  image(opart, 0, 0);                // Ubicación de la imagen en el origen de la ventana x=0 ; y=0
  strokeWeight(3);                   // Grosor del borde de los cuadrados
  stroke(0);                         // Color del borde de los cuadrados (negro)
  cuadTam = grilTam / (14);          // Tamaño de cada cuadrado de la grilla (14 porque son 13 cuadrados enteros y 2 medio cuadrado de los bordes)
  cuadTam2 = cuadTam / 2;            // Tamaño de los 1/2 cuadrados
  circDiam = cuadTam / 2;            // Diámetro de los círculos
}

void draw() {
  background(255);                   // Establece el color de fondo blanco
  image(opart, 0, 0);                // Dibujar la imagen en las coordenadas x=0 , y=0
  
  // Dibujar la grilla comenzando desde (400, 0)
  for (int i = 0; i <= 14; i++) {        // Bucle "for" de la coordenada "x" para dibujar los cuadrados de la grilla
    for (int j = 0; j <= 14; j++) {      // Bucle "for" de la coordenada "y" para dibujar los cuadrados de la grilla
      float x;                                       // Variable auxiliar para definir la coordenada "x" donde comienza a dibujarse             
      float y;                                       // Variable auxiliar para definir la coordenada "y" donde comienza a dibujarse
      if (i == 0) {                                  // Cuando el índice es 0 (i=0) la coordenada "x" del primer cuadrado
        x = inicX;                                   // es la definida como inicX (400)
      } else {                                       // de lo contrario, o sea, si i > 0 y i <= 14
        x = inicX + cuadTam2 + (i - 1) * cuadTam;    // la coordenada "x" del cuadrado es el valor inicX más el tamaño del 1/2 cuadrado que se dibujó al inicio 
      }
      if (j == 0) {                                  // Cuando el índice es 0 (j=0) la coordenada "y" del primer cuadrado
        y = inicY;                                   // es la definida como inicY (0)
      } else {                                       // de lo contrario, o sea, si j > 0 y j <= 14
        y = inicY + cuadTam2 + (j - 1) * cuadTam;    // la coordenada "y" del cuadrado es el valor inicY más el tamaño del 1/2 cuadrado que se dibujó al inicio
      }
   // Determinar si se se va a dibujar 1/2 cuadrado o un cuadrado entero      
      float w;                                       // Variable auxiliar para definir el ancho "width" del cuadrado que se dibuja
      float h;                                       // Variable auxiliar para definir el alto "high" del cuadrado que se dibuja
      if (i == 0 || i == 14) {                       // Si el valor del índice "i" es 0 o 14 significa que se está dibujando el primero o el último cuadrado 
        w = cuadTam2;                                // por lo tanto el tamaño es 1/2 cuadrado de ancho
      } else {                                       // de lo contrario o sea, si i > 0 y i < 14
        w = cuadTam;                                 // el tamaño es el de un cuadrado entero
      }
      if (j == 0 || j == 14) {                       // Si el valor del índice "j" es 0 o 14 significa que se está dibujando el primero o el último cuadrado 
        h = cuadTam2;                                // por lo tanto el tamaño es 1/2 cuadrado de alto
      } else {                                       // de lo contrario o sea si i > 0 y j < 14
        h = cuadTam;                                 // el tamaño es el de un cuadrado entero
      }
      
      // Determinar si el cuadrado está en el centro de la grilla
      boolean cuadCentro;                            // Variable auxiliar para considerar que el cuadrado que se está dibujando pertenece al centro de la grilla
     
      cuadCentro = i >= grilRojInicX && i < grilRojInicX + 5 && j >= grilRojInicY && j < grilRojInicY + 5;          // Si el índice (i o j) es mayor o igual a 5 (nro.de columna/fila en la grilla)
                                                                                                                    // y menor que 5 + 5 (columna/fila nro.10 en la grilla)
                                                                                                                    // considerar que es la zona central de la grilla (cuyo tamaño es 5x5 cuadrados)
      // Asignar color al cuadrado en función de la posición. Si pertenece o no al centro de la grilla
      fill(defColorCuad(cuadCentro));               // Usar la función para definir el color y rellenar el cuadrado
      
      rect(x, y, w, h);                             // Dibujar los rectángulos que forman la grilla
      
      // Dibujar los círculos y las líneas
      // Si el índice "i" es mayor que 0 y menor o igual que 14 y el índice "j" es mayor que 0 y menor o igual que 14 significa que se trata de los cuadrados enteros
      if (i > 0 && j > 0 && i <= 14 && j <= 14) { 
      boolean cuadCentroLinea;    // Variable auxiliar para considerar que el cuadrado donde se van a dibujar el círculo y la línea pertenece al centro de la grilla     
      
      // El valor 6 se utiliza para dibujar la esquina superior derecha de los cuadrados que están en la columna 5 y la fila 5 
         cuadCentroLinea = i >= grilRojInicX && i < grilRojInicX + 6 && j >= grilRojInicY && j < grilRojInicY + 6;
                         
      // Ejecutar la función para dibujar un círculo y una línea inclinada en las esquinas de todos los cuadrados de la grilla       
       dibujarForma(x, y, circDiam, cuadCentroLinea);
      }
    }
  }
}

      // Función para dibujar el círculo y la línea inclinada, ambos en las esquinas de los cuadrados
      void dibujarForma(float x, float y, float diametro, boolean CuadradoCentral) {  // Esta función tiene 4 parámetros:
      fill(0);                                 // Definir color negro para los círculos
      ellipse(x, y, diametro, diametro);       // Dibujar el círculo

      // Dibujar líneas blancas inclinadas sobre los círculos
      float longLinea = diametro / sqrt(2);            // Longitud de la línea diagonal dentro del círculo
      stroke(255);                                     // Cambiar color de la línea a blanco
      strokeWeight(4);                                 // Cambiar el grosor de la línea

  if (CuadradoCentral) {                          // Si esta "CuadradoCentral" tiene valor 1 significa que es un cuadrado de la grilla central de 5x5 cuadrados
    if (anguloDefault) {                          // Si esta variable "anguloDefault" tiene valor 1
                                                  // Dibujar la línea con ángulo de 45 grados
      line(x - longLinea / 2, y - longLinea / 2, x + longLinea / 2, y + longLinea / 2);
    } else {                                       // de lo contrario (anguloDefault = 0)
                                                   // Dibujar la línea con ángulo de 135 grados
      line(x - longLinea / 2, y + longLinea / 2, x + longLinea / 2, y - longLinea / 2);
    }
  } else {                                         // Si NO es un cuadrado de la grilla central de 5x5 cuadrados (CuadradoCentral = 0)
    if (anguloDefault) {                           // Si esta variable booleana tiene valor 1
                                                   // Dibujar la línea con ángulo de 135 grados
      line(x - longLinea / 2, y + longLinea / 2, x + longLinea / 2, y - longLinea / 2);
    } else {                                       // de lo contrario
                                                   // Dibujar la línea con ángulo de 45 grados
      line(x - longLinea / 2, y - longLinea / 2, x + longLinea / 2, y + longLinea / 2);
    }
  }

  strokeWeight(3);                             // Restaurar grosor de las líneas
  stroke(0);                                   // Restaurar color negro del borde
}

  // Función con valor de retorno "int" para obtener el color de los cuadrados de la grilla 
  int defColorCuad(boolean cuadCentro) {
  if (cuadCentro) {
    return color(200, 55, 28);                 // Devuelve el color rojo para los cuadrados del centro
  } else {
    return color(96, 148, 146);                // Devuelve el color celeste para los cuadrados fuera del centro
  }
}

// Evento "click izquierdo" del mouse
void mousePressed() {
  if (mouseButton == LEFT) {                   // Al pulsar el botón izquierdo del mouse
    habMovMouse = !habMovMouse;                // se invierte el estado de esta variable 
    if (!habMovMouse) {                        // Si el estado de esta variable es "false" 
      grilRojInicX = 5;                        // Reiniciar la posición de la grilla roja 
      grilRojInicY = 5;
      anguloDefault = true;                    // y el ángulo de inclinacón de las líneas
      redraw();                                // Cargo nuevamente la ventana
    }
// Evento "click derecho" del mouse
  } else if (mouseButton == RIGHT) {           // Al pulsar el botón derecho del mouse
    anguloDefault = !anguloDefault;            // se invierte el estado de esta variable y cambia el ángulo de inclinación de las líneas
    redraw();                                  // Cargo nuevamente la ventana
  }
}
// Animación a través del movimiento del mouse
void mouseMoved() {
   int nuevGrilRojInicX;                       // Variable auxiliar para almacenar la coordenada "x" de inicio de la grilla de color rojo
   int nuevGrilRojInicY;                       // Variable auxiliar para almacenar la coordenada "y" de inicio de la grilla de color rojo
  if (habMovMouse) {                           // La animación del movimiento del mouse está habilitada
    nuevGrilRojInicX = constrain(int(map(mouseX, 0, width, 0, nroCuad - 3)), 1, nroCuad - 3);
    nuevGrilRojInicY = constrain(int(map(mouseY, 0, height, 0, nroCuad - 3)), 1, nroCuad - 3);
// Si el NUEVO VALOR en "x" de la posicion de inicio de la grilla roja es distinto al VALOR ACTUAL en "x" de la posición de inicio de la grilla roja 
// o el NUEVO VALOR en "y" de la posicion de inicio de la grilla roja es distinto al VALOR ACTUAL en "y" de la posición de inicio de la grilla roja
    if (nuevGrilRojInicX != grilRojInicX || nuevGrilRojInicY != grilRojInicY) {
      grilRojInicX = nuevGrilRojInicX;        // Asigno el NUEVO VALOR de "x" al VALOR ACTUAL de "x"
      grilRojInicY = nuevGrilRojInicY;        // Asigno el NUEVO VALOR de "y" al VALOR ACTUAL de "y"
      redraw();                               // Cargo nuevamente la ventana
    }
  }
}
