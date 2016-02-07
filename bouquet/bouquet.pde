int SIZE;
Scribbler s1, s2,s3;
int baset, tvar;
int SW;

void mousePressed(){
  background(color(0,100,100, 1));
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
    this.colours = new color[] {color(10),color(225), color(10,150,170)};
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
      //x1 = SIZE - x1;
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
    drawSwoosh(SIZE*0.5, SIZE*0.5);
    fill(35);
    noStroke();
    triangle(0.0,0.0,SIZE*0.5,0.0, 0.0, SIZE*0.5);
    triangle(SIZE/2,0,SIZE,0,SIZE,SIZE/2);
    triangle(0,SIZE,SIZE/2,SIZE,0,SIZE/2);
    triangle(SIZE,SIZE/2,SIZE/2,SIZE,SIZE,SIZE);
    noFill();
  }
  void drawMark(float x, float y){
    int s = 5;
    ellipse(x, y, s, s);
  }
  
  void drawSwoosh(float x, float y){
noFill();
    float n = 10.0;    
    //float x= x1+random(-r,r);
    //float y=y1+random(-r,r);

//    beginShape();
//    vertex(x,y);
//
//    for(int i = 0; i < n; i++){
//      bezierVertex(x, y, x1+ ((1+i)*(x2-x1)/(n*2)), y1 + ((1+i)*(y2-y1)/(2*n)), x1 + ((1+i)*(x2-x1)/n), y1 + ((1+i)*(y2-y1)/n));
//    }
//    endShape();
//    
      //int r = 100;
      x1 = random(SIZE);
      y1 = random(SIZE);
   beginShape();
 
  vertex(x, y);
      for(int i = 0; i < n; i++){
    bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),x1,y1);
  }     for(int i = 0; i < n; i++){

  
    bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),x1, y1);
    }
    
  
    endShape();


    y1 = y2;
  }
  
  int getPoint(float c, int r){
  return int(c) + int(random(0-r,r));
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
  SW = 10;
  SIZE = 600;
  strokeCap(SQUARE);
  surface.setSize(SIZE, SIZE);
  background(35);

  //background(color(0,100,100, 1));
  strokeWeight(SW);
  baset = 85;
  tvar = 0;
  s2 = new Scribbler(random(SIZE), random(SIZE), 60, 5);

}

void draw() {
    //s1.scribble();
    s2.scribble();
    //s3.scribble();

}