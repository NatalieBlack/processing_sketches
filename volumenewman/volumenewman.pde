import ddf.minim.*;

Minim minim;
AudioInput in;

float minvol = -1;
float maxvol = 1;
float lv, rv, range;

int SIZE = 500;
int MID = SIZE/2;
int clow = 100;
int chigh = 200;
int o = 85;

void setup() {
  fullScreen();
  minim = new Minim(this);
  in = minim.getLineIn();
  stroke(255);
  setupNM();
}

void setupNM() {
  background(40);
  frameRate(35);
  stroke(25, 80);
  noFill();
}

void draw() {
  if(in.left != null) {
    lv = in.left.get(0);
  } else {
    lv = random(minvol, maxvol);
  }
  if(in.right != null) {   
    rv = in.right.get(0);
  } else {
    rv = random(minvol, maxvol);
  }
  //println(lv);
  //println(rv);
  establishLimits();
  drawNM();
}

void drawNM() {
  strokeWeight(1);
    topLeft(color(chigh, chigh, clow, o));

  topRight(color(clow, chigh+25, chigh-25, o));
  varyWeight();
    lowerTop(color(clow, clow, chigh, o));

  lowerBottom(color(40, o));
}

void mybackground() {
  background(255);
}

void establishLimits() {
   if(lv > maxvol){
    maxvol = lv;
    resetRange(); 
  } else if (lv < minvol) {
    minvol = lv;
    resetRange();
  }
  if(rv > maxvol){
    maxvol = rv;
    resetRange();
  } else if (rv < minvol) {
    minvol = rv;
    resetRange();
  }
}

void resetRange(){
  range = maxvol - minvol;
  println(range);
}

void loudRestart() {
   if( maxvol - lv <= range/10.0){
     mybackground();
   } 
}

float mapVol(float i){
  return map(i, minvol, maxvol, 0, 6);
}

void varyWeight() {
  float w = mapVol(lv);
  strokeWeight(w);
}
void lowerTop(color c) {
  stroke(c);
  float x = random(0, width);
  float y = random(height/4, height);
  line(x, height/4, x, y);
}

void topLeft(color c) {
  stroke(c);
  float x2 = random(0, width);
  float y = random(0, height/4);
  line(0, y, x2, y);
}


void topRight(color c) {
  stroke(c);
  float y = random(0, height/4);
  float x = random(width/4, width);
  line(x, y, width, y);
}

void lowerBottom(color c) {
  stroke(c);
  float x = random(0, width);
  float y = random(height/4, height);
  line(x, y, x, height);
}