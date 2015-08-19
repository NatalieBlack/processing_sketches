PImage img, img2, img3, img4, img5;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
color COLOUR;
int i,j;
boolean started;
int WINDOWSIZE;

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void setup() {
  WINDOWSIZE = 675;
  size(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  j = 0;
  strokeWeight(1);
  stroke(#FFFFFF);
  fill(0);
 started = false;
  mybackground();
    text("Keep clicking!",WINDOWSIZE/2,WINDOWSIZE/2);
  fill(255, 10);

}
void mybackground() {
  background(255);
}

void mousePressed(){
  if(!started){
    started = true;
    mybackground();
  }
  if(j == 5){
    mybackground();
    j = 0;
  } else {
    sketchyCircle();
    j++;
  }
}

void draw() {
  //if(coinToss()){
  //  mybackground();
  //} else {
  //  sketchyCircle();
  //}
}

boolean coinToss(){
  return int(random(50)) == 1; 
}

void sketchyCircle(){
  beginShape();
  int x1 = int(random(WINDOWSIZE));
  int y1 = int(random(WINDOWSIZE));
  color colour = getNextColour();
  fill(colour, random(10,100));
  stroke(colour);
  

  vertex(x1,y1);
  //bezierVertex(0, 0, WINDOWSIZE, x1, y1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, y1, x1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, x1, x1, WINDOWSIZE);
  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(100)), x1, x1, int(random(WINDOWSIZE)));

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1, y1, int(random(WINDOWSIZE)));
  //bezierVertex(0, 0, x1, WINDOWSIZE, WINDOWSIZE, y1);

  endShape();
  
  beginShape();
  //vertex(int(random(WINDOWSIZE)),int(random(WINDOWSIZE)));
  //bezierVertex(0, 0, WINDOWSIZE, x1, y1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, y1, x1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, x1, x1, WINDOWSIZE);
  //bezierVertex(0, 0, WINDOWSIZE, x1, x1, WINDOWSIZE);

  //bezierVertex(0, 0, WINDOWSIZE, y1, y1, WINDOWSIZE);
  //bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), x1, int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1);

  endShape();

}
