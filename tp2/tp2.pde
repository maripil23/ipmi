//Fernández María Pilar
//Comisión 1

PImage wedding; //Primera Imagen
PImage emriett; //Segunda Imagen
PImage pretty; //Tercera Imagen
PImage lovethem; //Cuarta Imagen

PFont emmafont;

String pantalla;

int slidearriba;
int slide;
int slideizq;

String letraE;
String letraMAlto;
String letraMBajo;
String letraA;
int puntoxE;
int puntoyM;
int puntoyMM;
int puntoxA;

int segundos;

//textos segunda pantalla
int linea1;
int linea2;
int linea3;
int linea4;
int linea5;
int linea6;
int linea7;
int linea8;
int linea9;

//textos tercerapantalla
int cast;
int anya;
int johnny;
int castizq;
int castdcha;
int castabajo;
String cast1;
String cast2;

int transparencia;
PImage botonreinicio;
String fin;
int finpx;
float pxWedding, pyWedding;


void setup () {
  size(640, 480);
  
  pxWedding= 0 ;
  pyWedding= 0;
    

  //título EMMA
  puntoxE= height/285;
  puntoyM= height-285;
  puntoyMM=height;
  puntoxA=width;
  letraE= "E";
  letraMAlto= "M";
  letraMBajo= "M";
  letraA= "A";
  emmafont = loadFont("BaskOldFace-48.vlw");
  textFont(emmafont, 40);
  
  //textos segunda pantalla
  linea1=height/180;
  linea2=height/180;
  linea3=width;
  linea4=width;
  linea5=width;
  linea6=width;
  linea7=height/300;
  linea8=height/325;
  linea9=height/360;
  
  //textos tercera pantalla
  cast=height-100;
  cast1= "Josh O'Connor \n Callum Turner";
  cast2= "Mia Goth\nMiranda Hart";
  anya=height/170;
  johnny=width;
  castizq=height/250;
  castdcha=width;
  castabajo=height;
  
  //Pantallas
  pantalla= "portada";
  
  //Imágenes
  wedding = loadImage ("wedding.jpg");
  emriett = loadImage ("emriett.jpg");
  pretty = loadImage ("pretty.jpg");
  lovethem = loadImage ("lovethem.jpg");
  botonreinicio= loadImage ("a.png");
  
  slidearriba=height;
  slide=-width;
  slideizq=width;

//animación pantalla 4

transparencia= 10;
  
}
void draw() {
  println (frameCount);
  background(0);
  println(mouseX); 
  println(mouseY);
  
  if (pantalla.equals ("portada")){

    //animación de la imagen
    image (wedding, pxWedding, slidearriba);
    if (slidearriba>0){
    slidearriba--;
    slidearriba--;
    }
    if (slidearriba == 0) {
    
    //Título
    float tonoemma = map(puntoxE, height/285, 70, 0, 255);
    fill(255, 231, 221, tonoemma); //245, 144, 100
    textSize (120);
    textAlign(LEFT);
    text(letraE, puntoxE, 285);
    if (puntoxE<70) {
    puntoxE ++;
    }
    text(letraMAlto, 190, puntoyM);
    if (puntoyM<285) {
    puntoyM ++;
    }
    text(letraMBajo, 325, puntoyMM);
    if (puntoyMM>285) {
    puntoyMM --;
    puntoyMM --;
    }
    text(letraA, puntoxA, 285);
    if (puntoxA>480) {
    puntoxA --;
    puntoxA --;
    }
    textSize (40);
    text("BASED ON THE NOVEL BY", 60, 360);
    textSize (30);
    text("JANE AUSTEN", 215, 400);
    }
  
//comienzo del resto de pantallas
    } else if (pantalla.equals("emriettmoment")) {
      image (emriett, slide, pyWedding);
     if (slide<0){
    slide++;
    slide++;
    }
    if (slide == 0) {
  //float tonocreditosuno = map(puntoycreditos, -height, 100, 0, 255);
    fill(255, 231, 221);    
    textSize (30);
    text("DIRECTED BY", linea1, 180); //70 ancho
    if (linea1<70) {
      linea1 ++;
    }
    textSize (20);
    text("AUTUMN de WILDE", linea2, 220); //70 ancho
    if (linea2<70) {
      linea2 ++;
    }
    textSize (30);
    text("SCREENPLAY BY", linea3, 180); //320 ancho
    if (linea3>320) {
    linea3 --;
    linea3 --;
    }
    textSize (20);
    text("ELEANOR CATTON", linea4, 220); //340 ancho
    if (linea4>340) {
    linea4 --;
    linea4 --;
    }
    textSize (25);
    text("COSTUME DESIGNER", linea5, 320); //310 ancho
    if (linea5>310) {
    linea5 --;
    linea5 --;
    }
    textSize (20);
    text("ALEXANDRA BYRNE", linea6, 360); //340 ancho
    if (linea6>340) {
    linea6 --;
    linea6 --;
    }
    textSize (25);
    text("DIRECTOR", linea7, 300); //110 ancho
    if (linea7<110) {
      linea7 ++;
    }
    textSize (25);
    text("OF PHOTOGRAPHY", linea8, 325); //60 ancho
    if (linea8<60) {
      linea8 ++;
    }
    textSize (20);
    text("CHRISTOPHER BLAUVELT", linea9, 360); //43 ancho
    if (linea9<43) {
      linea9 ++;
    }
    }
  }
  else if (pantalla.equals("creditospartedos")) {
    
    image (pretty, slideizq, pyWedding);
     if (slideizq>0){
    slideizq--;
    slideizq--;
    }
    if (slideizq == 0) {
    textSize (50);
    fill(255, 231, 221);
    text("CAST", 250, 100);
    textSize (30);
    text ("Anya Taylor-Joy",anya, 170); //ancho 350
    if (anya<350) {
      anya ++;
    }
    text ("Johnny Flynn",johnny, 170); //ancho 105
    if (johnny>105) {
    johnny --;
    johnny --;
    }
    text (cast1, castizq, 250); //ancho 100
    if (castizq<100) {
      castizq ++;
    }
    text (cast2, castdcha, 250 ); //ancho 380
    if (castdcha>380) {
    castdcha --;
    castdcha --;
    }
    text ("Bill Nighy", 250, castabajo);
    if (castabajo>380) {
    castabajo --;
    }
    }
  } else if (pantalla.equals("creditosfinales")) {
    tint (transparencia);
    if (transparencia<255){
    transparencia++;
    }
    image (lovethem, 0, 0);
    
    if (transparencia>=255) {
    textSize (100);
    fill(255, 231, 221);
    textAlign (CENTER, CENTER);
    text("THE END", 320, 240);
      image (botonreinicio, 0, 0);
  }
  }
 
    if (frameCount%60 == 0) {
    segundos++;
  }
  if (segundos<10) {
 pantalla= "portada";
}
else if (segundos>=10 && segundos<= 20) {
    pantalla = "emriettmoment";
  } 
  
  else if (segundos >20 && segundos <35) {
    pantalla = "creditospartedos";
 } else {
    pantalla = "creditosfinales";
 }
  }
void mousePressed (){
  if (mouseX>=580 && mouseX<width && mouseY>=400 && mouseY<=height) {
  if (pantalla=="creditosfinales") {
    pantalla= "portada";
    segundos= 1;
  }   
  }
  pxWedding= 0 ;
  pyWedding= 0;
    

  //título EMMA
  puntoxE= height/285;
  puntoyM= height-285;
  puntoyMM=height;
  puntoxA=width;
  letraE= "E";
  letraMAlto= "M";
  letraMBajo= "M";
  letraA= "A";
  emmafont = loadFont("BaskOldFace-48.vlw");
  textFont(emmafont, 40);
  
  //textos segunda pantalla
  linea1=height/180;
  linea2=height/180;
  linea3=width;
  linea4=width;
  linea5=width;
  linea6=width;
  linea7=height/300;
  linea8=height/325;
  linea9=height/360;
  
  //textos tercera pantalla
  cast=height-100;
  cast1= "Josh O'Connor \n Callum Turner";
  cast2= "Mia Goth\nMiranda Hart";
  anya=height/153;
  johnny=width;
  castizq=height/250;
  castdcha=width;
  castabajo=height;
  
  //Pantallas
  pantalla= "portada";
  
  //Imágenes
  wedding = loadImage ("wedding.jpg");
  emriett = loadImage ("emriett.jpg");
  pretty = loadImage ("pretty.jpg");
  lovethem = loadImage ("lovethem.jpg");
  botonreinicio= loadImage ("a.png");
  
  slidearriba=height;
  slide=-width;
  slideizq=width;
  float tonoemma = map(puntoxE, height/285, 70, 0, 255);
  fill(255, 231, 221, tonoemma);
  
//animación pantalla 4

transparencia= 10;
  
} 

   
