PImage img, img2, img3, img4, img5;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
color COLOUR;
int i;
int WINDOWSIZE;

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void setup() {
  WINDOWSIZE = 675;
  size(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  strokeWeight(1);
  stroke(#FFFFFF);
  fill(255, 10);

  mybackground();
}
void mybackground() {
  background(255);
 
}

void mousePressed(){
  if(coinToss()){
    mybackground();
  } else {
    sketchyCircle();
  }
}

void draw() {

}

boolean coinToss(){
  return int(random(50)) == 1; 
}

void sketchyCircle(){
  beginShape();
  int x1 = int(random(WINDOWSIZE));
  int y1 = int(random(WINDOWSIZE));
  color colour = getNextColour();
  fill(colour, random(10,50));
  stroke(colour);
  

  vertex(mouseX,mouseY);

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(100)), x1, x1, int(random(WINDOWSIZE)));

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1, y1, int(random(WINDOWSIZE)));

  endShape();
  


}
