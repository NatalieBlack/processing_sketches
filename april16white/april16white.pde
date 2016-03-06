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
  WINDOWSIZE = 800;
  surface.setSize(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  strokeWeight(1);
  fill(255, 10);
  
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
  
  sketchyCircle();
}

boolean coinToss(){
  return int(random(10)) == 1; 
}

void sketchyCircle(){
  beginShape();
  int x1 = int(random(WINDOWSIZE));
  int y1 = int(random(WINDOWSIZE));
  if(coinToss()){
    fill(255);
  } else {
    fill(getNextColour(), 10);
  }

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