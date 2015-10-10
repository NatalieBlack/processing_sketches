int SIZE;
Scribbler s1, s2,s3;
int baset, tvar;
int SW;

void mousePressed(){
  //background(color(0,100,100, 1));
  s2.white();
}

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
    this.colours = new color[] {color(0,100,75),color(0,75,100)};
    this.cindex = 0;
    getNextColour();
  }
  
  void white(){
    c = color(255);
  }
  
  void getNextColour(){
    if(random(5)>4){
      c = color(255);
    } else {
      c = color(random(75), random(75,175), random(75,225)); 
    }
  }
  void move(){
    x2 = random(0, SIZE);

    y2 = y1 + random(-r,r);
    
    if(random(50)>49){
      x1 = SIZE - x1;
      if(random(5)>3){
            getNextColour();
      }
      
    }

    if(y2 >= SIZE || y2 <= 0){
      y2 = random(0, SIZE);
    }
  }
  
  void scribble() {
    
    tr = baset + int(random(-tvar, tvar));
      
    stroke(c, tr);
    move();
    drawSwoosh();
  }
  void drawMark(float x, float y){
    int s = 5;
    ellipse(x, y, s, s);
  }
  
  void drawSwoosh(){
    noFill();
    float n;
    if(c == color(255)){   
    n = 25.0; }
      else {
     n = 10.0;  
      }  
    float x= x1+random(-r,r);
    float y=y1+random(-r,r);

//    beginShape();
//    vertex(x,y);
//
//    for(int i = 0; i < n; i++){
//      bezierVertex(x, y, x1+ ((1+i)*(x2-x1)/(n*2)), y1 + ((1+i)*(y2-y1)/(2*n)), x1 + ((1+i)*(x2-x1)/n), y1 + ((1+i)*(y2-y1)/n));
//    }
//    endShape();
//    
      //int r = 100;
   x1 = y1 = SIZE*0.5;
   beginShape();
 
  vertex(x1, y1);
  
  for(int i = 0; i < n; i++){

      bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r));
  }    for(int i = 0; i < n; i++){

      bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r));
  }for(int i = 0; i < n; i++){

  
    bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),random(SIZE), random(SIZE));
    }
    
  
    endShape();
beginShape();
  vertex(x1, y1);
  stroke(255,35);

int sm = 30;
for(int i = 0; i < n; i++){

  
    bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),x1+random(0-sm,sm), y1+random(0-sm,sm));
    }
    
endShape();

    y1 = y2;
  }
  
  int getPoint(float c, int r){
    int q = SIZE;
  return int(c) + int(random(0-q,q));
}
   void drawLine(){

    float n = 10.0;    
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
  SW = 50;
  SIZE = 600;
  strokeCap(SQUARE);
  size(SIZE, SIZE);
  background(255);

  //background(color(0,100,100, 1));
  strokeWeight(SW);
  baset = 5;
  tvar = 0;
  s2 = new Scribbler(random(SIZE), random(SIZE), 15, 5);
//  s1 = new Scribbler(random(SIZE), random(SIZE), 60, 5);

}

void draw() {
//    s1.scribble();
    s2.scribble();
    //s3.scribble();

}
