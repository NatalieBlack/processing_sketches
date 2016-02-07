int SIZE = 500;
int MID = SIZE/2;
int clow = 100;
int chigh = 200;

void setup() {
  surface.setSize(SIZE, SIZE);
  background(75);
  stroke(25, 80);
  noFill();
}

void draw() {
  //bezier();
  drawLine1();
  drawLine2();
  drawLine3();
  drawLine4();


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

void drawLine1() {
  stroke(225, 85);
  float x = random(0, SIZE);
  float x2 = random(0, SIZE);
  float y = random(MID/2, SIZE);
  line(x, 0, x2, y);
}

void drawLine2() {
  stroke(color(clow, chigh,chigh), 85);
  float y = random(0, SIZE);
  float x2 = random(0, SIZE);
  float y2 = random(MID/2, SIZE);
  line(0, y, x2, y2);
}


void drawLine3() {
  stroke(color(chigh,chigh,clow), 85);
  float y2 = random(0, SIZE);
  float y = random(0, SIZE);
  float x = random(MID/2, SIZE);
  line(x, y, SIZE, y2);
}

void drawLine4() {
  stroke(color(clow,clow,chigh), 85);
  float x = random(0, SIZE);
  float y = random(MID/2, SIZE);
  float x2 = random(0, SIZE);
  line(x, y, x2, SIZE);
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