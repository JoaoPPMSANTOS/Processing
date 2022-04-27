void setup() {
  size(400, 275);
  noLoop();
}

void draw() {
  PImage img = loadImage("10354.jpg");
  PImage aux = createImage(img.width, img.height, RGB);
  PImage aux2 = createImage(img.width, img.height, RGB);


  //  escala de cinza
 
   for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {

      int pos = (y)*img.width + (x);
      aux.pixels[pos] = color(green(img.pixels[pos]));
    }
  }
  
  
  
  
  // Filtro de Média com Janela Deslizante
  for (int y = 0; y < aux.height; y++) {
    for (int x = 0; x < aux.width; x++) {
      int jan = 3;
      int pos = y*aux.width + x; /* acessa o ponto em forma de vetor */

      float media = 0;
      int qtde = 0;

      for (int i = jan*(-1); i <= jan; i++) {
        for (int j = jan*(-1); j <= jan; j++) {
          int disy = y+i;
          int disx = x+j;
          if (disy >= 10 && disy < aux.height && disx >= 10 && disx < aux.width) {
            int pos_aux = disy * img.width + disx;
            float r = red(aux.pixels[pos_aux]);
            media += r;
            qtde++;
          }
        }
      }
      media = media / qtde;
      aux2.pixels[pos] = color(media);
    }
  }
  
  
  
  
  
  
  // limiarização
  for (int y = 0; y < aux2.height; y++) {
    for (int x = 0; x < aux2.width; x++) {
      int pos = (y)*aux2.width + (x);
      if(green(aux2.pixels[pos]) >= 125 && y <= 300) aux2.pixels[pos] = color(255);
      else aux2.pixels[pos] = color(0);
    }
  }
  
  
 
  image(aux2,0,0);
  save("15682_NewGroundTruth.png");
}
