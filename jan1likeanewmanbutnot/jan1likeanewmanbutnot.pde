int SIZE = 500;
int MID = SIZE/2;
int clow = 100;
int chigh = 200;
int o = 85;

void setup() {
  surface.setSize(SIZE, SIZE);
  background(40);
  frameRate(35);
  stroke(25, 80);
  noFill();
}

void draw() {
  topLeft(color(clow, clow, chigh, o));
  topRight(color(clow, chigh+25, chigh-25, o));
  lowerTop(color(chigh, chigh, clow, o));
  lowerBottom(color(40, o));
  varyWeight();
}

void varyWeight() {
  float w = random(3);
  strokeWeight(w);
}

void topLeft(color c) {
  stroke(c);
  float x = random(0, SIZE);
  float y = random(MID/2, SIZE);
  line(x, MID/2, x, y);
}

void topRight(color c) {
  stroke(c);
  float x2 = random(0, SIZE);
  float y = random(0, MID/2);
  line(0, y, x2, y);
}


void lowerTop(color c) {
  stroke(c);
  float y = random(0, MID/2);
  float x = random(MID/2, SIZE);
  line(x, y, SIZE, y);
}

void lowerBottom(color c) {
  stroke(c);
  float x = random(0, SIZE);
  float y = random(MID/2, SIZE);
  line(x, y, x, SIZE);
}