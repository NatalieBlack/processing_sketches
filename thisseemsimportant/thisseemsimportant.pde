void setup(){
  size(600,600);
}

void draw(){
  background(0);
  beginShape();
  arc(50, 50, 80, 80, 0+random(-5,5), PI,PIE);
  endShape();
}