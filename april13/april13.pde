PImage img, img2, img3, img4, img5;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9};
color COLOUR;
int i;
boolean started;

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void setup() {
  started = false;
  size(1000, 600); 
  i = 0;
  strokeWeight(1);
    mybackground();

  text("Click!",1000/2,600/2);
  fill(255, 10);

}
void mybackground() {
  background(0);

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
void sketchyCircle(){
  beginShape();
  int x1 = int(random(500 - 100, 500));
  int y1 = int(random(0, 100));
  fill(getNextColour(), 10);

  vertex(mouseX,mouseY);
  //bezierVertex(0, 0, WINDOWSIZE, x1, y1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, y1, x1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, x1, x1, WINDOWSIZE);
  bezierVertex(0, 0, 0, x1, x1, 200);

  //bezierVertex(0, 0, WINDOWSIZE, y1, y1, WINDOWSIZE);
  //bezierVertex(0, 0, x1, WINDOWSIZE, WINDOWSIZE, y1);

  endShape();
  
  beginShape();
  vertex(mouseX,mouseY);
  //bezierVertex(0, 0, WINDOWSIZE, x1, y1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, y1, x1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, x1, x1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, x1, x1, WINDOWSIZE);

  //bezierVertex(0, 0, WINDOWSIZE, y1, y1, WINDOWSIZE);
  bezierVertex(0, 0, x1, 200, 200, y1);

  endShape();

}
