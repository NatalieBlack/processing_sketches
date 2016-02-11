int SIZE;
Scribbler s1, s2,s3;
int baset, tvar;

class Scribbler {
  float x1, y1, x2,y2;
  int slope;
  int r;
  color c;
  int tr;

  Scribbler(float x1, float y1, int r, color c, int s) {
    this.x1 = 0;
    this.y1 = y1;
    this.slope = s;
    this.r = r;
    this.c = c;
    this.tr = baset + int(random(-tvar, tvar));
  }
  
  void move(){
    x2 = random(0, SIZE);

    y2 = y1 + random(-r,r);

    if(y2 >= SIZE || y2 <= 0){
      y2 = random(0, SIZE);
    }
  }
  
  void scribble() {
    tr = baset + int(random(-tvar, tvar));
    stroke(c, tr);
    move();
    drawLine();
  }
  void drawMark(float x, float y){
    int s = 5;
    ellipse(x, y, s, s);
  }
  
  void drawLine(){
    line(x1,y1,x2,y1);
    //x1 = x2;
    y1 = y2;
  }
  
  void drawX(float x, float y){
    line(x-slope,y+slope,x+slope,y-slope);
    line(x-slope, y-slope, x+slope, y+slope);
  }
}


void setup() {
  SIZE = 600;
  frameRate(25);
  surface.setSize(SIZE, SIZE);
  background(70);
  strokeWeight(3);
  baset = 50;
  tvar = 10;
  s1 = new Scribbler(random(SIZE), random(SIZE), 35, color(248, 99, 76), 10);
  s2 = new Scribbler(random(SIZE), random(SIZE), 20, color(0), 5);
  s3 = new Scribbler(random(SIZE), random(SIZE), 25, color(248, 214, 76), 5);

}

void draw() {
    //s1.scribble();
    s2.scribble();
    //s3.scribble();

}