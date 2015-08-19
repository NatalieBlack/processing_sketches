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
  strokeWeight(0.5);
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
    minx = (minx + BOXSIZE + MARGIN) % (WINDOWSIZE-MARGIN);
    col = (col + 1);
    row = floor(col/COLSNUM);
    miny = ((BOXSIZE + MARGIN)*(row)) % (WINDOWSIZE-MARGIN);
    COLOUR = getNextColour();
}

void sketchyCircle(int x1, int y1){
  noFill();
  int minr = -20;
  int maxr = 20;
  float r = random(minr,maxr);
  float r2 = random(minr,maxr);

  ellipse(x1,y1,BOXSIZE+r,BOXSIZE+r2);

  float xdenom = 1 + random(-1,1);
  float ydenom = 1 + random(-1,1);
  r = random(minr,maxr);
  r2 = random(minr, maxr);
  noFill();
  ellipse(x1,y1,BOXSIZE+r,BOXSIZE+r2);
  r = random(minr,maxr);
  r2 = random(minr,maxr);
  ellipse(x1,y1,BOXSIZE+r,BOXSIZE+r2);
}
