int SIZE;
Scribbler s1, s2,s3;
int baset, tvar;
int SW;

class Scribbler {
  float x1, y1, x2,y2;
  int slope;
  int r;
  color c;
  int tr;
  color[] colours;
  int cindex;

  Scribbler(float x1, float y1, int r, int s) {
    this.x1 = 0;
    this.y1 = y1;
    this.slope = s;
    this.r = r;
    this.tr = baset + int(random(-tvar, tvar));
    this.colours = new color[] {#FF8E64, #FF581A,#FF733F,#FFAD8E,#FFD3C3,#FFBC64,#FFE5C3,#FFCE8E};
    this.cindex = 0;
    getNextColour();
  }
  
  void getNextColour(){
    c = colours[cindex++%colours.length]; 
  }
  void move(){
    x2 = random(0, SIZE);

    y2 = y1 + random(-r,r);
    if(random(100)>99){
      x1 = SIZE - x1;
      getNextColour();
    }
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

    float n = 20.0;    
    for(int i = 0; i < n; i++){
      line(x1, y1, x1 + ((1+i)*(x2-x1)/n), y1);
    }
    y1 = y2;
  }
  
  void drawX(float x, float y){
    line(x-slope,y+slope,x+slope,y-slope);
    line(x-slope, y-slope, x+slope, y+slope);
  }
}


void setup() {
  SW = 12;
  SIZE = 600;
  strokeCap(SQUARE);
  size(SIZE, SIZE);
  background(10);
  strokeWeight(SW);
  baset = 15;
  tvar = 5;
  s2 = new Scribbler(random(SIZE), random(SIZE), 20, 5);

}

void draw() {
    //s1.scribble();
    s2.scribble();
    //s3.scribble();

}
