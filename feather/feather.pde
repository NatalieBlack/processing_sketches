

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
    int a = int(random(100,WINDOWSIZE-10));
    int b = int(random(WINDOWSIZE-10));
   
    stroke(COLOUR);
    sketchyCircle(a,b); 

    COLOUR = getNextColour();
}

void sketchyCircle(int x1, int y1){
  
beginShape();
vertex(x1,min(WINDOWSIZE-10,max(x1+10,y1)+random(-20,25)));
bezierVertex(x1, x1, x1, 75, 30, 75);
//bezierVertex(50, 80, 60, 25, 30, 20);
endShape();
}

