PImage img, img2, img3, img4, img5;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
color COLOUR;
int i,j;
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
  strokeWeight(1);
  stroke(#FFFFFF);
  noFill();
  started = false;
  mybackground();
    text("Keep clicking!",WINDOWSIZE/2,WINDOWSIZE/2);
  fill(255, 10);

}
void mybackground() {
  background(0);
}

void mousePressed(){
  if(!started){
    started = true;
    mybackground();
  }
  if(j == 5){
    mybackground();
    j = 0;
  } else {
    sketchyCircle();
    j++;
  }
}

void draw() {
    mybackground();
    sketchyCircle();
}

boolean coinToss(){
  return int(random(50)) == 1; 
}

void sketchyCircle(){
  int r = 100;
  beginShape();
  

  

  vertex(x1,y1);

  bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),WINDOWSIZE/2, WINDOWSIZE/5);
    bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r));
    bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r));

  bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),WINDOWSIZE/2, WINDOWSIZE*4/5);
  

  endShape();


}

int getPoint(int c, int r){
  return c + int(random(0-r,r));
}

void keyPressed() {
if(key == 'j'){
  x1--;
} else if(key == 'k'){
x1++;
}
 else if(key == 'f'){
y1++;
}
 else if(key == 'd'){
  y1--;
}

}
