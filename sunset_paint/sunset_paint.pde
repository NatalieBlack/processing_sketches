int BG = 10;
boolean sunset = true;
Brush orange, black;
int baset = 5;
int tvar = 5;
int SW = 12;
int sections = 0;

class Brush {
  float x1, y1, x2,y2;
  int r;
  color c;
  int tr;
  color[] colours;
  int cindex;
  int limit;

  Brush(float y1, int r, color[] colours, int l) {
    this.x1 = 0;
    this.limit = l;
    this.y1 = y1;
    this.r = r;
    this.tr = baset + int(random(-tvar, tvar));
    this.colours = colours;
    this.cindex = 0;
    getNextColour();
  }
  
  void getNextColour(){
    c = colours[cindex++%colours.length]; 
  }
  void move(){
    x2 = random(0, width);

    y2 = y1 + random(-r,r);
    if(random(100)>99){
      x1 = width - x1;
      getNextColour();
      delay(2000);
      sections++;
    }
    if(y2 >= height || y2 <= 0){
      y2 = random(0, height);
    }
  }
  
  void paint() {
    tr = baset + int(random(-tvar, tvar));
    stroke(c, tr);
    move();
    drawLine();
    breakTime();
  }
  
  void breakTime() {
    if(sections == limit){
      sunset = !sunset;
      sections = 0;
    }
  }

  
  void drawLine(){

    float n = 40.0;    
    for(int i = 0; i < n; i++){
      line(x1, y1, x1 + ((1+i)*(x2-x1)/n), y1);
    }
    y1 = y2;
  }
  
}

void setup() {
  fullScreen();
  frameRate(20);
  strokeCap(SQUARE);
  background(BG);
  strokeWeight(SW);

  orange = new Brush(random(height), 20, new color[] {#FF8E64, #FF581A,#FF733F,#FFAD8E,#FFD3C3,#FFBC64,#FFE5C3,#FFCE8E}, 30);
  black = new Brush(random(height), 40, new color[] {#000000}, 12);
}

void draw() {
  if(sunset == true) {
    orange.paint();
  } else {
    black.paint();
  }
}