int i;
int WINDOWSIZE;
int XRANGE,YRANGE, XSPEED, YSPEED;
int redboost;

color getNextColour(){
  i++;
  redboost = redboost++%50;
  int b,g,r;
  r = int(random(0,10));
  g = int(random(80,210));
  b = int(random(g-50,g+70));
  return color(r,g,b);
}

void setup() {
  
  redboost = 75;
  WINDOWSIZE = 700;
  size(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  noStroke();
  mybackground();
  XRANGE = YRANGE = int(WINDOWSIZE/2.0);
  fill(255, 10);
  for(int i = 0; i < 1000; i++){
    sketchyCircle();
  }
  setSpeeds();
}
void setSpeeds(){
  XSPEED = int(random(-60,60));
  YSPEED = int(random(-60,60));

}
void mybackground() {
  background(0);
}

void mousePressed(){

    mybackground();

}

void draw() {
  if(XRANGE < 1){
    XSPEED = int(random(1,60));
  } else if(XRANGE >= WINDOWSIZE){
        XSPEED = int(random(-60,-1));

  }if(YRANGE < 1){
    YSPEED = int(random(1,60));
  } else if(YRANGE >= WINDOWSIZE){
        YSPEED = int(random(-60,-1));

  }
    XRANGE += XSPEED;//int(random(max(XRANGE-50,0),min(XRANGE+50,WINDOWSIZE)));
    YRANGE += YSPEED;//int(random(max(0,YRANGE-50),min(WINDOWSIZE,YRANGE+50)));
 XRANGE = max(XRANGE,0);
 XRANGE = min(XRANGE,WINDOWSIZE);
 YRANGE = max(YRANGE,0);
 YRANGE = min(YRANGE,WINDOWSIZE);
  mybackground();
  fill(255, 10);
  for(int i = 0; i < 1000; i++){
    sketchyCircle();
  }
}



void sketchyCircle(){
  beginShape();
  int x1 = int(random(-10,800));
  int y1 = int(random(-10,800));
  int range = 10;
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
