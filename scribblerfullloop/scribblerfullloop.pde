int hSIZE, wSIZE;
Scribbler s1, s2,s3;
int i = 0;
int BG = 250;

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
    stroke(c, 50);
    x2 = max(0, x1 + random(-r,r));
    x2 = min(x2, wSIZE);
    y2 = max(0,y1 + random(-r,r));
    y2 = min(y2, hSIZE);
    line(x1, y1, x2, y2);
    x1 = x2;
    y1 = y2;
  }
}

void setup() {
  hSIZE = height;
  wSIZE = width;
  fullScreen();
  background(BG);
  strokeWeight(3);
  s1 = new Scribbler(random(wSIZE), random(hSIZE), 10, color(79, 180, 142));
  s2 = new Scribbler(random(wSIZE), random(hSIZE), 10, color(50));
  s3 = new Scribbler(random(wSIZE), random(hSIZE), 20, color(42, 94, 116));

}

void draw() {
  s1.scribble();
  s2.scribble();
  s3.scribble();

  if(i++ == 150000){
    background(BG);
    i = 0;
  }
}