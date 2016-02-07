int SIZE = 500;
int MID = SIZE/2;
int clow = 100;
int chigh = 200;
int o = 85;

void setup() {
  surface.setSize(SIZE, SIZE);
  background(50);
  noFill();
}

void draw() {
  top(color(chigh-25,chigh+25,clow, o));
  left(color(clow, chigh,chigh, o));
  bottom(color(clow, clow, chigh, o));
  right(color(225, o));
}

void drawLine(float x1, float x2, float y) {
    float n = 7.0;    
    for(int i = 0; i < n; i++){
      line(x1, y, x1 + ((1+i)*(x2-x1)/n), y);
    }
}

void top(color c) {
  stroke(c);
  float x = random(0, SIZE);
  float y = random(0, MID/2);
  line(x, 0, x, y);
}

void left(color c) {
  stroke(c);
  float x = random(0, MID/2);
  float y = random(0, SIZE);
  line(0, y, x, y);
}


void right(color c) {
  stroke(c);
  float y = random(0, SIZE);
  float x = random(MID/2, SIZE);
  line(x, y, SIZE, y);
}

void bottom(color c) {
  stroke(c);
  float x = random(0, SIZE);
  float y = random(MID/2, SIZE);
  line(x, y, x, SIZE);
}