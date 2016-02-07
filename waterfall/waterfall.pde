

int i;
color[] colours = {#081261, #F2D913, #30cfaf, #9BE0D2, #FFFFFF};
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
  surface.setSize(WINDOWSIZE, WINDOWSIZE);
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
  noFill();
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
    int a = int(random(50,WINDOWSIZE));
    int b = int(random(25,WINDOWSIZE));
   
    stroke(COLOUR);
    sketchyCircle(a,b); 
    minx = (minx + BOXSIZE + MARGIN) % (WINDOWSIZE-MARGIN);
    col = (col + 1);
    row = floor(col/COLSNUM);
    miny = ((BOXSIZE + MARGIN)*(row)) % (WINDOWSIZE-MARGIN);
    COLOUR = getNextColour();
}
void sketchyCircle(int x1, int y1){
  
beginShape();
vertex(x1,y1);
bezierVertex(50, 80, 60, 25, 0, 0);
endShape();
}