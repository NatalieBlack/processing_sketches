int clow = 100;
int chigh = 200;
int o = 10;

void setup() {
  fullScreen();
  background(50);
  noFill();
  strokeWeight(10);
}

void draw() {
  top(color(chigh-25, chigh+25, clow, o));
  left(color(clow, chigh+25, chigh, o));
  bottom(color(clow, clow, chigh, o));
  right(color(225, o));
}

void top(color c) {
  stroke(c);
  float x = random(0, width);
  float y = random(0, height/4);
  line(x, 0, x, y);
}

void left(color c) {
  stroke(c);
  float x = random(0, width/4);
  float y = random(0, height);
  line(0, y, x, y);
}


void right(color c) {
  stroke(c);
  float y = random(0, height);
  float x = random(width/4, width);
  line(x, y, width, y);
}

void bottom(color c) {
  stroke(c);
  float x = random(0, width);
  float y = random(height/4, height);
  line(x, y, x, height);
}