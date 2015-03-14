int i;
color[] colours = {#66CCFF, #FF1212, #F269FF, #DEFF69, color(102, 204, 255), color(102, 204, 255), color(102, 204, 255), color(102, 204, 255), color(102, 204, 255), color(102, 204, 255), color(102, 204, 255), color(102, 204, 255)};
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
  background(255);
  i = 0;
  col = 0;
  row = 0;
  minx = MARGIN;
  miny = MARGIN;
  COLOUR = colours[i];
}

void mousePressed() {
  if(i < COLSNUM*COLSNUM - 1){
    minx = (minx + BOXSIZE + MARGIN) % (WINDOWSIZE-MARGIN);
    col = (col + 1);
    row = col/COLSNUM;
    miny = ((BOXSIZE + MARGIN)*(row)) % (WINDOWSIZE-MARGIN);
    println(minx);
    COLOUR = getNextColour();
  }
  else {
    stop();
  }
}     

color getNextColour(){
  return colours[++i];
}

void draw() { 
      int a = minx + int(random(BOXSIZE));
      int b = miny + 1 + int(random(BOXSIZE));
      int c = minx + int(random(BOXSIZE));
      int d = miny + 1 + int(random(BOXSIZE));
      stroke(COLOUR);
      line(a,b,c,d);
}
