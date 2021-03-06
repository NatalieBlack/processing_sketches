
Segment[] segs1 = new Segment[20];
Segment[] segs2 = new Segment[20];

void setup() {
  size(700, 400);
  strokeWeight(9);
  for(int i = 0; i < 10; i++){
    segs1[i] = new Segment('b',1, "hello world", i*10);
    segs2[i] = new Segment('b',1, "ah, the sea", i*10);
  }


}

void draw() {
  background(0);

 for(int i = 0; i < 10; i++){
    doYourThing(segs1[i]);
    doYourThing2(segs2[i]);
  }

}
class Segment{
  float offset;
  float[] xf;
  float[] yf;
float segLength;
char col;
float t;
char[] word;
   Segment(char col, int t, String w, float o){
     this.offset = o;
    this.xf = new float[w.length()];
    this.yf = new float[w.length()];
    this.segLength = 18;
    this.col = col;
    this.t = t;
    this.word = reverse(w.toCharArray());
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
  segment(xf[i], yf[i], angle, word[i]);
}

void segment(float xi, float yi, float a, char ch) {
  pushMatrix();
  translate((xi+t*100)%640, yi+offset);
  rotate(a);
  getNextColour(xi);
  //line(0, 0, segLength, 0);
  //ellipse(0,0,10,10);
  text(ch, 0, 0);
  popMatrix();
}
}
  
void doYourThing(Segment seg){
  float tx = map(sin(seg.t), -1, 1, 0, 640);
  float ty = map(cos(seg.t), -1, 1, 0, 360);

  seg.dragSegment(0, tx ,ty );

  seg.t += 0.01;
  for(int i=0; i<seg.xf.length-1; i++) {
    seg.dragSegment(i+1, seg.xf[i], seg.yf[i]);
  }
}
void doYourThing2(Segment seg){
  float tx = map(sin(seg.t), -1, 1, 0, 640);
  float ty = map(tan(seg.t), -1, 1, 0, 360);

    seg.dragSegment(0, tx ,ty );

  seg.t += 0.01;
  for(int i=0; i<seg.xf.length-1; i++) {
    seg.dragSegment(i+1, seg.xf[i], seg.yf[i]);
  }
}