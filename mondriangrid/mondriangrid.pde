int SIZE = 600;
int baset, tvar;
float SW;
float j = 0;
float[] exes = {random(SIZE*0.25, SIZE*0.75), random(SIZE*0.25, SIZE*0.75), random(SIZE*0.25, SIZE*0.75), random(SIZE*0.25, SIZE*0.75)};
int i = 0;
float x1,x2,x3,y1,y2,y3,w1,w2,w3,h1,h2,h3;
int BG = 255;
float[] verticals = {random(SIZE), random(SIZE), random(SIZE)};
float[] horizontals = {random(SIZE), random(SIZE), random(SIZE)};

void mousePressed() {
  mp();
}
void mp(){
 fill(255);
 stroke(30, 50);

 for(int i = 0; i < verticals.length; i++) {
   drawVertical(verticals[i]);
 }
  for(int i = 0; i < horizontals.length; i++) {
   drawHorizontal(horizontals[i]);
 }

}

void resetL(){
 for(int i = 0; i < verticals.length; i++) {
   verticals[i] = random(SIZE);
 }
  for(int i = 0; i < horizontals.length; i++) {
   horizontals[i] = random(SIZE);
 }
}

void drawVertical(float x) {

  line(x, 0, x, SIZE);
}
  
  
void drawHorizontal(float y) {

  line(0, y, SIZE, y);
}
  


void setup() {
  SW = 0.5;
  strokeCap(SQUARE);
  surface.setSize(SIZE, SIZE);
  background(BG);
  strokeWeight(SW);
  x1 = random(SIZE);
  x2 = random(SIZE);
  x3 = random(SIZE);
  y1 = random(SIZE);
  y2 = random(SIZE);
  y3 = random(SIZE);
  w1 = random(100,250);
  w2 = random(100,250);
  w3 = random(100,250);
  h1 = random(100,250);
  h2 = random(100,250);
  h3 = random(100,250);
}


void draw() {    
  
  if(i++==255){
      i = 0;
      background(BG);
      x1 = random(SIZE-100);
      x2 = random(SIZE-100);
      x3 = random(SIZE-100);
      y1 = random(SIZE-100);
      y2 = random(SIZE-100);
      y3 = random(SIZE-100);
      w1 = random(100,400);
      w2 = random(100,400);
      w3 = random(100,400);
      h1 = random(100,400);
      h2 = random(100,400);
      h3 = random(100,400);
      resetL();
        mp();

  }
noStroke();
        fill(255, 0, 0,1);

    rect(x1, y1, w1, h1);
        fill(0, 255, 0,1);

    rect(x2,y2,w2,h2);
        fill(0, 0, 255,1);

    rect(x3,y3,w3,h3);


    noFill();


}