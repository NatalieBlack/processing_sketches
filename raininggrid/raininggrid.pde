import java.util.Arrays;
int SIZE = 600;
int tr = 100;
boolean started;
int SW, minSW, maxSW;
float j,k = 0;
ArrayList<Line> exes = new ArrayList<Line>();
ArrayList<Line> whys = new ArrayList<Line>();
ArrayList<Line> prev_exes = new ArrayList<Line>();
ArrayList<Line> prev_whys = new ArrayList<Line>();
color[] colours = {color(255,0,0), color(0,255,0), color(0,0,0), color(0, 0, 255)};
boolean vertical = true;

void setup() {
  fill(0);
  SW = 2;
  minSW = 2;
  maxSW = 2;
  strokeCap(SQUARE);
  surface.setSize(SIZE, SIZE);
  background(255);
  strokeWeight(SW);
  stroke(0, 75);


  for(int i = 0; i < 4; i++){
    exes.add(new Line(random(SIZE), true, colours[i]));
    whys.add(new Line(random(SIZE), false, colours[i]));
  }
}

void lines() {
  for(int i = 0; i < exes.size(); i++){
    Line l = exes.get(i);
    l.drawIt(j);  
  }
  j = (j + 1);
  if(j > 600) {
    j = 0;
    vertical = false;
  }
}

void lines2() {
  for(int i = 0; i < exes.size(); i++){
    Line l = exes.get(i);
    l.drawIt(SIZE);
  }
  
  for(int i = 0; i < whys.size(); i++){
    Line l = whys.get(i);
    l.drawIt(k);
  }
  k += 1;
  if(k > 600) {
    resetExes();
    resetWhys();
    k = 0;
    vertical = true;
  }
}

void resetExes() {
  for(int i = 0; i < exes.size(); i++){
    prev_exes.add(exes.get(i));
    exes.set(i, new Line(random(SIZE), true, colours[i]));
  }
}

void resetWhys() {
  for(int i = 0; i < whys.size(); i++){
    prev_whys.add(whys.get(i));
    whys.set(i, new Line(random(SIZE), false, colours[i]));
  }
}

void drawPrevs(){
  for(int j = 0; j < prev_whys.size()/4; j++) {    
    for(int i = 0; i < 4; i++){
      Line l = prev_exes.get((j*4)+i);
      l.drawIt(SIZE);
    }
    
    for(int i = 0; i < 4; i++){
      Line l = prev_whys.get((j*4)+i);
      l.drawIt(SIZE);
    }
  }
}

void draw() {
  if(started){
    fill(255);
    background(255);
    drawPrevs();
    if(vertical) {
    lines();
    } else {
      lines2();
    }
    noFill();
  } else {
    background(255);
    text("Click to start", SIZE*0.45, SIZE*0.5);
  }
}

void mousePressed() {
  started = true;
}

class Line {
  float pos;
  boolean vertical;
  float weight;
  color colour;
  
  Line(float pos, boolean vertical, color c){
    this.pos = pos;
    this.vertical = vertical;
    this.colour = c;
    float w;
    if(random(3) < 2) {
      w = 2;
    } else {
      w = random(minSW, maxSW);
    }
    this.weight = w;
  }
  
  void drawIt(float k){
    strokeWeight(weight);
    //stroke(colour, 75);
    if(vertical) {
      line(pos, 0, pos, ((SIZE/600.0)*(k)));

    } else {
      line(0,pos, ((SIZE/600.0)*(k)), pos);
    }
  }
}