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

void setup() {
  WINDOWSIZE = 495;
  EGGSIZE = 80;
  COLSNUM = 3;
  BGCOLOUR = 35;
  TILT = 0.01;
  dir = 1;
  linecount = 0;
  size(WINDOWSIZE, WINDOWSIZE);
  BOXSIZE = int(float(WINDOWSIZE) / COLSNUM);
  MARGIN = (WINDOWSIZE-(BOXSIZE*COLSNUM))/(COLSNUM+1);
  imageMode(CENTER);
  noStroke();
  background(BGCOLOUR);
  i = 0;
  col = 0;
  row = 0;
  minx = MARGIN;
  miny = MARGIN+30;
  COLOUR = colours[i];
  strokeWeight(0.5);
  eggs = new ArrayList<EggRing>();
  eggs.add(new EggRing(minx, miny, TILT, EGGSIZE, COLOUR, linecount));
}

void addLine() {
    minx = (minx + BOXSIZE + MARGIN) % (WINDOWSIZE-MARGIN);
    col = (col + 1);
    row = col/COLSNUM;
    miny = ((BOXSIZE + MARGIN)*(row)) + 30;
    COLOUR = getNextColour();
    int a = minx;
    int b = miny + 1;
   
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
  while(linecount < 30){
    addLine();
    linecount++;
  }
}

void taperedLine(int x1, int y1){
  float t = TILT;
  eggs.add(new EggRing(x1, y1, t, EGGSIZE, COLOUR, linecount));
}

class Egg {
  float x, y; // X-coordinate, y-coordinate
  float tilt; // Left and right angle offset
  float angle; // Used to define the tilt
  float scalar; // Height of the egg
  float wobblesize;
  color linecol;

  // Constructor
  Egg(float xpos, float ypos, float t, float s, color c, int count) {
    x = xpos;
    y = ypos;
    tilt = t;
    scalar = s / 100.0;
    wobblesize = 0.09;
    linecol = c;
    angle = count;
  }

  void wobble() {
    tilt = cos(angle)/5;
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
    strokeWeight(10);
    line(WINDOWSIZE/2, -10, WINDOWSIZE/2,y+(dir*WINDOWSIZE));
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
      strokeWeight(14);
      stroke(155, 153);
      //ellipse(x, y, diameter, diameter);
      line(x,y,x+10,y+10);
    }
  }
}

class EggRing {
  Egg ovoid;
  Ring circle = new Ring();

  EggRing(float x, float y, float t, float sp, color c, int count) {
    ovoid = new Egg(x, y, t, sp, c, count);
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
