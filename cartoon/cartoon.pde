int SIZE;
Scribbler s1, s2,s3;
int mint, maxt;
int SW;
int count;

class Scribbler {
  float x1, y1, x2,y2;
  int slope;
  int r;
  color colour;
  int tr;
  boolean rainbow;
  float minSW;
  float maxSW;

  Scribbler(float y1, int r, int s, float minSW, float maxSW, boolean rainbow) {
    this.x1 = 0;
    this.y1 = y1;
    this.slope = s;
    this.r = r;
    this.rainbow = rainbow;
    this.minSW = minSW;
    this.maxSW = maxSW;
    this.tr = int(random(mint, maxt));
  }
  
  color getNextColour(){
    if(count++%50 == 0){
      colour = color(random(255),random(255),random(255));
    } 
    return colour;
  }
  void move(){
    x2 = random(0, width);

    y2 = y1 + random(-r,r);
 
    if(y2 >= SIZE || y2 <= 0){
      y2 = random(0, height);
    }
  }
  
  void scribble() {
    move();
    drawSwoosh();
  }
  
  void drawSwoosh(){
    strokeWeight(random(minSW,maxSW));

    noFill();
    float n;
   
      
     n = random(1,5);  
      

   x1 = width*0.5;
   y1 = height*0.5;
   beginShape();
 
  vertex(x1, y1);
  
  for(int i = 0; i < n; i++){

      bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r));
  }    for(int i = 0; i < n; i++){

      bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r));
  }for(int i = 0; i < n; i++){

  
    bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),random(width), random(height));
    }
    
  
    endShape();

    y1 = y2;
  }
  
  int getPoint(float s, int r){
    int q = width;
    return int(s) + int(random(0-q,q));
}

  color getColour() {
    return colour;
  }
  
  int getTrans(){
    return int(random(mint, maxt));
  }

}


void setup() {
  fullScreen();
  SW = 1;
  SIZE = 600;
  strokeCap(SQUARE);
  background(255);
  count = 0;

  strokeWeight(SW);
  mint = 255;
  maxt = 255;
  s1 = new Scribbler(random(height), width, 5, 0.5, 0.5, false);
  s2 = new Scribbler(random(height), width, 5, 12, 25, true);

}

void draw() {
    stroke(0,0,0,255);
    s1.scribble();
    stroke(s2.getNextColour());
    s2.scribble();
}