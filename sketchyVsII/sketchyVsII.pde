int i, j;
color[] colours = {#000000, #FFFFFF};
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
  size(WINDOWSIZE, WINDOWSIZE);
  BOXSIZE = int(float(WINDOWSIZE) / COLSNUM);
  MARGIN = (WINDOWSIZE-(BOXSIZE*COLSNUM))/(COLSNUM+1);
  imageMode(CENTER);
  noFill();
  
  i = 0;
  j = 0;
  doublecolour = 0;
  col = 0;
  row = 0;
  minx = MARGIN;
  miny = MARGIN;
  COLOUR = colours[i];
  strokeWeight(1);
  
  COLOUR = getNextColour();
  stroke(color(COLOUR));
  BGCOLOUR = color(COLOUR+(int(random(40,60))*coinToss()));

  background(BGCOLOUR);
}
int coinToss(){
  if(random(2) > 1){
    return 1;
  }else{
    return -1;
  }
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

int getNextColour(){
 return int(random(100,230));
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

      sketchyCircle(a,b);

}

void sketchyCircle(int x1, int y1){
  beginShape();
  vertex(x1,y1);
  bezierVertex(x1, x1, x1, x1, y1, x1);
  //bezierVertex(50, 80, 60, 25, 30, 20);
  endShape();
}
