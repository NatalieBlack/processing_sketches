

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
  if(i%10 == 0){
    mousePressed();
  }
    int a = int(random(30,WINDOWSIZE-10));
    int b = int(random(30,WINDOWSIZE-10));
   
    stroke(COLOUR);
    sketchyCircle(a,b); 
    
    COLOUR = getNextColour();
}

void sketchyCircle(int x1, int y1){
fill(COLOUR);

beginShape();
vertex(x1,y1);
bezierVertex(x1, y1, x1, 30, 30, 30);
endShape();
}

