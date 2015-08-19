PImage img, img2, img3, img4, img5;

void setup() {
  size(590, 360);  
  img = createImage(230, 230, ARGB);
  for(int i = 0; i < img.pixels.length; i++) {
    float a = map(i, 0, img.pixels.length, 255, 0);
    img.pixels[i] = color(0, 153, 204, a); 
  }
  img2 = createImage(230, 230, ARGB);
  for(int i = 0; i < img2.pixels.length; i++) {
    float a = map(i, 0, img2.pixels.length, 255, 0);
    img2.pixels[i] = color(0, 103, 204, a); 
  }
  img3 = createImage(230, 230, ARGB);
  for(int i = 0; i < img3.pixels.length; i++) {
    float a = map(i, 0, img3.pixels.length, 255, 0);
    img3.pixels[i] = color(0, 253, 204, a); 
  }
  img4 = createImage(230, 230, ARGB);
  for(int i = 0; i < img4.pixels.length; i++) {
    float a = map(i, 0, img4.pixels.length, 255, 0);
    img4.pixels[i] = color(0, 153, 104, a); 
  }
  img5 = createImage(230, 230, ARGB);
  for(int i = 0; i < img5.pixels.length; i++) {
    float a = map(i, 0, img5.pixels.length, 255, 0);
    img5.pixels[i] = color(0, 53, 40, a); 
  }
}

void draw() {
  background(0);
  image(img, 90, 0);
  image(img2, 0, 0);
  image(img3, 180, 0);
  image(img4, 270, 0);
  image(img5, 360, 0);
  image(img, 90, 180);
  image(img2, 0, 180);
  image(img3, 180, 180);
  image(img4, 270, 180);
  image(img5, 360, 180);

}
