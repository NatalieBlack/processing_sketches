PImage img, img2, img3, img4, img5;
int k;
color[] colours = {color(0, 255, 255), color(0, 153, 255), color(0, 255, 200)};


void setup() {

  size(500, 200); 

  strokeWeight(1);
  stroke(#FFFFFF, 10);
  noFill();
  size(500, 100);  
  
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
  
  image(img5, 0, 0);

  image(img4, 100, 0);

  image(img3, 200, 0);
  image(img4, 300, 0);
  image(img5, 400, 0);
}

void mousePressed(){
  mybackground();
}
color getNextColour(){
  k++;
  return colours[k%colours.length];
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
  
  bezierVertex(0, 0, 0, x1, x1, 0);


  endShape();
  
  beginShape();
  vertex(mouseX,mouseY);

  bezierVertex(0, 0, x1, 0, 0, y1);

  endShape();

}
