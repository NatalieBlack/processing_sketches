int SIZE;
Scribbler s1, s2,s3;
int baset, tvar;

class Scribbler {
  float x1, y1;
  int slope;
  int r;
  color c;
  int tr;

  Scribbler(float x1, float y1, int r, color c, int s) {
    this.x1 = x1;
    this.y1 = y1;
    this.slope = s;
    this.r = r;
    this.c = c;
    this.tr = baset + int(random(-tvar, tvar));
  }
  
  void scribble() {
    tr = baset + int(random(-tvar, tvar));
    stroke(c, tr);
    x1 = max(0, x1 + random(-r,r));
    x1 = min(x1, SIZE);
    y1 = max(0,y1 + random(-r,r));
    y1 = min(y1, SIZE);
    drawX(x1,y1);
  }
  
  void drawX(float x, float y){
    line(x-slope,y+slope,x+slope,y-slope);
    line(x-slope, y-slope, x+slope, y+slope);
  }
}


void setup() {
  SIZE = 400;
  frameRate(25);
  size(SIZE, SIZE);
  background(70);
  strokeWeight(3);
  baset = 50;
  tvar = 10;
  s1 = new Scribbler(random(SIZE), random(SIZE), 35, color(248, 99, 76), 10);
  s2 = new Scribbler(random(SIZE), random(SIZE), 20, color(56, 183, 94), 5);
  s3 = new Scribbler(random(SIZE), random(SIZE), 25, color(248, 214, 76), 5);

}

void draw() {
    s1.scribble();
    s2.scribble();
    s3.scribble();

}
