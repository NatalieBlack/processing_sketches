PImage img, img2, img3, img4, img5;
color[] colours = {#AA3939, #AA6C39, #226666, #2D882D};//, #FFFFFF};
color COLOUR;
int i;
int WINDOWSIZE;

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void setup() {
  WINDOWSIZE = 800;
  size(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  strokeWeight(1);
  //stroke(#FFFFFF);
  fill(255, 10);
  img = createImage(230, 230, ARGB);
  for(int i = 0; i < img.pixels.length; i++) {
    float a = map(i, 255, img.pixels.length, 255, 100);
    img.pixels[i] = color(a, 100, a); 
  }
  img2 = createImage(230, 230, ARGB);
  for(int i = 0; i < img2.pixels.length; i++) {
    float a = map(i, 255, img2.pixels.length, 255, 100);
    img2.pixels[img2.pixels.length-i-1] = color(a, a-25, 255); 
  }
  img4 = createImage(230, 230, ARGB);
  for(int i = 0; i < img4.pixels.length; i++) {
    float a = map(i, 255, img4.pixels.length, 255, 100);
    img4.pixels[i] = color(0, a, a); 
  }
  img3 = createImage(230, 230, ARGB);
  for(int i = 0; i < img3.pixels.length; i++) {
    float a = map(i, 255, img3.pixels.length, 255, 100);
    img3.pixels[i] = color(0, 153, a); 
  }
  img5 = createImage(230, 230, ARGB);
  for(int i = 0; i < img5.pixels.length; i++) {
    float a = map(i, 255, img5.pixels.length, 255, 100);
    img5.pixels[i] = color(0, a, 200); 
  }
  mybackground();
}
void mybackground() {
  background(0);
  //image(img, 0, 0);
  //image(img2, 100, 0);
  //image(img3, 200, 0);
  //image(img4, 300, 0);
  //image(img5, 400, 0);
  //image(img5, 500, 0);
}

void mousePressed(){
  mybackground();
}

void draw() {
  
  sketchyCircle();
}
void sketchyCircle(){
  beginShape();
  int x1 = int(random(WINDOWSIZE));
  int y1 = int(random(WINDOWSIZE));
  fill(getNextColour(), 10);

 
  
  beginShape();


  //bezierVertex(0, 0, WINDOWSIZE, y1, y1, WINDOWSIZE);
  curve(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)));

  endShape();

}
