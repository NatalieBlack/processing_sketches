int i;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9};
color COLOUR;
int WINDOWSIZE, BOXSIZE, MARGIN, COLSNUM;
int minx, miny, col, row;
ArrayList<EggRing> eggs;
int EGGSIZE;
int BGCOLOUR;

void setup() {
  WINDOWSIZE = 495;
  EGGSIZE = 80;
  COLSNUM = 3;
  BGCOLOUR = 35;
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
  eggs.add(new EggRing(minx + (BOXSIZE/2), miny + (BOXSIZE/2), 0.1, EGGSIZE));
}

void mousePressed() {
    minx = (minx + BOXSIZE + MARGIN) % (WINDOWSIZE-MARGIN);
    col = (col + 1);
    row = col/COLSNUM;
    miny = ((BOXSIZE + MARGIN)*(row)) + 30;
    COLOUR = getNextColour();
    int a = minx + (BOXSIZE/2);
    int b = miny + 1 + (BOXSIZE/2);
   
    stroke(COLOUR);
    for(int e = 0; e < eggs.size(); e++){
      eggs.get(e).setWobble(false);
    }
    if(miny > WINDOWSIZE){
      for(int e = 0; e < eggs.size(); e++){
      eggs.get(e).setWobble(true);
    }
    } else {
      taperedLine(a,b);
    }
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
}

void taperedLine(int x1, int y1){
  float t = random(9) / 10;
  eggs.add(new EggRing(x1, y1, t, EGGSIZE));
}

class Egg {
  float x, y; // X-coordinate, y-coordinate
  float tilt; // Left and right angle offset
  float angle; // Used to define the tilt
  float scalar; // Height of the egg
  float wobblesize;
  int bv1;
  int bv2;
  int bv3;
  int bv4;

  // Constructor
  Egg(float xpos, float ypos, float t, float s) {
    x = xpos;
    y = ypos;
    tilt = t;
    scalar = s / 100.0;
    wobblesize = (4 + random(8)) / 100;
    bv1 = int(random(2));
    bv2 = int(random(2));
    bv3 = int(random(2));
    if(bv1 != 1 && bv2 != 1 && bv3 != 1){
      bv4 = 1;
    } else{
      bv4 = int(random(2));
    }
  }

  void wobble() {
    tilt = cos(angle) / 2;
    angle += wobblesize;
  }

  void display() {
    noStroke();
    fill(COLOUR);
    pushMatrix();
    translate(x, y);
    rotate(tilt);
    scale(scalar);
    

    beginShape();
    vertex(0, -100);
    if(bv1 == 1){
      bezierVertex(25, -100, 40, -65, 40, -40);
    }
    if(bv2 == 1){
      bezierVertex(40, -15, 25, 0, 0, 0);
    }
    if(bv3 == 1){
      bezierVertex(-25, 0, -40, -15, -40, -40);
    }
    if(bv4 == 1){
      bezierVertex(-40, -65, -25, -100, 0, -100);
    }
    endShape();
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
      strokeWeight(4);
      stroke(155, 153);
      ellipse(x, y, diameter, diameter);
    }
  }
}

class EggRing {
  Egg ovoid;
  Ring circle = new Ring();
  boolean wobbling;

  EggRing(float x, float y, float t, float sp) {
    ovoid = new Egg(x, y, t, sp);
    circle.start(x, y - sp/2);
    wobbling = true;
  }
  
  void setWobble(boolean w){
    wobbling = w;
  }

  void transmit() {
    if(wobbling){
      ovoid.wobble();
    }
    ovoid.display();
    if (circle.on == false) {
      circle.on = true;
    }
  }
}
