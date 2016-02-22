int SIZE = 600;
int baset, tvar;
int SW;
boolean started;
float j = 0;
float[] exes = {random(0, SIZE), random(0, SIZE), random(0, SIZE), random(0, SIZE)};


void setup() {
  SW = 10;
  fill(0);
  strokeCap(SQUARE);
  surface.setSize(SIZE, SIZE);
  background(255);
  //background(color(0,100,100, 1));
  strokeWeight(SW);
  stroke(0, 75);
  strokeWeight(2);

}

void lines() {

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
    background(255);
    lines();
  } else {
    background(255);
    text("Click to start", SIZE*0.45, SIZE*0.5);
  }
}