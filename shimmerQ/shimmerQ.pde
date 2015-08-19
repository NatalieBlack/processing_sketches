int WINDOWSIZE;
int BG;

void setup(){
  BG = 0;
  WINDOWSIZE = 500;
  size(WINDOWSIZE, WINDOWSIZE);
  background(BG);
  stroke(255);
  frameRate(10 );
  strokeCap(SQUARE);

}

void draw() {
  beginShape();

  int qsize = 100;
  noStroke();
  color c = color(0,int(random(255)), 100);
  stroke(c, 10);
  strokeWeight(10);
  noFill();
  ellipse(WINDOWSIZE/2, WINDOWSIZE/2,qsize,qsize);
  line(WINDOWSIZE/2 + qsize*0.37, WINDOWSIZE/2+qsize*0.41, WINDOWSIZE/2 + qsize*0.45, WINDOWSIZE/2 + qsize*0.5);
  endShape();

}
