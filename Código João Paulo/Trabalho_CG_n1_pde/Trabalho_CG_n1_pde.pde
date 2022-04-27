void setup() { 
  size(400, 250); 
  noLoop(); 
}

void draw() {
  PImage img = loadImage("1_48_48388.jpg"); 
  img.loadPixels();
  
  PImage aux = createImage(img.width, img.height, RGB); 
  PImage aux2 = createImage(img.width, img.height, RGB);
  
  // Filtro escala de cinza 
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) { 
      
      int pos = (y)*img.width + (x); 
      float media = blue(img.pixels[pos]);
      aux.pixels[pos] = color(media);
    }
  }
  
  //Kernel
  int[][] gx={{-1,-2,-1},{0,0,0},{1,2,1}};
  int[][] gy={{-1,0,1},{-2,0,2},{-1,0,1}};
  
  // Filtro de Borda - Sobel
  /* percorre a imagem */ 
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) { 
      int jan = 1;
      int pos = (y)*img.width + (x); /* acessa o ponto em forma de vetor */
      
      float mediaOx = 0, mediaOy = 0;
      
      // janela tamanho 1
      for(int i = jan*(-1); i <= jan; i++) {
        for (int j = jan*(-1); j <= jan; j++) {
          int disy = y+i;
          int disx = x+j;
          if(disy >= 0 && disy < img.height &&
             disx >= 0 && disx < img.width) {
              int pos_aux = disy * img.width + disx;
              float Ox = red(aux.pixels[pos_aux]) * gx[i+1][j+1];
              float Oy = red(aux.pixels[pos_aux]) * gy[i+1][j+1];
              mediaOx += Ox;
              mediaOy += Oy;
             }
        }
      }
      
      // Raiz da soma ao quadrado
      //float mediaFinal = sqrt(mediaOx*mediaOx + mediaOy*mediaOy);
      
      //Absoluto de cada e soma
      float mediaFinal = abs(mediaOx) + abs(mediaOy);
      
      // Absoluto da soma geral
      //float mediaFinal = abs(mediaOx + mediaOy);
      
      // Soma
      //float mediaFinal = mediaOx + mediaOy;
      
      // Multiplicação
      //float mediaFinal = mediaOx * mediaOy;
      
      // Limiarização e setar
      if (mediaFinal > 255) mediaFinal = 255;
      if (mediaFinal < 0) mediaFinal = 0;
      
      aux2.pixels[pos] = color(mediaFinal);   
    }
  }
  
  /* atualiza a imagem */ 
  image(aux2, 0, 0); /* exibe */
  save("imagemT1.2.jpg");
}
