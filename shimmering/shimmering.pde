int i;
int WINDOWSIZE;
int XRANGE,YRANGE;
int redboost;

color getNextColour(){
  i++;
  redboost = redboost++%150;
  int b,g;
  b = int(random(0,10));
  g = int(random(10,110));
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
  int minX, minY, maxX, maxY;
  minX = minY = 0;
  maxX = maxY = WINDOWSIZE;
  for(int j = 0; j < 200; j++){
      fill(getNextColour(), 10);

    beginShape();
    vertex(int(random(WINDOWSIZE)),int(random(WINDOWSIZE)));
    bezierVertex(int(random(minX,maxX)), int(random(minY,maxY)),int(random(minX,maxX)), int(random(minY,maxY)),int(random(minX,maxX)), int(random(minY,maxY)));
    bezierVertex(int(random(minX,maxX)), int(random(minY,maxY)),int(random(minX,maxX)), int(random(minY,maxY)),int(random(minX,maxX)), int(random(minY,maxY)));
    endShape(); 
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
    XRANGE = int(random(50,WINDOWSIZE-50));
    YRANGE = int(random(50,WINDOWSIZE-50));
  }
  sketchyCircle(XRANGE,YRANGE);
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

void sketchyCircle(int XRANGE,int YRANGE){
  beginShape();
  
  int range = 200;
  int minX = XRANGE - range;
  int maxX = XRANGE + range;
  int minY = YRANGE - range;
  int maxY = YRANGE + range;
  int x1 = int(random(minX,maxX));
  int y1 = int(random(minY,maxY));
  fill(getNextColour(), 10);
  
  vertex(x1,y1);

  bezierVertex(int(random(minX,maxX)), int(random(minY,maxY)),int(random(minX,maxX)), int(random(minY,maxY)),int(random(minX,maxX)), int(random(minY,maxY)));
  bezierVertex(int(random(minX,maxX)), int(random(minY,maxY)),int(random(minX,maxX)), int(random(minY,maxY)),int(random(minX,maxX)), int(random(minY,maxY)));


  endShape();
  
 

}
