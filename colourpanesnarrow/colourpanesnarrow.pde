PImage img, img2, img3, img4, img5;

void setup() {
  size(500, 200);  
  img = createImage(230, 230, ARGB);
  for(int i = 0; i < img.pixels.length; i++) {
    float a = map(i, 0, img.pixels.length, 255, 0);
    img.pixels[i] = color(a, 255, a); 
  }
  img2 = createImage(230, 230, ARGB);
  for(int i = 0; i < img2.pixels.length; i++) {
    float a = map(i, 0, img2.pixels.length, 255, 0);
    img2.pixels[i] = color(a, a, 255); 
  }
  img3 = createImage(230, 230, ARGB);
  for(int i = 0; i < img3.pixels.length; i++) {
    float a = map(i, 0, img3.pixels.length, 255, 0);
    img3.pixels[i] = color(0, a, a); 
  }
  img4 = createImage(230, 230, ARGB);
  for(int i = 0; i < img4.pixels.length; i++) {
    float a = map(i, 0, img4.pixels.length, 255, 0);
    img4.pixels[i] = color(0, 153, a); 
  }
  img5 = createImage(230, 230, ARGB);
  for(int i = 0; i < img5.pixels.length; i++) {
    float a = map(i, 0, img5.pixels.length, 255, 0);
    img5.pixels[i] = color(0, a, 200); 
  }
}

void draw() {
  background(0);
  image(img, 0, 0);
  image(img2, 100, 0);
  image(img3, 200, 0);
  image(img4, 300, 0);
  image(img5, 400, 0);
  image(img5, 500, 0);


}
