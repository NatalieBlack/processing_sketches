

int i;
color[] colours = {#081261, #F2D913, #30cfaf, #9BE0D2};
color COLOUR;
int WINDOWSIZE, BOXSIZE, MARGIN, COLSNUM;
int minx, miny, col, row;
color BGCOLOUR;
int SW;

void setup() {
  frameRate(10);
  WINDOWSIZE = 495;
  COLSNUM = 3;
  BGCOLOUR = 200;
  SW = 2;
  size(WINDOWSIZE, WINDOWSIZE);
  BOXSIZE = 2*int(float(WINDOWSIZE) / COLSNUM);
  MARGIN = (WINDOWSIZE-(BOXSIZE*COLSNUM))/(COLSNUM+1);
  imageMode(CENTER);
  noStroke();
  background(BGCOLOUR);
  i = 0;
  col = 0;
  row = 0;
  minx = MARGIN;
  miny = MARGIN;
  COLOUR = colours[i];
  strokeWeight(SW);
}

void mousePressed() {
    
    background(BGCOLOUR);
}     

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void draw() { 
  
  if(i%20==0){
    background(BGCOLOUR);

  }
    int a = int(random(10,WINDOWSIZE-10));
    int b = int(random(10,WINDOWSIZE-10));
   
    stroke(COLOUR);
    sketchyCircle(a,b); 

    COLOUR = getNextColour();
}

 
void sketchyCircle(int x1, int y1){
  fill(color(COLOUR));
  int w = 10;
  int v = 10;
  beginShape();
  vertex(x1,y1);
  //bezierVertex(80, 0, 80, 75, 30, 75);
  
  bezierVertex(w,w,w,w, v, v);
  endShape();
  
  beginShape();
  vertex(x1,y1);
  //bezierVertex(80, 0, 80, 75, 30, 75);
  bezierVertex(WINDOWSIZE-w, WINDOWSIZE-w, WINDOWSIZE-w, WINDOWSIZE-w, WINDOWSIZE-v, WINDOWSIZE-v);
  endShape();
  
  beginShape();
  vertex(x1,y1);
  //bezierVertex(80, 0, 80, 75, 30, 75);
  bezierVertex(w, WINDOWSIZE-w, w, WINDOWSIZE-w, v, WINDOWSIZE-v);
  endShape();
  
  beginShape();
  vertex(x1,y1);
  //bezierVertex(80, 0, 80, 75, 30, 75);
  bezierVertex(WINDOWSIZE-w, w, WINDOWSIZE-w, w, WINDOWSIZE-v, v);
  endShape();
  
  
}

