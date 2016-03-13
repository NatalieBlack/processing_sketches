import ddf.minim.*;

Minim minim;
AudioInput in;

float minvol,maxvol, lv, rv, range;

color[] sg_colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
color sg_COLOUR;
int sg_i;
int sg_WINDOWSIZE;
boolean started;
float xset, yset;

void setup() {
  size(700,700);
  minim = new Minim(this);
  in = minim.getLineIn();
  stroke(255);
  setupStainedGlass();
}

void draw() {
  
  lv = in.left.get(0);
  rv = in.right.get(0);
  //println(lv);
  //println(rv);
  establishLimits();
  loudRestart();
 
  drawStainedGlass();
}


void setupStainedGlass() {
  frameRate(18);
  sg_WINDOWSIZE = 700;
  sg_i = 0;
  strokeWeight(1);
  stroke(#FFFFFF);

  mybackground();
  fill(0);
  fill(255, 10);
  xset = (width - sg_WINDOWSIZE)*0.5;
  yset = (height - sg_WINDOWSIZE)*0.5;

}

void mybackground() {
  background(255);
}

color sg_getNextColour(){
  sg_i++;
  return sg_colours[sg_i%sg_colours.length];
}

void sketchyCircle(){
  beginShape();
  int x1 = int(random(sg_WINDOWSIZE));
  int y1 = int(random(sg_WINDOWSIZE));

  fill(sg_getNextColour(), 10);
  

  vertex(xset + int(random(sg_WINDOWSIZE)),yset + int(random(sg_WINDOWSIZE)));

  bezierVertex(xset + int(random(sg_WINDOWSIZE)), yset + int(random(sg_WINDOWSIZE)), xset + int(random(100)), yset + x1, xset + x1, yset + int(random(sg_WINDOWSIZE)));

  bezierVertex(xset + int(random(sg_WINDOWSIZE)), yset + int(random(sg_WINDOWSIZE)), xset + int(random(sg_WINDOWSIZE)), yset + y1, xset + y1, yset + int(random(sg_WINDOWSIZE)));

  endShape();
  
  beginShape();
  vertex(xset + int(random(sg_WINDOWSIZE)), yset + int(random(sg_WINDOWSIZE)));
  bezierVertex(xset + int(random(sg_WINDOWSIZE)), yset + int(random(sg_WINDOWSIZE)), xset + int(random(sg_WINDOWSIZE)), yset + x1, xset + y1, yset + int(random(sg_WINDOWSIZE)));
  bezierVertex(xset + int(random(sg_WINDOWSIZE)), yset + int(random(sg_WINDOWSIZE)), xset + int(random(sg_WINDOWSIZE)), yset + y1, xset + x1, yset + int(random(sg_WINDOWSIZE)));
  bezierVertex(xset + int(random(sg_WINDOWSIZE)), yset + int(random(sg_WINDOWSIZE)), xset + int(random(sg_WINDOWSIZE)), yset + x1, xset + x1, yset + int(random(sg_WINDOWSIZE)));
  bezierVertex(xset + int(random(sg_WINDOWSIZE)), yset + int(random(sg_WINDOWSIZE)), xset + int(random(sg_WINDOWSIZE)), yset + x1, xset + x1, yset + int(random(sg_WINDOWSIZE)));

  bezierVertex(xset + int(random(sg_WINDOWSIZE)), yset + int(random(sg_WINDOWSIZE)), xset + int(random(sg_WINDOWSIZE)), yset + y1, xset + y1, yset + int(random(sg_WINDOWSIZE)));
  bezierVertex(xset + int(random(sg_WINDOWSIZE)), yset + int(random(sg_WINDOWSIZE)), xset + x1, yset + int(random(sg_WINDOWSIZE)), xset + int(random(sg_WINDOWSIZE)), yset + y1);

  endShape();

}

void drawStainedGlass() {
  if(random(100) > 99) {
    //mybackground();
  }
  sketchyCircle();
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
  return map(i, minvol, maxvol, 0, 255);
}