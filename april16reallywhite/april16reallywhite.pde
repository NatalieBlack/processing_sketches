PImage img, img2, img3, img4, img5;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
color COLOUR;
int i;
int WINDOWSIZE;
boolean started;

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void setup() {
  frameRate(20);
  started = false;
  WINDOWSIZE = 700;
  surface.setSize(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  strokeWeight(1);
  stroke(#FFFFFF);

  mybackground();
  fill(0);
  text("Click!",WINDOWSIZE/2,WINDOWSIZE/2);
  fill(255, 10);

}
void mybackground() {
  background(255);
  
}

void mousePressed(){
  if(!started){
    started = true;
  }
    mybackground();

}

void draw() {
  if(started){
  sketchyCircle();
  }
}

boolean coinToss(){
  return int(random(10)) == 1; 
}

void sketchyCircle(){
  beginShape();
  int x1 = int(random(WINDOWSIZE));
  int y1 = int(random(WINDOWSIZE));

  fill(getNextColour(), 10);
  

  vertex(int(random(WINDOWSIZE)),int(random(WINDOWSIZE)));

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(100)), x1, x1, int(random(WINDOWSIZE)));

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1, y1, int(random(WINDOWSIZE)));

  endShape();
  
  beginShape();
  vertex(int(random(WINDOWSIZE)),int(random(WINDOWSIZE)));
  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), x1, y1, int(random(WINDOWSIZE)));
  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1, x1, int(random(WINDOWSIZE)));
  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), x1, x1, int(random(WINDOWSIZE)));
  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), x1, x1, int(random(WINDOWSIZE)));

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1, y1, int(random(WINDOWSIZE)));
  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), x1, int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1);

  endShape();

}