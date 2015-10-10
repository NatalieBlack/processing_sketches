
Segment seg;
Segment seg2;
int SIZE;

void setup() {
  frameRate(40);
  SIZE = 660;
  size(SIZE, SIZE);
  strokeWeight(9);
  seg = new Segment('b',1,5);
  seg2 = new Segment('g',1,8);
  for(int i = 0; i < 15;i++){
  doYourThing(seg);
  }
 
  background(225);
}

void draw() {
  doYourThing(seg);
  doYourThing2(seg2);

}
class Segment{
  float[] xf;
  float[] yf;
float segLength;
char col;
float t;
float jig;
   Segment(char col, int t, float jig){
    this.xf = new float[10];
    this.yf = new float[10];
    this.segLength = 18;
    this.col = col;
    this.t = t;
    this.jig = jig;
   }
void getNextColour(float x){
  color colour;
  if(col == 'b'){
    colour = color(10,200,map(x, 0, SIZE, 150, 255), 10);
      stroke(colour);
      fill(colour);
  } else if (col == 'r'){
      colour = color(map(x, 0, SIZE, 150, 255), 10,200,10);
      stroke(colour);
      fill(colour);

  } else {
      colour = color(10,map(x, 0, SIZE, 0, 255), 200,10);
      stroke(colour);
      fill(colour);

  }
}
void dragSegment(int i, float xin, float yin) {
  float dx = xin - xf[i];
  float dy = yin - yf[i];
  float angle = atan2(dy, dx);  
  xf[i] = xin - cos(angle) * segLength;
  yf[i] = yin - sin(angle) * segLength;
  segment(xf[i], yf[i], angle);
}

void segment(float xi, float yi, float a) {
  pushMatrix();
  translate(xi+random(1-jig,jig), yi+random(1-jig,jig));
  rotate(a);
  getNextColour(xi);
  //line(0, 0, segLength, 0);
  ellipse(0,0,10,10);
  popMatrix();
}
}
  
void doYourThing(Segment seg){
  float tx = map(sin(seg.t), -1, 1, 10, SIZE - 10);
    float ty = map(cos(seg.t), -1, 1, 10, SIZE - 10);

    seg.dragSegment(0, tx ,ty );

  seg.t += 0.3;
  for(int i=0; i<seg.xf.length-1; i++) {
    seg.dragSegment(i+1, seg.xf[i], seg.yf[i]);
  }
}
void doYourThing2(Segment seg){
  float tx = map(sin(seg.t), -1, 1, 10, SIZE-10);
  float ty = map(tan(seg.t), -1, 1, 10, SIZE-10);

  seg.dragSegment(0, tx ,ty );

  seg.t += 0.3;
  for(int i=0; i<seg.xf.length-1; i++) {
    seg.dragSegment(i+1, seg.xf[i], seg.yf[i]);
  }
}
