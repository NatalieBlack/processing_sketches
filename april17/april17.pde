PImage img, img2, img3, img4, img5;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
color COLOUR;
int i;
int WINDOWSIZE;

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void setup() {
  WINDOWSIZE = 675;
  size(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  strokeWeight(1);
  stroke(#FFFFFF);
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
  background(255);
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
  if(coinToss()){
    mybackground();
  } else {
    sketchyCircle();
  }
}

boolean coinToss(){
  return int(random(50)) == 1; 
}

void sketchyCircle(){
  beginShape();
  int x1 = int(random(WINDOWSIZE));
  int y1 = int(random(WINDOWSIZE));
  color colour = getNextColour();
  fill(colour, random(10,50));
  stroke(colour);
  

  vertex(int(random(WINDOWSIZE)),int(random(WINDOWSIZE)));
  //bezierVertex(0, 0, WINDOWSIZE, x1, y1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, y1, x1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, x1, x1, WINDOWSIZE);
  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(100)), x1, x1, int(random(WINDOWSIZE)));

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1, y1, int(random(WINDOWSIZE)));
  //bezierVertex(0, 0, x1, WINDOWSIZE, WINDOWSIZE, y1);

  endShape();
  
  beginShape();
  vertex(int(random(WINDOWSIZE)),int(random(WINDOWSIZE)));
  bezierVertex(0, 0, WINDOWSIZE, x1, y1, WINDOWSIZE);
  bezierVertex(0, 0, WINDOWSIZE, y1, x1, WINDOWSIZE);
  bezierVertex(0, 0, WINDOWSIZE, x1, x1, WINDOWSIZE);
  bezierVertex(0, 0, WINDOWSIZE, x1, x1, WINDOWSIZE);

  bezierVertex(0, 0, WINDOWSIZE, y1, y1, WINDOWSIZE);
  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), x1, int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1);

  endShape();

}
