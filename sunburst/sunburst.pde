int i;
int WINDOWSIZE;
int XRANGE,YRANGE;
int redboost;

color getNextColour(){
  i++;
  redboost = redboost++%100;
  int b,g;
  b = int(random(0,10));
  g = int(random(20,100));
  return color(g+redboost,g,10);
}

void setup() {
  redboost = 75;
  WINDOWSIZE = 700;
  size(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  noStroke();
  mybackground();
  XRANGE = YRANGE = WINDOWSIZE;
  fill(255, 10);
  for(int i = 0; i < 500; i++){
    sketchyCircle();
  }
}
void mybackground() {
  background(0);
}

void mousePressed(){

    mybackground();

}

void draw() {
  if(i%25==0){
    XRANGE = int(random(WINDOWSIZE));
    YRANGE = int(random(WINDOWSIZE));
  }

}

boolean coinToss(){
  return int(random(10)) == 1; 
}
void dot(){
  int x1 = int(random(XRANGE));
  int y1 = int(random(YRANGE));

  fill(getNextColour(), 10);
  ellipse(x1,y1,70,70);
}

void sketchyCircle(){
  beginShape();
  int x1 = int(random(XRANGE));
  int y1 = int(random(YRANGE));
  int range = 50;
  int minX = XRANGE - range;
  int maxX = XRANGE + range;
  int minY = YRANGE - range;
  int maxY = YRANGE + range;

  fill(getNextColour(), 10);
  
  vertex(x1,y1);

  bezierVertex(int(random(minX,maxX)), int(random(minY,maxY)),int(random(minX,maxX)), int(random(minY,maxY)),int(random(minX,maxX)), int(random(minY,maxY)));
  bezierVertex(int(random(minX,maxX)), int(random(minY,maxY)),int(random(minX,maxX)), int(random(minY,maxY)),int(random(minX,maxX)), int(random(minY,maxY)));


  endShape();
  
 

}
