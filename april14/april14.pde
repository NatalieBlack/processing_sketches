PImage img, img2, img3, img4, img5;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
color COLOUR;
int i,j;
int WINDOWSIZE;
boolean started;

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void setup() {
  frameRate(20);
  started = false;
  noStroke();
  WINDOWSIZE = 800;
  size(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  j = 0;
  strokeWeight(1);
 
  mybackground();
  text("Click!",WINDOWSIZE/2,WINDOWSIZE/2);
  fill(255, 10);


}
void mybackground() {
  background(0);
 
}

void mousePressed(){
  if(!started){
        started = true;
  }
  mybackground();
}

void draw() {
  if(started){
    if(j % 50 == 1) {
       mybackground();

    }else{
       sketchyCircle();

    }
  }
  j++;
}
void sketchyCircle(){
  beginShape();
  int x1 = int(random(500 - 100, 500));
  int y1 = int(random(0, 100));
  fill(getNextColour(), 10);

  vertex(mouseX,mouseY);

  bezierVertex(int(random(100)), int(random(100)), int(random(100)), x1, x1, 200);

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1, y1, int(random(WINDOWSIZE)));

  endShape();
  
  beginShape();
  vertex(mouseX-10,mouseY-10);
  
  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), x1, int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1);

  endShape();

}
