int SIZE = 600;
int baset, tvar;
int SW;
float j = 0;
int linenum = 28;
float[] exes = new float[linenum];
color[] colours = {color(255,0,0), color(0,255,0), color(0,0,0), color(0, 0, 255),color(255,0,0), color(0,255,0), color(0,0,0), color(0, 0, 255)};
boolean started;
void setup() {
  fill(0);
  SW = 20;
  strokeCap(SQUARE);
  surface.setSize(SIZE, SIZE);
  background(255);
  strokeWeight(SW);
  baset = 5;
  tvar = 0;
  for(int i = 0; i < exes.length; i++){
    exes[i] = random(SIZE);
  }
}

void lines() {
  stroke(0, 100);
  strokeWeight(SW);
  for(int i = 0; i < exes.length; i++){
    float x = exes[i];
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


void mousePressed() {
  started = true;
}

void draw() {
  if(started){
    fill(255);
    stroke(255);
    rect(0, 0, SIZE,SIZE);
    lines();
    noFill();
  } else {
    background(255);
    text("Click to start", SIZE*0.45, SIZE*0.5);

  }
}