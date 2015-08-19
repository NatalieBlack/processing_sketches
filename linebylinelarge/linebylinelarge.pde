int i;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9};
color COLOUR;
int WINDOWSIZE, BOXSIZE, MARGIN, COLSNUM;
int minx, miny, col, row;

void setup() {
  WINDOWSIZE = 495;
  COLSNUM = 3;
  size(WINDOWSIZE, WINDOWSIZE);
  BOXSIZE = int(float(WINDOWSIZE) / COLSNUM);
  MARGIN = (WINDOWSIZE-(BOXSIZE*COLSNUM))/(COLSNUM+1);
  imageMode(CENTER);
  noStroke();
  background(150);
  i = 0;
  col = 0;
  row = 0;
  minx = MARGIN;
  miny = MARGIN;
  COLOUR = colours[i];
  strokeWeight(0.5);
}

void mousePressed() {
    minx = (minx + BOXSIZE + MARGIN) % (WINDOWSIZE-MARGIN);
    col = (col + 1);
    row = col/COLSNUM;
    miny = ((BOXSIZE + MARGIN)*(row)) % (WINDOWSIZE-MARGIN);
    COLOUR = getNextColour();
    int a = mouseX + int(random(BOXSIZE));
    int b = mouseY + 1 + int(random(BOXSIZE));
    int c;
    int d;
    do {
      c = minx + int(random(BOXSIZE));
    } while(a == c);
    do {
      d = miny + 1 + int(random(BOXSIZE));
    } while (d == b);
    stroke(COLOUR);
    taperedLine(a,b,c,d); 
}     

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void draw() { 

}

void taperedLine(int x1, int y1, int x2, int y2){
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
}
