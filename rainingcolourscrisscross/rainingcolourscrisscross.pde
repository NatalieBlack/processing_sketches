int SIZE = 600;
int baset, tvar;
int SW;
float j,k = 0;
float[] exes = {random(0, SIZE), random(0, SIZE), random(0, SIZE), random(0, SIZE)};
color[] colours = {color(255,0,0), color(0,255,0), color(0,0,0), color(0, 0, 255)};
float[] whys = {random(0, SIZE), random(0, SIZE), random(0, SIZE), random(0, SIZE)};
boolean vertical = true;

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
    resetWhys();
    j = 0;
    vertical = false;
  }
}

void lines2() {
  stroke(0, 200);
  strokeWeight(60);
  for(int i = 0; i < exes.length; i++){
    float x = exes[i];
    stroke(colours[i], 100);
    line(x, 0, x, SIZE);
  }
  
  for(int i = 0; i < whys.length; i++){
    float y = whys[i];
    stroke(colours[i], 100);
    line(0,y, ((SIZE/600.0)*(k)), y);
  }
  k += 1;
  if(k > 600) {
    resetExes();
    k = 0;
    vertical = true;
  }
}

void resetExes() {
  for(int i = 0; i < exes.length; i++){
    exes[i] = random(SIZE);
  }
}

void resetWhys() {
  for(int i = 0; i < whys.length; i++){
    whys[i] = random(SIZE);
  }
}

void rects() {
  noStroke();
  fill(0, 100);
  rect(0, 50, SIZE, 50);
  fill(255,0,0, 100);
  rect(0, 150, SIZE, 50);
  fill(0, 255, 0,100);
  rect(0, 350, SIZE, 50);
  fill(0,0,255,100);
  rect(0, 500, SIZE, 50);
};

void draw() {
    fill(255);
    stroke(255);
    background(255);
    if(vertical) {
    lines();
    } else {
      lines2();
    }
    noFill();
}