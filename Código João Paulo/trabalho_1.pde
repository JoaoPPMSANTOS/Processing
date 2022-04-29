 float qtde;
  int qtde2;
  int i;
   float pcg;
void setup() {
  size(800, 800);
  noLoop();
}
void draw() {
  PImage img= loadImage("imagem1r.jpg");
  PImage img2= loadImage("imagem1s.png");
  PImage aux = createImage(img.width, img.height, RGB);
  PImage aux2 = createImage(img2.width, img2.height, RGB);
  //Escala de cinza

   for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int pos = y * img.width + x;
      int media = int((red(img.pixels[pos]) + green(img.pixels[pos]) + blue(img.pixels[pos]))/3);
      aux.pixels[pos] = color(media);
      aux2.pixels[pos]= color(media);
      
   do{
     
     i++;
      if ((img.pixels[pos])==(img2.pixels[pos])) {
        
         
         
          qtde++;
      }else{
        qtde2++;
        
        
        
      }
    }while((i<img.width)&&(i<img.height)&&(i<img2.height)&&(i<img2.width));
      
      pcg=(i-qtde)/i;
      pcg=pcg*100;
      pcg=100-pcg;
      
    }
  }
  
  print("falso positivo =",qtde,"falso negativo =",qtde2,"valor total de pixels é = ",i, "o valor da porcentagem de acerto é =",pcg,"%");
  
  image(img,0,0);
  image(img2,300,300);
}
