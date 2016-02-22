import java.util.Arrays;
int SIZE = 600;
int tr = 100;
int SW;
float j,k = 0;
ArrayList<Float> exes = new ArrayList<Float>(Arrays.asList(random(0, SIZE), random(0, SIZE), random(0, SIZE), random(0, SIZE)));
ArrayList<Float> whys = new ArrayList<Float>(Arrays.asList(random(0, SIZE), random(0, SIZE), random(0, SIZE), random(0, SIZE)));
ArrayList<Float> prev_exes = new ArrayList<Float>();
ArrayList<Float> prev_whys = new ArrayList<Float>();
color[] colours = {color(255,0,0), color(0,255,0), color(0,0,0), color(0, 0, 255)};
boolean vertical = true;
boolean started;

void setup() {
  SW = 10;
  fill(0);
  strokeCap(SQUARE);
  surface.setSize(SIZE, SIZE);
  background(255);
  strokeWeight(SW);

}

void lines() {
  stroke(0, tr);
  strokeWeight(60);
  for(int i = 0; i < exes.size(); i++){
    float x = exes.get(i);
    stroke(colours[i], tr);
    line(x,0,x,((SIZE/600.0)*(j)));
  }
  j = (j + 1);
  if(j > 600) {
    j = 0;
    vertical = false;
  }
}

void lines2() {
  stroke(0, tr);
  strokeWeight(60);
  for(int i = 0; i < exes.size(); i++){
    float x = exes.get(i);
    stroke(colours[i], tr);
    line(x, 0, x, SIZE);
  }
  
  for(int i = 0; i < whys.size(); i++){
    float y = whys.get(i);
    stroke(colours[i], tr);
    line(0,y, ((SIZE/600.0)*(k)), y);
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
    exes.set(i, random(SIZE));
  }
}

void resetWhys() {
  for(int i = 0; i < whys.size(); i++){
    prev_whys.add(whys.get(i));
    whys.set(i, random(SIZE));
  }
}

void drawPrevs(){
  for(int j = 0; j < prev_whys.size()/4; j++) {    
    for(int i = 0; i < 4; i++){
      stroke(colours[i], tr);
      float x = prev_exes.get((j*4)+i);
      line(x, 0, x, SIZE);
    }
    
    for(int i = 0; i < 4; i++){
      stroke(colours[i], tr);
      float y = prev_whys.get((j*4)+i);
      line(0, y, SIZE, y);
    }
  }
}

void rects() {
  noStroke();
  fill(0, tr);
  rect(0, 50, SIZE, 50);
  fill(255,0,0, tr);
  rect(0, 150, SIZE, 50);
  fill(0, 255, 0,tr);
  rect(0, 350, SIZE, 50);
  fill(0,0,255,tr);
  rect(0, 500, SIZE, 50);
};


void mousePressed() {
  started = true;
}

void draw() {
  if(started){
    fill(255);
    stroke(255);
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