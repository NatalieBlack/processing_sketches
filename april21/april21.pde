PImage img, img2, img3, img4, img5;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
color COLOUR;
int i,j;
int WINDOWSIZE;
boolean started;

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void setup() {
  started = false;
  WINDOWSIZE = 675;
  size(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  j = 0;
  strokeWeight(1);
  stroke(#FFFFFF);
  fill(255, 10);
 
  mybackground();
}
void mybackground() {
  background(255);
}

void mousePressed(){
  if(started){
    mybackground();
  } else {
    started = true;
  }
    
}

void draw() {
  if(started){
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
  fill(colour, random(40,70));
  stroke(colour);
  

  beginShape();
vertex(x1,y1);
vertex(WINDOWSIZE/2,WINDOWSIZE/2);
//bezierVertex(80, 0, 80, 75, 30, 75);
bezierVertex(50, 80, 60, 25, 0, 0);

endShape();

beginShape();
vertex(x1,y1);
vertex(WINDOWSIZE/2,WINDOWSIZE/2);

//bezierVertex(80, 0, 80, 75, 30, 75);
bezierVertex(WINDOWSIZE-50, WINDOWSIZE-80, WINDOWSIZE-60, WINDOWSIZE-25, WINDOWSIZE, WINDOWSIZE);
endShape();

}
