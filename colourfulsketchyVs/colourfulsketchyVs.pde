int i, j;
color[] colours = {#9BE0D2, #A2BCE2, #B9F2A7, #CBF4EC, #F5FEFC, #6CC4B3, #43A08E, #4E71A5, #7697C7, #CFDEF4, #F6F9FE, #77D559, #98E67F, #DAFAD0, #F8FFF5};
color COLOUR;
int WINDOWSIZE, BOXSIZE, MARGIN, COLSNUM;
int minx, miny, col, row;
int doublecolour;
int BGCOLOUR;
int LIMIT;
int q;

void setup() {
  LIMIT = int(random(2,20));
  q = 0;
  WINDOWSIZE = 600;
  COLSNUM = 5;
  BGCOLOUR = 100;
  size(WINDOWSIZE, WINDOWSIZE);
  BOXSIZE = int(float(WINDOWSIZE) / COLSNUM);
  MARGIN = (WINDOWSIZE-(BOXSIZE*COLSNUM))/(COLSNUM+1);
  imageMode(CENTER);
  noStroke();
  noFill();
  background(BGCOLOUR);
  i = 0;
  j = 0;
  doublecolour = 0;
  col = 0;
  row = 0;
  minx = MARGIN;
  miny = MARGIN;
  COLOUR = colours[i%colours.length];
  strokeWeight(1);
}

void mousePressed() {
  if(i++ < COLSNUM*COLSNUM - 1){
    minx = (minx + BOXSIZE + MARGIN) % (WINDOWSIZE-MARGIN);
    col = (col + 1);
    row = col/COLSNUM;
    miny = ((BOXSIZE + MARGIN)*(row)) % (WINDOWSIZE-MARGIN);
    doublecolour++;

  }
  else {
    setup();
  }
}     

color getNextColour(){
  j++;
  return colours[j%colours.length];
}

void repeat(){
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

      sketchyCircle(a,b);
}

void draw() { 
  if(q++%LIMIT == 0){
    mousePressed();
  }
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
      COLOUR = getNextColour();
      stroke(COLOUR);
      sketchyCircle(a,b);

}

void sketchyCircle(int x1, int y1){
  beginShape();
  vertex(x1,y1);
  bezierVertex(x1, x1, x1, x1, y1, x1);
  //bezierVertex(50, 80, 60, 25, 30, 20);
  endShape();
}
