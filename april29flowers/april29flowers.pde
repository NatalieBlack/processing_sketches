PImage img, img2, img3, img4, img5;
int k;
color[] colours = {color(0, 255, 255), color(0, 153, 255), color(0, 255, 200)};
int WINDOWSIZE;
int OLDX, OLDY;

void setup() {
  WINDOWSIZE = 700;
  size(WINDOWSIZE,WINDOWSIZE); 
  frameRate(15);
  strokeWeight(1);
  stroke(#FFFFFF, 10);
  noFill();
  
 
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
      c = color(100, int(random(255)), int(random(255)));
    case 1:
      c = color(100, 153, int(random(255)));
    default:
      c = color(100, int(random(255)), 200);
  }
  return c;
}
void draw() {
  if(k%20==0){
    mybackground();
    OLDX = int(random(WINDOWSIZE));
    OLDY = int(random(WINDOWSIZE));

  }
  sketchyCircle(getNextColour());
}
void sketchyCircle(color c){
  stroke(c,10);
  fill(c,90);
  int v = 200;



  beginShape();

  int x1 = int(random(WINDOWSIZE));
  int y1 = int(random(WINDOWSIZE));
  OLDX = OLDX + int(random(-5,5));
  OLDY =  OLDY + int(random(-5,5));
  vertex(OLDX,OLDY);

  int x2 = int(random(OLDX-v, OLDX + v));
  int y2 = int(random(OLDY-v, OLDY + v));
  int x3 = int(random(OLDX-v, OLDX + v));
  int y3 = int(random(OLDY-v, OLDY + v));
  
  bezierVertex(OLDX,OLDY,x2,y2,x3,y3);


   x2 = int(random(OLDX-v, OLDX + v));
   y2 = int(random(OLDY-v, OLDY + v));
   x3 = int(random(OLDX-v, OLDX + v));
   y3 = int(random(OLDY-v, OLDY + v));
  bezierVertex(OLDX,OLDY,x2,y2,x3,y3);
  endShape();

}
