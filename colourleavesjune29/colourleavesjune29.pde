

int i;
color[] colours = {#9BE0D2, #A2BCE2, #B9F2A7, #CBF4EC, #F5FEFC, #6CC4B3, #43A08E, #4E71A5, #7697C7, #CFDEF4, #F6F9FE, #77D559, #98E67F, #DAFAD0, #F8FFF5};
color COLOUR;
int WINDOWSIZE, BOXSIZE, MARGIN, COLSNUM;
int minx, miny, col, row;
color BGCOLOUR;
float SW;

void setup() {
  frameRate(10);
  WINDOWSIZE = 350;
  COLSNUM = 3;
  BGCOLOUR = 200;
  SW = 1.5;
  size(2*WINDOWSIZE, 2*WINDOWSIZE);
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
  COLOUR = colours[i%colours.length];
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
    int a = int(0.5*WINDOWSIZE) + int(random(WINDOWSIZE));
    int b = int(0.5*WINDOWSIZE) + int(random(WINDOWSIZE));
   
    stroke(COLOUR);
    sketchyCircle(a,b); 
    minx = (minx + BOXSIZE + MARGIN) % (WINDOWSIZE-MARGIN);
    col = (col + 1);
    row = floor(col/COLSNUM);
    miny = ((BOXSIZE + MARGIN)*(row)) % (WINDOWSIZE-MARGIN);
    COLOUR = getNextColour();
}
void taperedLine(int x1, int y1, int x2, int y2){
  strokeWeight(0.5);
  line(x1,y1,x2,y2);
  
  int midx = (x1+x2)/2;
  int midy = (y1+y2)/2;
  
  int midx1 = (x1+midx)/2;
  int midy1 = (y1+midy)/2;
  int midx2 = (x2+midx)/2;
  int midy2 = (y2+midy)/2;
  
  int midx3 = (x1+midx1)/2;
  int midy3 = (y1+midy1)/2;
  int midx4 = (x2+midx2)/2;
  int midy4 = (y2+midy2)/2;

  strokeWeight(1.5);
  line(midx1,midy1,midx2,midy2);
  strokeWeight(1);
  line(midx3,midy3,midx4,midy4);
  strokeWeight(0.5);
  strokeWeight(SW);
}
void sketchyCircle(int x1, int y1){
  
beginShape();
vertex(x1,y1);
bezierVertex(y1, x1, WINDOWSIZE, WINDOWSIZE, x1, y1);
//bezierVertex(50, 80, 60, 25, 30, 20);
endShape();
}

