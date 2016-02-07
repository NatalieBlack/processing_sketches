int SIZE = 500;
int MID = SIZE/2;
int clow = 100;
int chigh = 200;
int o = 85;

color c1 = color(225, o);
color c2 = color(clow, chigh,chigh, o);
color c3 = color(clow,clow,chigh, o);
color c4 = color(chigh-25,chigh+25,clow, o);

void setup() {
  surface.setSize(SIZE, SIZE);
  background(75);
  stroke(25, 80);
  noFill();
}

void draw() {
  bezier1(c1);
    bezier2(c2);
  bezier3(c3);
  bezier4(c4);

  //drawLine1(c1);
  //drawLine2(c2);
  //drawLine3(c3);
  //drawLine4(c4);
}

void bezier1(color c) {
  stroke(c);
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
void bezier2(color c) {
  stroke(c);
  beginShape();
  float x = r();
  float y = random(0, MID);
  float vertexCount = random(3);
  vertex(r(MID, MID), 0);
  for(int i = 0; i < vertexCount; i++) {
    bezierVertex(r(x), r(y), r(x), r(y), r(x), r(y));
  }
  endShape();
}
void bezier3(color c) {
  stroke(c);
  beginShape();
  float x = random(0, MID);
  float y = r();
  float vertexCount = random(3);
  vertex(0, r(MID, MID));
  for(int i = 0; i < vertexCount; i++) {
    bezierVertex(r(x), r(y), r(x), r(y), r(x), r(y));
  }
  endShape();
}
void bezier4(color c) {
  stroke(c);
  beginShape();
  float x = random(MID, SIZE);
  float y = random(0, SIZE);
  float vertexCount = random(3);
  vertex(SIZE, r(MID, MID));
  for(int i = 0; i < vertexCount; i++) {
    bezierVertex(r(x), r(y), r(x), r(y), r(x), r(y));
  }
  endShape();
}

void drawLine1(color c) {
  stroke(c);
  float x = random(0, SIZE);
  float x2 = random(0, SIZE);
  float y = random(MID/2, SIZE);
  line(x, 0, x2, y);
}

void drawLine2(color c) {
  stroke(c);
  float y = random(0, SIZE);
  float x2 = random(0, SIZE);
  float y2 = random(MID/2, SIZE);
  line(0, y, x2, y2);
}


void drawLine3(color c) {
  stroke(c);
  float y2 = random(0, SIZE);
  float y = random(0, SIZE);
  float x = random(MID/2, SIZE);
  line(x, y, SIZE, y2);
}

void drawLine4(color c) {
  stroke(c);
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