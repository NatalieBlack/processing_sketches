
Segment seg;
Segment seg2;

void setup() {
  size(700, 400);
  strokeWeight(9);
  seg = new Segment('b',1);
  seg2 = new Segment('g',1);

}

void draw() {
  background(0);

  doYourThing(seg);
   doYourThing2(seg2);

}
class Segment{
  float[] xf;
  float[] yf;
float segLength;
char col;
float t;
   Segment(char col, int t){
    this.xf = new float[10];
    this.yf = new float[10];
    this.segLength = 18;
    this.col = col;
    this.t = t;
   }
void getNextColour(float x){
  if(col == 'b'){
      stroke(color(10,200,map(x, 0, 640, 0, 255), 100));
  } else if (col == 'r'){
      stroke(color(map(x, 0, 640, 0, 255), 10,200,100));

  } else {
      stroke(color(10,map(x, 0, 640, 0, 255), 200,100));

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
  //pushMatrix();
  translate(xi, yi);
  rotate(a);
  getNextColour(xi);
  //line(0, 0, segLength, 0);
  ellipse(0,0,10,10);
  //popMatrix();
}
}
  
void doYourThing(Segment seg){
  float tx = map(sin(seg.t), -1, 1, 0, 640);
    float ty = map(cos(seg.t), -1, 1, 0, 360);

    seg.dragSegment(0, tx ,ty );

  seg.t += 0.05;
  for(int i=0; i<seg.xf.length-1; i++) {
    seg.dragSegment(i+1, seg.xf[i], seg.yf[i]);
  }
}
void doYourThing2(Segment seg){
  float tx = map(sin(seg.t), -1, 1, 0, 640);
    float ty = map(tan(seg.t), -1, 1, 0, 360);

    seg.dragSegment(0, tx ,ty );

  seg.t += 0.05;
  for(int i=0; i<seg.xf.length-1; i++) {
    seg.dragSegment(i+1, seg.xf[i], seg.yf[i]);
  }
}