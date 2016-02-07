int SIZE = 500;
int MID = SIZE/2;
int clow = 100;
int chigh = 200;
int BG = 40;

void setup() {
  surface.setSize(SIZE, SIZE);
  background(BG);
  frameRate(35);
  stroke(25, 80);
  noFill();
}

void draw() {
  //bezier();
  //drawLine1();
  drawLine2();
  drawLine3();
  drawLine4();
  drawLine5();
  drawVoid();
}

void bezier() {
  beginShape();
  float x = r();
  float y = random(MID, SIZE);
  float vertexCount = random(3);
  vertex(r(MID, MID), r(SIZE, 10));
  for (int i = 0; i < vertexCount; i++) {
    bezierVertex(r(x), r(y), r(x), r(y), r(x), r(y));
  }
  endShape();
}

void drawLine1() {
  stroke(225, 85);
  float x = random(0, SIZE);
  float y = random(0, MID/2);
  line(x, 0, x, y);
}

void drawLine2() {
  stroke(color(clow, chigh+25, chigh-25), 85);
  float x2 = random(0, SIZE);
  float y = random(0, MID/2);
  line(0, y, x2, y);
}


void drawLine3() {
  stroke(color(chigh, chigh, clow), 85);
  float y = random(0, MID/2);
  float x = random(MID/2, SIZE);
  line(x, y, SIZE, y);
}

void drawLine4() {
  stroke(color(clow, clow, chigh), 85);
  float x = random(0, SIZE);
  float y = random(MID/2, SIZE);
  float x2 = random(0, SIZE);
  line(x, y, x2, SIZE);
}
void drawLine5() {
  stroke(color(255, 255, 255), 85);
  float x = random(0, SIZE);
  float y = random(MID/2, SIZE*0.75);
  float x2 = random(0, SIZE);
  line(x, y, x2, MID/2);
}

void drawVoid(){
  fill(BG);
  stroke(BG);
  triangle(0, MID/2, SIZE*0.5, MID/2, 0, SIZE); 
  triangle(SIZE*0.5, MID/2, SIZE, MID/2, SIZE, SIZE); 
  noFill();
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