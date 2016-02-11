int SIZE = 600;
Garden g;
int baset = 200;
int SW = 10;
int BG = 25;

void mousePressed(){
  background(color(0,100,100, 1));
}

class Garden {
  float x1, y1, x2,y2;
  int slope;
  int r;
  color c;
  int tr;
  color[] colours;
  int cindex;
  int[] sizes = {60, 80, 100, 150, 70, 90};

  Garden() {
    this.tr = baset;
    this.colours = new color[] {color(190,95,0),color(150,20,0), color(225)};
    this.cindex = 0;
    getNextColour();
  }
  
  void getNextColour(){
    c = colours[cindex++%colours.length];
  }
  
  void colour(){
   
    if(random(20)>19){
      getNextColour();
    }
    stroke(c, tr);

  }
  
  void grow() {
    colour();
    flower();
    die();
  }
  
  void die() {
    if(random(100)>99) {
      background(BG);
    }
  }
  
  void flower(){
    float n = 20.0;    
    x1 = random(SIZE);
    y1 = random(SIZE);
    beginShape();
 
      vertex(x1, SIZE);
      
      for(int i = 0; i < n; i++){
        bezierVertex(getPoint(x1), getPoint(y1),getPoint(x1), getPoint(y1),x1,y1);
      }
 
    endShape();

  }
  
  int getPoint(float p){
    int ri = int(random(sizes.length));
    r = sizes[ri];
    return int(p) + int(random(0-r,r));
  }

}


void setup() {
  strokeCap(SQUARE);
  surface.setSize(SIZE, SIZE);
  background(BG);
  strokeWeight(SW);
  g = new Garden();
  frameRate(20);
  noFill();

}

void draw() {
  g.grow();
}