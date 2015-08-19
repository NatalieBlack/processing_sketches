int i;
color[] colours = {#081261, 200,#F2D913, #30cfaf, #9BE0D2, 200};
color COLOUR;
int WINDOWSIZE, BOXSIZE, MARGIN, COLSNUM;
int minx, miny, col, row;
color BGCOLOUR;
int SW;

void setup() {
  frameRate(5);
  WINDOWSIZE = 495;
  COLSNUM = 3;
  BGCOLOUR = 200;
  SW = 10;
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
    int a = int(random(WINDOWSIZE));
    int b = int(random(WINDOWSIZE));
   
    stroke(COLOUR);
    sketchyCircle(a,b); 

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
  
  noFill();
  int minr = -400;
  int maxr = 400;
  int r = int(random(minr,maxr));
  int r2 = int(random(minr,maxr));

  //ellipse(x1,y1,BOXSIZE+r,BOXSIZE+r2);
  //taperedLine(x1,y1,x1+r, y1+r2);

  float xdenom = 1 + random(-1,1);
  float ydenom = 1 + random(-1,1);
  r = int(random(minr,maxr));
  r2 = int(random(minr, maxr));
  noFill();
  ellipse(x1,y1,BOXSIZE+r,BOXSIZE+r2);
  r = int(random(minr,maxr));
  r2 = int(random(minr,maxr));
  ellipse(x1,y1,BOXSIZE+r,BOXSIZE+r2);
}

