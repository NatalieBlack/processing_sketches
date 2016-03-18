import ddf.minim.*;

boolean newman = true;
boolean sunsetpaint = true;
boolean tissue = true;
boolean stainedglass = true;
boolean lineboxes = true;
boolean scribbler = true;

int ssp_limit = 4;
int nm_limit = 10000;
int t_limit = 8000;
int sg_limit = 8000;
int lb_limit = 6000;

Minim minim;
AudioInput in;

float minvol,maxvol = 0.01; 
float lv, rv, range;
int repeated = 0;

int hSIZE, wSIZE;
Scribbler s1, s2,s3,s4,s5,s6;
int sc_i = 0;
int sc_BG = 240;

int lb_i;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9};
color COLOUR;
int WINDOWSIZE, BOXSIZE, MARGIN, COLSNUM;
int minx, miny, col, row;
int counter = 1;
float xoffset = 0;
float yoffset = 0;

class Scribbler {
  float x1, y1,x2,y2;
  int r;
  color c;

  Scribbler(float x1, float y1, int r, color c) {
    this.x1 = x1;
    this.y1 = y1;
    this.r = r;
    this.c = c;
  }
  
  int varyTrans() {
    return int(map(lv, minvol, maxvol, 25, 75));
  }
  
  void scribble() {
    stroke(c, varyTrans());
    x2 = max(0, x1 + random(-r,r));
    x2 = min(x2, wSIZE);
    y2 = max(0,y1 + random(-r,r));
    y2 = min(y2, hSIZE);
    line(x1, y1, x2, y2);
    x1 = x2;
    y1 = y2;
  }
}

void setupScribbler() {
  hSIZE = height;
  wSIZE = width;
  background(sc_BG);
  strokeWeight(3);
  s1 = new Scribbler(random(wSIZE), random(hSIZE), 20, color(79, 180, 142));
  s2 = new Scribbler(random(wSIZE), random(hSIZE), 20, color(50));
  s3 = new Scribbler(random(wSIZE), random(hSIZE), 40, color(42, 94, 116));
  s4 = new Scribbler(random(wSIZE), random(hSIZE), 10, color(79, 180, 142));
  s5 = new Scribbler(random(wSIZE), random(hSIZE), 10, color(50));
  s6 = new Scribbler(random(wSIZE), random(hSIZE), 20, color(42, 94, 116));
}

void drawScribbler() {
  s1.scribble();
  s2.scribble();
  s3.scribble();
  s4.scribble();
  s5.scribble();
  s6.scribble();

  if(sc_i++ == 200000){
    background(sc_BG);
    sc_i = 0;
  }
}



void setupLineBoxes() {
  WINDOWSIZE = int(width*0.4);
  COLSNUM = 3;
  BOXSIZE = int(float(WINDOWSIZE) / COLSNUM);
  MARGIN = (WINDOWSIZE-(BOXSIZE*COLSNUM))/(COLSNUM+1);
  noStroke();
  background(255);
  lb_i = -1;
  col = 0;
  row = 0;
  minx = MARGIN;
  miny = MARGIN;
  COLOUR = getNextColour();
  strokeWeight(0.5);
  xoffset = 0.5*(width*0.6);//0.5*(width - ( BOXSIZE)*COLSNUM);
  yoffset = 0.5*(height-WINDOWSIZE);
}

void nextBox() {

  minx = (minx + BOXSIZE + MARGIN) % (WINDOWSIZE-MARGIN);
  col = (col + 1);
  row = col/COLSNUM;
  miny = ((BOXSIZE + MARGIN)*(row)) % (WINDOWSIZE-MARGIN);
    COLOUR = getNextColour();

  if (lb_i == COLSNUM*COLSNUM - 1) {
    lb_i = -1;
  }
}     

color getNextColour() {
  lb_i++;
  return colours[lb_i%colours.length];
}

void drawLineBoxes() { 
  int a = minx + int(random(BOXSIZE));
  int b = miny + 1 + int(random(BOXSIZE));
  int c;
  int d;
  do {
    c = minx + int(random(BOXSIZE));
  } while (a == c);
  do {
    d = miny + 1 + int(random(BOXSIZE));
  } while (d == b);
  stroke(COLOUR);
  taperedLine(a, b, c, d);
  if (counter++ % 50 == 0) {
    nextBox();
    if(counter >= lb_limit) {
      lineboxes = false;
      setupScribbler();
    }
  }
}

void taperedLine(int x1, int y1, int x2, int y2) {
  line(x1+xoffset, y1+yoffset, x2+xoffset, y2+yoffset);

  int midx = (x1+x2)/2;
  int midy = (y1+y2)/2;

  int midx1 = (x1+midx)/2;
  int midy1 = (y1+midy)/2;
  int midx2 = (x2+midx)/2;
  int midy2 = (y2+midy)/2;

  int midx3 = (x1+midx1)/2;
  int midy3 = (y1+midy1)/2;
  int midx4 = (x2+midx2)/2;
  int midy4 = (y2+midy2)/2;

  strokeWeight(1.5);
  line(midx1+xoffset, midy1+yoffset, midx2+xoffset, midy2+yoffset);
  strokeWeight(1);
  line(midx3+xoffset, midy3+yoffset, midx4+xoffset, midy4+yoffset);
  strokeWeight(0.5);
}

//NEWMAN

int clow = 100;
int chigh = 200;
int o = 85;
int nm_i = 0;

void setupNewman() {
  background(40);
  frameRate(35);
  stroke(25, 80);
  noFill();
}

void drawNewman() {
  strokeWeight(1.5);
  topLeft(color(chigh, chigh, clow, o));
  topRight(color(clow, chigh+25, chigh-25, o));
  varyWeight();
  lowerTop(color(clow, clow, chigh, o));
  lowerBottom(color(40, o));
  if(nm_i++ > nm_limit) {
    newman = false;
    setupSunset();
  }
}

void varyWeight() {
  float w = map(lv, minvol, maxvol, 0, 4);
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

//tissue

Tissue t1;
int count;
int r = int(random(255));
int g = int(random(255));
int b = int(random(255));
int cvar = 45;
int q = 0;
int t_i = 0;

class Tissue {
  float x1, y1, x2,y2;
  int slope;
  int r;
  color colour;
  boolean rainbow;
  float minSW;
  float maxSW;

  Tissue(float y1, int r, int s, float minSW, float maxSW, boolean rainbow) {
    this.x1 = 0;
    this.y1 = y1;
    this.slope = s;
    this.r = r;
    this.rainbow = rainbow;
    this.minSW = minSW;
    this.maxSW = maxSW;
  }
  
  color getNextColour(){
    if(count++%40 == 0){
      r = max(0,min(255,r + int(random(-cvar,cvar))));
      g = max(0,min(255,g + int(random(-cvar,cvar))));
      b = max(0,min(255,b + int(random(-cvar,cvar))));
      colour = color(r,g,b,8);
    } 
    return colour;
  }
  void move(){
    x2 = random(0, width);

    y2 = y1 + random(-r,r);
 
    if(y2 >= height || y2 <= 0){
      y2 = random(0, height);
    }
  }
  
  void scribble() {
    move();
    drawSwoosh();
  }
  
  void drawSwoosh(){
    strokeWeight(random(minSW,maxSW));

    //noFill();
    float n;
   
      
     n = random(1,5);  
      

   x1 = width*0.5;
   y1 = height*0.5;
   beginShape();
 
  vertex(x1, y1);
  
  for(int i = 0; i < n; i++){

      bezierVertex(getPoint(x1), getPoint(y1),getPoint(x1), getPoint(y1),getPoint(x1), getPoint(y1));
  }   
  
    endShape();

    y1 = y2;
  }
  
  int getPoint(float s){
    q++;
    q = q%width;
    return int(s) + int(random(-q,q));
}

  color getColour() {
    return colour;
  }
  
}

void setupTissue() {
  strokeCap(SQUARE);
  background(255);
  count = 0;
  t1 = new Tissue(random(height), width, 5, 10, 50, true);
  noStroke();
  resetRange();
}

void drawTissue() {
  fill(t1.getNextColour());
  loudRestart();
  t1.scribble();
  if(t_i++ > t_limit) {
    tissue = false;
    setupStainedGlass();
  }
}

//stained glass
color[] sg_colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
color sg_COLOUR;
int sg_i;
int sg_WINDOWSIZE;
boolean started;
float xset, yset;

color sg_getNextColour(){
  sg_i++;
  return sg_colours[sg_i%sg_colours.length];
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

void drawStainedGlass() {
  loudRestart();
  sketchyCircle();
  if(sg_i > sg_limit) {
    stainedglass = false;
    setupLineBoxes();
  }

}

boolean coinToss(){
  return int(random(10)) == 1; 
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

int ssp_BG = 10;
boolean sunset = true;
Brush orange, black;
int baset = 5;
int tvar = 5;
int ssp_SW = 12;
int sections = 0;
int ssp_i = 0;

class Brush {
  float x1, y1, x2,y2;
  int r;
  color c;
  float tr;
  color[] colours;
  int cindex;
  int limit;

  Brush(float y1, int r, color[] colours, int l) {
    this.x1 = 0;
    this.limit = l;
    this.y1 = y1;
    this.r = r;
    this.tr = baset + int(random(-tvar, tvar));
    this.colours = colours;
    this.cindex = 0;
    ssp_getNextColour();
  }
  
  void ssp_getNextColour(){
    c = colours[cindex++%colours.length]; 
  }
  void move(){
    x2 = random(0, width);

    y2 = y1 + random(-r,r);
    if(random(100)>99){
      x1 = width - x1;
      ssp_getNextColour();
      delay(2000);
      sections++;
    }
    if(y2 >= height || y2 <= 0){
      y2 = random(0, height);
    }
  }
  
  
  void paint() {
    tr = random(tvar());
    stroke(c, tr);
    move();
    drawLine();
    breakTime();
  }
  
  float tvar() {
    float x = map(lv, minvol, maxvol,4,10);
    return random(4,10);
  }
  
  void breakTime() {
    if(sections == limit){
      sunset = !sunset;
      sections = 0;
      ssp_i++;
    }
  }

  
  void drawLine(){

    float n = 40.0;    
    for(int i = 0; i < n; i++){
      line(x1, y1, x1 + ((1+i)*(x2-x1)/n), y1);
    }
    y1 = y2;
  }
  
}

void setupSunset() {
  frameRate(20);
  strokeCap(SQUARE);
  background(ssp_BG);
  strokeWeight(ssp_SW);

  orange = new Brush(random(height), 20, new color[] {#FF8E64, #FF581A,#FF733F,#FFAD8E,#FFD3C3,#FFBC64,#FFE5C3,#FFCE8E}, 30);
  black = new Brush(random(height), 40, new color[] {#000000}, 12);
}

void drawSunset() {
  if(sunset == true) {
    orange.paint();
  } else {
    black.paint();
  }
  if(ssp_i > ssp_limit) {
    sunsetpaint = false;
    setupTissue();
  }
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
}

void loudRestart() {
   if(( maxvol - lv <= range/6.0)&&repeated>random(3,6)){
     mybackground();
     repeated = 0;
   } else if(repeated++ > 1000) {
     maxvol = 0;
   }
}

float mapVol(float i){
  return map(i, minvol, maxvol, 0, 255);
}

void draw() {
  lv = in.left.get(0);
  rv = in.right.get(0);
  establishLimits();
  if(newman == true) {
    drawNewman();
  } else if(sunsetpaint == true) {
    drawSunset();
  } else if (tissue == true) {
    drawTissue();
  } else if(stainedglass == true) {
    drawStainedGlass();
  } else if(lineboxes == true) {
    drawLineBoxes();
  } else if(scribbler == true) {
    drawScribbler();
  }
}

void setup() {
  fullScreen();
  minim = new Minim(this);
  in = minim.getLineIn();
  setupNewman();
}