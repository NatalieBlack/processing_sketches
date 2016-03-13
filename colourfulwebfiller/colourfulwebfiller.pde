int SIZE;
Scribbler s1, s2,s3;
int mint, maxt;
int SW;
int count;
int r,g,b;
int cvar;
int n = 1;

void mousePressed(){
  n += 1;
}

class Scribbler {
  float x1, y1, x2,y2;
  int slope;
  int r;
  color c, prevc;
  int tr;
  color[] colours;
  int cindex;

  Scribbler(float y1, int r, int s) {
    this.x1 = 0;
    this.y1 = y1;
    this.slope = s;
    this.r = r;
    this.tr = int(random(mint, maxt));
    this.colours = new color[] {color(0,100,75),color(0,75,100)};
    this.cindex = 0;
    getNextColour();
  }
  
  void white(){
    c = color(255);
  }
  
  void getNextColour(){
    prevc = c;
    r = max(0,min(255,r + int(random(-cvar,cvar))));
    g = max(0,min(255,g + int(random(-cvar,cvar))));
    b = max(0,min(255,b + int(random(-cvar,cvar))));
    c = color(r,g,b);
  }
  void move(){
    x2 = random(0, width);

    y2 = y1 + random(-r,r);
    

      if(count++%50 == 0){
            getNextColour();
      }
      
    

    if(y2 >= SIZE || y2 <= 0){
      y2 = random(0, height);
    }
  }
  
  void setTransparency() {
    tr = int(random(mint, maxt));  
    stroke(c, tr);
  }
  
  void scribble() {
    setTransparency();
    move();
    drawSwoosh();
  }
  
  void drawSwoosh(){
    noFill();
  
   x1 = width*0.5;
   y1 = height*0.5;
  
  
  for(int i = 0; i < n; i++){
    beginShape();
      vertex(random(width*0.2,width*0.8), random(height*0.2,height*0.8));
      
      for(int j = 0; j < n; j++){
        bezierVertex(getPoint(x1), getPoint(y1),getPoint(x1), getPoint(y1),getPoint(x1), getPoint(y1));
      }
      
    endShape();
  }   
  
    y1 = y2;
  }
  
  int getPoint(float c){
    int q = width;
    return int(c) + int(random(0-q,q));
}

}


void setup() {
  fullScreen();
  SIZE = 600;
  strokeCap(SQUARE);
  background(255);
  count = 0;
  cvar = 50;
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));

  strokeWeight(0.5);
  mint = 255;
  maxt = 255;
  s2 = new Scribbler(random(height), width, 5);

}

void draw() {
    s2.scribble();
}