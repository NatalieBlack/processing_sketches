int SIZE;
Scribbler s1, s2,s3;
int baset, tvar;
int j;
color[] colours = {color(50, 90, 100), color(255, 205, 88),color(255, 111, 88)};

class Scribbler {
  float x1, y1,x2,y2;
  int r;
  color c;
  int tr;
  int l;

  Scribbler(float x1, float y1, int r) {
    this.x1 = x1;
    this.y1 = y1;
    this.r = r;
    this.c = getNextColour();
    this.l = 0;
    this.tr = baset + int(random(-tvar, tvar));
  }
  
  void scribble() {
    tr = baset + int(random(-tvar, tvar));
    if(l++ > random(25,50)){
      l = 0;
      c = getNextColour();
    }
    stroke(c);
    x2 = max(0, x1 + random(-r,r));
    x2 = min(x2, SIZE);
    y2 = max(0,y1 + random(-r,r));
    y2 = min(y2, SIZE);
    line(x1, y1, x2, y2);
    x1 = x2;
    y1 = y2;
  }
}

color getNextColour(){
  return colours[j++%colours.length];
}

void setup() {
  SIZE = 400;
  size(SIZE, SIZE);
  background(235);
  strokeWeight(3);
  baset = 80;
  tvar = 10;
  s1 = new Scribbler(random(SIZE), random(SIZE), 35);

}

void draw() {
    s1.scribble();
}
