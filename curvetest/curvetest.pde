void setup(){
  size(600,600);
  noFill();
  stroke(0);
}
void draw() {
  float x1 = 100;
  float y1 = 100;
  PShape s = createShape();
  s.beginShape();
    s.vertex(10, 10);
    s.quadraticVertex(10, 40, 80, 40);
    s.quadraticVertex(40, 30, 50, 5);

    //s.vertex(20,10);
  s.endShape();
  shape(s,100,100);
}