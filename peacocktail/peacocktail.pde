

int i;
color[] colours = {#081261, #F2D913, #30cfaf, #9BE0D2, #FFFFFF};
color COLOUR;
int WINDOWSIZE;
color BGCOLOUR;
int SW;

void setup() {
  frameRate(10);
  WINDOWSIZE = 495;
  BGCOLOUR = 200;
  SW = 2;
  size(WINDOWSIZE, WINDOWSIZE);

  imageMode(CENTER);
  noStroke();
  background(BGCOLOUR);
  i = 0;

  COLOUR = colours[i];
  noFill();
  strokeWeight(SW);
}

void mousePressed() {
    
    background(BGCOLOUR);
}     

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void draw() { 
    int a = int(random(75,WINDOWSIZE-10));
   
    stroke(COLOUR);
    sketchyCircle(a); 

    COLOUR = getNextColour();
}

void sketchyCircle(int x1){
  
beginShape();
vertex(x1,x1);
bezierVertex(x1, x1, x1, 30, 30, 30);
//bezierVertex(50, 80, 60, 25, 30, 20);
endShape();
}

