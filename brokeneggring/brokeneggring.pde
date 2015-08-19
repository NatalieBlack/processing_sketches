EggRing er1, er2;
int WINDOWWIDTH;
int WINDOWHEIGHT;


void setup() {
  WINDOWWIDTH = 640;
  WINDOWHEIGHT = 360;
  size(WINDOWWIDTH, WINDOWHEIGHT);

  //er1 = new EggRing(width*0.45, height*0.5, 0.1, 120);
  er2 = new EggRing(width*0.65, height*0.8, 0.05, 180);
}


void draw() {
  background(0);
  //er1.transmit();
  er2.transmit();
}



class Egg {
  float x, y; // X-coordinate, y-coordinate
  float tilt; // Left and right angle offset
  float angle; // Used to define the tilt
  float scalar; // Height of the egg

  // Constructor
  Egg(float xpos, float ypos, float t, float s) {
    x = xpos;
    y = ypos;
    tilt = t;
    scalar = s / 100.0;
  }

  void wobble() {
    tilt = cos(angle) / 8;
    angle += 0.1;
  }

  void display() {
    noStroke();
    fill(255);
    pushMatrix();
    translate(x, y);
    rotate(tilt);
    scale(scalar);
    beginShape();
    vertex(0, -100);
    bezierVertex(25, -100, 40, -65, 40, -40);
    bezierVertex(40, -15, 25, 0, 0, 0);
    bezierVertex(-25, 0, -40, -15, -40, -40);
    bezierVertex(-40, -65, -25, -100, 0, -100);
    endShape();
    popMatrix();
  }
}



class Ring {
  
  float x, y; // X-coordinate, y-coordinate
  float diameter; // Diameter of the ring
  boolean on = false; // Turns the display on and off
  float xorig, yorig;
  float xd, yd;
  
  Ring(float xdiff, float ydiff) {
     xd = xdiff;
     yd = ydiff;
   }
  
  void start(float xpos, float ypos) {
    xorig = xpos;
    yorig = ypos;
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
      x = x + xd;
      y = y + yd;
      if (x <= 0 || x >= WINDOWWIDTH || y <= 0 | y >= WINDOWHEIGHT) {
        x = xorig;
        y = yorig;
      }
    }
  }
  
  void display() {
    if (on == true) {
      noFill();
      strokeWeight(4);
      stroke(155, 153);
      ellipse(x, y, diameter, diameter);
    }
  }
}

class EggRing {
  Egg ovoid;
  ArrayList<Ring> circles = new ArrayList<Ring>();
  EggRing(float x, float y, float t, float sp) {
    ovoid = new Egg(x, y, t, sp);
    for(float i = -1.0; i <= 1.0; i++){
      for(float j = -1.0; j <= 1.0; j++) {
        if(i == 0 && j ==0){
          continue;
        }
        circles.add(new Ring(i, j));
      }
    }
    for(int k = 0; k < circles.size(); k++){
      circles.get(k).start(x, y - sp/2);
    }

  }

  void transmit() {
    ovoid.wobble();
    ovoid.display();
    for(int i = 0; i < circles.size(); i++){
      circles.get(i).move();
      circles.get(i).display();
      if (circles.get(i).on == false) {
      circles.get(i).on = true;
      }
    }
   }
}
