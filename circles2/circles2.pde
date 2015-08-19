int i;
color[] colours = {#728283, #1bdee4, #419bbe, #FFFFFF, #F0F1FF};
color COLOUR;
int WINDOWSIZE, BOXSIZE, MARGIN, COLSNUM;
int minx, miny, col, row;
color BGCOLOUR;

void setup() {
  WINDOWSIZE = 495;
  COLSNUM = 3;
  BGCOLOUR = #F0F1FF;
  size(WINDOWSIZE, WINDOWSIZE);
  BOXSIZE = int(float(WINDOWSIZE) / COLSNUM);
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
  fill(BGCOLOUR);
  strokeWeight(0.5);
}

void mousePressed() {
    
    int a = minx + int(random(BOXSIZE));
    int b = miny + 1 + int(random(BOXSIZE));
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
    minx = (minx + BOXSIZE + MARGIN) % (WINDOWSIZE-MARGIN);
    col = (col + 1);
    row = floor(col/COLSNUM);
    miny = ((BOXSIZE + MARGIN)*(row)) % (WINDOWSIZE-MARGIN);
    COLOUR = getNextColour();
}     

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void draw() { 

}

void taperedLine(int x1, int y1, int x2, int y2){
  fill(BGCOLOUR);
  int minr = -15;
  int maxr = 15;
  float r = random(minr,maxr);
  float r2 = random(minr,maxr);

  ellipse(minx+(BOXSIZE*0.5),miny+(0.5*BOXSIZE),BOXSIZE*0.75+r,BOXSIZE*0.75+r2);
  
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

  float xdenom = 1 + random(-1,1);
  float ydenom = 1 + random(-1,1);
  r = random(minr,maxr);
  r2 = random(minr, maxr);
  noFill();
  ellipse(minx+(BOXSIZE*0.5)+xdenom,miny+(BOXSIZE*0.5),BOXSIZE*0.75,BOXSIZE*0.75);
  r = random(minr,maxr);
  r2 = random(minr,maxr);
  ellipse(minx+(BOXSIZE*0.5),miny+ydenom+(BOXSIZE*0.5),BOXSIZE*0.75,BOXSIZE*0.75);
}
