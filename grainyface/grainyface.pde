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
    if(random(2)==1){
      c = color(255);
    } else if(random(4)==2){
      c = color(0);
    } else {
      c = color(random(255)); 
    }
  }
  void move(){
    x2 = random(0, SIZE);

    y2 = y1 + random(-r,r);
    
    if(random(50)>39){
      if(random(4)==3){
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
  //background(color(0,100,100, 1));
  strokeWeight(SW);
  baset = 5;
  tvar = 0;
  s2 = new Scribbler(random(SIZE), random(SIZE), 25, 5);
//  s1 = new Scribbler(random(SIZE), random(SIZE), 60, 5);

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
//    s1.scribble();
    s2.scribble();
    //fill(30,30,30,2);
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
    //triangle(SIZE*0.385, SIZE*0.465, SIZE*0.27, SIZE*0.465, SIZE*0.385, SIZE*0.58);
    line(SIZE*0.385, SIZE*0.465, SIZE*0.385, SIZE*0.635);
    //triangle(0, 0, SIZE,0, SIZE, SIZE);
    //lines();
    noFill();
//    fill(255,1);
//    stroke(255, 1);
//
//
//    ellipse(SIZE*0.5,SIZE*0.5,50,50);
//        ellipse(SIZE*0.5,SIZE*0.5,40,40);
//            fill(255,10);
//
//            stroke(255, 10);
//
//        ellipse(SIZE*0.5,SIZE*0.5,30,30);
//        ellipse(SIZE*0.5,SIZE*0.5,20,20);
//        ellipse(SIZE*0.5,SIZE*0.5,10,10);
//                ellipse(SIZE*0.5,SIZE*0.5,5,5);
//
//

    //s3.scribble();

}