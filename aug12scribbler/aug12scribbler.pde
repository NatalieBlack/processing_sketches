float x1, y1,x2,y2;
int SIZE;
int r;

void setup() {
  SIZE = 400;
  r = 10;
  size(SIZE, SIZE);
  background(102);
  x1 = random(SIZE);
  y1 = random(SIZE);

}

void draw() {
  stroke(255);
    x2 = max(0, x1 + random(-r,r));
    x2 = min(x2, SIZE);
    y2 = max(0,y1 + random(-r,r));
    y2 = min(y2, SIZE);
    line(x1, y1, x2, y2);
    x1 = x2;
    y1 = y2;
}
