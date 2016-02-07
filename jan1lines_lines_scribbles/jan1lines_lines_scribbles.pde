int SIZE = 500;
int MID = SIZE/2;
int clow = 100;
int chigh = 200;
Scribbler s = new Scribbler(random(SIZE), random(SIZE), 50, color(25));

void setup() {
  surface.setSize(SIZE, SIZE);
  background(75);
  stroke(25, 80);
  frameRate(45);
  //noFill();
}

void draw() {
  //bezier();
  s.scribble();
  //strokeWeight(1);

  //drawLine1(r(), r());
    s.scribble();
  //strokeWeight(1);
  drawLine2(r(), r());
    s.scribble();
  //strokeWeight(1);
  //drawLine3(r(), r());
    s.scribble();
  //strokeWeight(1);
  drawLine4(r(), r());


}

void bezier() {
  beginShape();
  float x = r();
  float y = random(MID, SIZE);
  float vertexCount = random(3);
  vertex(r(MID, MID), r(SIZE, 10));
  for(int i = 0; i < vertexCount; i++) {
    bezierVertex(r(x), r(y), r(x), r(y), r(x), r(y));
  }
  endShape();
}

void drawLine1(float r1, float r2) {
  stroke(225, 85);
  line(r1, 0, r1, r2);
}

void drawLine2(float r1, float r2) {
  stroke(225, 85);

  line(0, r1, r2, r1);
}


void drawLine3(float r1, float r2) {
  stroke(color(chigh,chigh,clow), 85);

  line(r1, r2, SIZE, r2);
}

void drawLine4(float r1, float r2) {
  stroke(color(clow,clow,chigh), 85);

  line(r1, r2, r1, SIZE);
}

float r() {
  return random(SIZE);
}

float r(float x) {
  return r(x, 100);
}

float r(float x, float range) {
  float low = max(0, x - range);
  float high = min(x + range, SIZE);
  return random(low, high);
}

class Scribbler {
  float x1, y1,x2,y2;
  int r;
  color c;

  Scribbler(float x1, float y1, int r, color c) {
    this.x1 = x1;
    this.y1 = y1;
    this.r = r;
    this.c = c;
  }
  
  void scribble() {
    strokeWeight(3);
    stroke(c, 90);
    x2 = max(0, x1 + random(-r,r));
    x2 = min(x2, SIZE);
    y2 = max(0,y1 + random(-r,r));
    y2 = min(y2, SIZE);
    line(x1, y1, x2, y2);
    x1 = x2;
    y1 = y2;
  }
}