int SIZE;
Scribbler s1, s2,s3;
int SW;
int count;
int r = int(random(255));
int g = int(random(255));
int b = int(random(255));
int cvar = 45;
int q = 0;

class Scribbler {
  float x1, y1, x2,y2;
  int slope;
  int r;
  color colour;
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
  }
  
  color getNextColour(){
    if(count++%40 == 0){
      r = max(0,min(255,r + int(random(-cvar,cvar))));
      g = max(0,min(255,g + int(random(-cvar,cvar))));
      b = max(0,min(255,b + int(random(-cvar,cvar))));
      colour = color(r,g,b,8);
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

      bezierVertex(getPoint(x1), getPoint(y1),getPoint(x1), getPoint(y1),getPoint(x1), getPoint(y1));
  }   
  
    endShape();

    y1 = y2;
  }
  
  int getPoint(float s){
    q = width;
    return int(s) + int(random(-q,q));
}

  color getColour() {
    return colour;
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
  s1 = new Scribbler(random(height), width, 5, 0.5, 0.5, false);
  s2 = new Scribbler(random(height), width, 5, 10, 50, true);

}

void draw() {
    stroke(0,0,0,255);
    s1.scribble();
    stroke(s2.getNextColour());
    s2.scribble();
}