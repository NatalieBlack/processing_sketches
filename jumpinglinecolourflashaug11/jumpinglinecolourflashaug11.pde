color[] colours = { #6A0D47,#FFFFFF, #000000, #CA535C, #FFFFFF, #000000, #113558, #FFFFFF, #000000, #0C5B3F, #FFFFFF,#000000,#FFE800, #FFFFFF, #000000,#FFBF00,#FFFFFF,#000000};
//color[] colours = { #830735, #FFFFFF, #000000, #819308, #FFFFFF, #000000, #EB3602, #FFFFFF, #000000, #066B35, #FFFFFF,#000000 };
//color[] colours = { #FF005E, #FFFFFF, #000000, #FF3900, #FFFFFF, #000000, #00FF76, #FFFFFF, #000000, #85FF00, #FFFFFF,#000000, #DEFF00, #FFFFFF, #000000, #E005FF, #FFFFFF,#000000 };

color COLOUR;
int i,j,k;
int x1,y1;
boolean started;
int WINDOWSIZE;

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void setup() {
  frameRate(10);
  WINDOWSIZE = 675;
  x1 = y1 = WINDOWSIZE/2;
  size(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  j = 0;
  strokeWeight(4);
  stroke(#FFFFFF);
  noFill();
  started = false;
  mybackground();
  text("Click or press any key",WINDOWSIZE*2/5,WINDOWSIZE/2);
  fill(255, 10);
  noFill();
  k = 3;
}
void mybackground() {
  background(25);
}

void mousePressed(){
k = 0;
}

void draw(){
  if(k++<3){
    doDraw();
  }
}

void doDraw() {
    mybackground();
    sketchyCircle();
}

boolean coinToss(){
  return int(random(50)) == 1; 
}

void sketchyCircle(){
  int r = 100;
  stroke(getNextColour());
  beginShape();
  

  

  vertex(WINDOWSIZE/2, WINDOWSIZE/5);

  bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),x1,y1);
    bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r));
    bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r));

  bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),WINDOWSIZE/2, WINDOWSIZE*4/5);
  

  endShape();


}

int getPoint(int c, int r){
  return c + int(random(0-r,r));
}

void keyPressed() {
  k = 0;
}
