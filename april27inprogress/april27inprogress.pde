PImage img, img2, img3, img4, img5;
int k;
color[] colours = {color(0, 255, 255), color(0, 153, 255), color(0, 255, 200)};
int WINDOWSIZE;

void setup() {
  WINDOWSIZE = 700;
  size(WINDOWSIZE,WINDOWSIZE); 

  strokeWeight(1);
  stroke(#FFFFFF, 10);
  noFill();
  
  img4 = createImage(100, 100, ARGB);
  for(int i = 0; i < img4.pixels.length; i++) {
    float a = map(i, 255, img4.pixels.length, 255, 100);
    img4.pixels[i] = color(0, a, a); 
  }
  img3 = createImage(100, 100, ARGB);
  for(int i = 0; i < img3.pixels.length; i++) {
    float a = map(i, 255, img3.pixels.length, 255, 100);
    img3.pixels[i] = color(0, 153, a); 
  }
  img5 = createImage(100, 100, ARGB);
  for(int i = 0; i < img5.pixels.length; i++) {
    float a = map(i, 255, img5.pixels.length, 255, 100);
    img5.pixels[i] = color(0, a, 200); 
  }
  mybackground();
}
void mybackground() {
  background(0);
  
 
}

void mousePressed(){
  mybackground();
}
color getNextColour(){
  k++;
  color c;
  switch(k % 3) {
    case 0:
      c = color(0, int(random(255)), int(random(255)));
    case 1:
      c = color(0, 153, int(random(255)));
    default:
      c = color(0, int(random(255)), 200);
  }
  return c;
}
void draw() {
  
  sketchyCircle(getNextColour());
}
void sketchyCircle(color c){
  stroke(c,10);
  beginShape();
  int x1 = int(random(500 - 100, 500));
  int y1 = int(random(0, 100));

  vertex(mouseX,mouseY);
  
  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), x1, x1, int(random(WINDOWSIZE)));


  endShape();
  
  beginShape();
  vertex(mouseX,mouseY);

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), x1, int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1);

  endShape();

}
