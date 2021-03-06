int SIZE = 600;
Scribbler s1, s2,s3;
int baset, tvar;
int SW;
float j = 0;
float[] exes = {random(SIZE*0.25, SIZE*0.75), random(SIZE*0.25, SIZE*0.75), random(SIZE*0.25, SIZE*0.75), random(SIZE*0.25, SIZE*0.75)};


void mousePressed(){
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
    float n = 10.0;    
    float x= x1+random(-r,r);
    float y=y1+random(-r,r);

   x1 = y1 = SIZE*0.5;
   beginShape();
 
  vertex(x, y);
  
  for(int i = 0; i < n; i++){
  
    bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),random(SIZE), random(SIZE));
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
  strokeCap(SQUARE);
  surface.setSize(SIZE, SIZE);
  background(30);
  strokeWeight(SW);
  baset = 5;
  tvar = 0;
  s2 = new Scribbler(random(SIZE), random(SIZE), 25, 5);

}

void lines() {
  stroke(0, 75);
  strokeWeight(2);
    for(int i = 0; i < exes.length; i++){
          float x = exes[i];

    line(x,SIZE*0.25,x,(SIZE*0.25+(SIZE*0.5/600.0)*j));
    }
    j = (j + 1);
    println(j);
}

void draw() {
    s2.scribble();
    stroke(30);
    strokeWeight(3);
    line(20, 30, SIZE-20, 30);
    line(SIZE-35, 20, SIZE-35, SIZE-25);
    line(20, SIZE-25, 90, SIZE-25);
    line(30, SIZE-90, 30, SIZE-10);
    rect(SIZE*0.4, SIZE*0.4, SIZE*0.35, SIZE*0.5);
    rect(SIZE*0.2, SIZE*0.15, SIZE*0.6, SIZE*0.3);
    rect(SIZE*0.15, SIZE*0.3, SIZE*0.4, SIZE*0.35);
    strokeWeight(1.25);
    line(SIZE*0.385, SIZE*0.465, SIZE*0.385, SIZE*0.635);

    noFill();



}