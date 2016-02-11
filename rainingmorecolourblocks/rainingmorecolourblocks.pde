int SIZE = 600;
int baset, tvar;
int SW;
float j = 0;
float[] exes = {random(0, SIZE), random(0, SIZE), random(0, SIZE), random(0, SIZE),random(0, SIZE), random(0, SIZE), random(0, SIZE), random(0, SIZE)};
color[] colours = {color(255,0,0), color(0,255,0), color(0,0,0), color(0, 0, 255),color(255,0,0), color(0,255,0), color(0,0,0), color(0, 0, 255)};

void setup() {
  SW = 10;
  strokeCap(SQUARE);
  surface.setSize(SIZE, SIZE);
  background(255);
  strokeWeight(SW);
  baset = 5;
  tvar = 0;
}

void lines() {
  stroke(0, 200);
  strokeWeight(60);
  for(int i = 0; i < exes.length; i++){
    float x = exes[i];
    stroke(colours[i], 100);
    line(x,0,x,((SIZE/600.0)*(j)));
  }
  j = (j + 1);
  if(j > 600) {
    resetExes();
    j = 0;
  }
}

void resetExes() {
  for(int i = 0; i < exes.length; i++){
    exes[i] = random(SIZE);
  }
}



void draw() {
    fill(255);
    stroke(255);
    background(255);
    lines();
    noFill();
}