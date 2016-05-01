float x, y;
int size = 700;
float range = 20;
float baset = 200;
float crange = 10;
int BG = 50;
Chalk ch;
ArrayList<Chalk> chalks = new ArrayList<Chalk>();

class Chalk {
  float x;
  float y;
  float r;
  float g;
  float b;
  
  Chalk(float x, float y) {
    this.x = x;
    this.y = y;
    this.r = random(100,200);
    this.g = random(100,245);
    this.g = random(100,245);
  }
  
  color newColour() {
  r = newRGB(r);
  g = newRGB(g);
  b = newRGB(b);
  return color(r,g,b, varyTrans());
}
  
  void drawIt() {
    stroke(newColour(), varyTrans());
    bezier(x, y, r(x), r(y), r(x), r(y), r(x), r(y));
    x = pr(x);
    y = y + random(-8,8);
    
    if(x > size){
      x = 0;
      y = random(size);
    }
  }
}

void setup() {
  surface.setSize(size, size);
  noFill();
  strokeWeight(0.1);
  background(BG);
  chalks.add(new Chalk(0, random(size)));
  chalks.add(new Chalk(0, random(size)));

}

void draw() {    
 for(int i = 0; i < chalks.size(); i++){
   chalks.get(i).drawIt();
 }
}



float varyTrans() {
  return baset + random(-5,5);
}

float newRGB(float old){
  return old + random(-crange, crange);
}

float r(float in){
  return in + random(-range, range);
}

float pr(float in){
  return in + random(-1,8);
}