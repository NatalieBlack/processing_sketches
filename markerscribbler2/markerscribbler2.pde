int SIZE;
Scribbler s1, s2,s3;
int baset, tvar;

class Scribbler {
  float x1, y1,x2,y2;
  int r;
  color c;
  int tr;

  Scribbler(float x1, float y1, int r, color c) {
    this.x1 = x1;
    this.y1 = y1;
    this.r = r;
    this.c = c;
    this.tr = baset + int(random(-tvar, tvar));
  }
  
  void scribble() {
    tr = baset + int(random(-tvar, tvar));
    stroke(c, tr);
    x2 = max(0, x1 + random(-r,r));
    x2 = min(x2, SIZE);
    y2 = max(0,y1 + random(-r,r));
    y2 = min(y2, SIZE);
    line(x1, y1, x2, y2);
    x1 = x2;
    y1 = y2;
  }
}

void setup() {
  SIZE = 400;
  size(SIZE, SIZE);
  background(70);
  strokeWeight(3);
  baset = 50;
  tvar = 10;
  s1 = new Scribbler(random(SIZE), random(SIZE), 30, color(248, 99, 76));
  s2 = new Scribbler(random(SIZE), random(SIZE), 10, color(56, 183, 94));
  s3 = new Scribbler(random(SIZE), random(SIZE), 20, color(248, 214, 76));

}

void draw() {
    s1.scribble();
    s2.scribble();
    s3.scribble();

}
