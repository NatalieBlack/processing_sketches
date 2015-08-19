int i;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9};
color COLOUR;
int WINDOWSIZE, BOXSIZE, MARGIN, COLSNUM;
int minx, miny, col, row;
ArrayList<EggRing> eggs;
int EGGSIZE;
int BGCOLOUR;
float TILT;
int dir;
int linecount;
int toppos;
int SW;
int NUMLINES;

void setup() {
  frameRate(35);
  WINDOWSIZE = 495;
  EGGSIZE = 80;
  COLSNUM = 3;
  BGCOLOUR = 35;
  TILT = 0.01;
  toppos = 0;
  dir = 1;
  SW = 10;
  NUMLINES = 100;
  linecount = 0;
  size(WINDOWSIZE, WINDOWSIZE);
  BOXSIZE = int(float(WINDOWSIZE) / COLSNUM);
  MARGIN = (WINDOWSIZE-(BOXSIZE*COLSNUM))/(COLSNUM+1);
  imageMode(CENTER);
  noStroke();
  strokeWeight(SW);

  background(BGCOLOUR);
  i = 0;
  col = 0;
  row = 0;
  minx = MARGIN;
  miny = MARGIN+30;
  COLOUR = colours[i];
  eggs = new ArrayList<EggRing>();
  eggs.add(new EggRing(minx, miny, TILT, EGGSIZE, COLOUR, linecount, toppos));
}

void addLine() {
    minx = (minx + BOXSIZE + MARGIN) % (WINDOWSIZE-MARGIN);
    col = (col + 1);
    row = col/COLSNUM;
    miny = ((BOXSIZE + MARGIN)*(row)) + 30;
    COLOUR = getNextColour();
    int a = minx;
    int b = miny + 1;
    toppos = (toppos + (WINDOWSIZE/NUMLINES)) % WINDOWSIZE;

   
    stroke(COLOUR);
    taperedLine(a,b);
}     

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void draw() { 
  background(BGCOLOUR);

  for(int e = 0; e < eggs.size(); e++){
    eggs.get(e).transmit();
  }
  while(linecount < NUMLINES){
    addLine();
    linecount++;
  }
}

void taperedLine(int x1, int y1){
  float t = TILT;
  eggs.add(new EggRing(x1, y1, t, EGGSIZE, COLOUR, linecount, toppos));
}

class Egg {
  float x, y; // X-coordinate, y-coordinate
  float tilt; // Left and right angle offset
  float angle; // Used to define the tilt
  float scalar; // Height of the egg
  float wobblesize;
  color linecol;
  int anchor;

  // Constructor
  Egg(float xpos, float ypos, float t, float s, color c, int count, int a) {
    x = xpos;
    y = ypos;
    tilt = t;
    anchor = a;
    scalar = s / 100.0;
    wobblesize = 0.07;
    linecol = c;
    angle = count-WINDOWSIZE;
  }

  void wobble() {
    tilt = cos(angle);
    angle += wobblesize;
  }

  void display() {
    //noStroke();
    fill(linecol);
    pushMatrix();
    //translate(x, y);
    rotate(tilt);
    //scale(scalar);
    stroke(linecol);
    line(anchor, -400, anchor,(WINDOWSIZE+200));
    dir = dir * -1;
    //beginShape();
    //vertex(0, -100);
    //bezierVertex(25, -100, 40, -65, 40, -40);
    //bezierVertex(40, -15, 25, 0, 0, 0);
    //bezierVertex(-25, 0, -40, -15, -40, -40);
    //bezierVertex(-40, -65, -25, -100, 0, -100);
    //endShape();
    popMatrix();
  }
}



class Ring {
  
  float x, y; // X-coordinate, y-coordinate
  float diameter; // Diameter of the ring
  boolean on = false; // Turns the display on and off
  float xorig;

  
  void start(float xpos, float ypos) {
    xorig = xpos;
    x = xpos;
    y = ypos;
    on = true;
    diameter = 1;
  }
  
  void grow() {
    if (on == true) {
      diameter += 0.5;
      if (diameter > width*2) {
        diameter = 0.0;
      }
    }
  }
  
  void move() {
    if (on == true) {
      x = x - 1;
      if (x <= 0) {
        x = xorig;
      }
    }
  }
  
  void display() {
    if (on == true) {
      fill(COLOUR);
      stroke(155, 153);
      //ellipse(x, y, diameter, diameter);
      line(x,y,x+10,y+10);
    }
  }
}

class EggRing {
  Egg ovoid;
  Ring circle = new Ring();

  EggRing(float x, float y, float t, float sp, color c, int count, int anchor) {
    ovoid = new Egg(x, y, t, sp, c, count, anchor);
    circle.start(x, y - sp/2);
  }

  void transmit() {
    ovoid.wobble();
    ovoid.display();
    if (circle.on == false) {
      circle.on = true;
    }
  }
}
