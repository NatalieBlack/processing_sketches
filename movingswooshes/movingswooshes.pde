int i, j;
color[] colours = {50, 250};
color COLOUR;
int WINDOWSIZE, BOXSIZE, MARGIN, COLSNUM;
int minx, miny, col, row;
int doublecolour;
int BGCOLOUR;

void setup() {
  WINDOWSIZE = 495;
  COLSNUM = 3;
  BGCOLOUR = 50;
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
  COLOUR = colours[i];
  strokeWeight(1);
}

void mousePressed() {
  if(i++ < COLSNUM*COLSNUM - 1){
    minx = (minx + BOXSIZE + MARGIN) % (WINDOWSIZE-MARGIN);
    col = (col + 1);
    row = col/COLSNUM;
    miny = ((BOXSIZE + MARGIN)*(row)) % (WINDOWSIZE-MARGIN);
    doublecolour++;
    println("x"+minx);
    println("y"+miny);
  }
  else {
    stop();
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

void sketchyCircle(int xx1, int yy1){
  beginShape();
  int x1 = int(random(WINDOWSIZE - 100, WINDOWSIZE));
  int y1 = int(random(0, 100));

  vertex(x1,y1);
  //bezierVertex(0, 0, WINDOWSIZE, x1, y1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, y1, x1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, x1, x1, WINDOWSIZE);
  bezierVertex(0, 0, 0, x1, x1, WINDOWSIZE);

  //bezierVertex(0, 0, WINDOWSIZE, y1, y1, WINDOWSIZE);
  //bezierVertex(0, 0, x1, WINDOWSIZE, WINDOWSIZE, y1);

  endShape();
  
  beginShape();
  vertex(x1,y1);
  //bezierVertex(0, 0, WINDOWSIZE, x1, y1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, y1, x1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, x1, x1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, x1, x1, WINDOWSIZE);

  //bezierVertex(0, 0, WINDOWSIZE, y1, y1, WINDOWSIZE);
  bezierVertex(0, 0, x1, WINDOWSIZE, WINDOWSIZE, y1);

  endShape();
}
