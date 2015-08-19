PImage img, img2, img3, img4, img5;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
color COLOUR;
int i;
int WINDOWSIZE;

color getNextColour(){
  i++;
  int b = int(random(150,255));
  int r = int(random(0,100));
  int g = int(random(0,100));
  return color(r,g,b);
}

void setup() {
  frameRate(20);
  WINDOWSIZE = 700;
  size(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  noStroke();
  mybackground();
  fill(0);
  text("Click!",WINDOWSIZE/2,WINDOWSIZE/2);
  fill(255, 10);
  for(int i = 0; i < 500; i++){
    sketchyCircle();
  }
}
void mybackground() {
  background(0);
}

void mousePressed(){

    mybackground();

}

void draw() {
  sketchyCircle();
}

boolean coinToss(){
  return int(random(10)) == 1; 
}

void sketchyCircle(){
  beginShape();
  int x1 = int(random(WINDOWSIZE));
  int y1 = int(random(WINDOWSIZE));

  fill(getNextColour(), 10);
  

  vertex(x1,y1);

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(100)), x1, x1, int(random(WINDOWSIZE)));

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1, y1, int(random(WINDOWSIZE)));

  endShape();
  
 

}
