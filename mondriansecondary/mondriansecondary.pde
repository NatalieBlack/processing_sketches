int SIZE = 600;
int baset, tvar;
int SW;
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
  stroke(10);
 fill(255);
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
  SW = 10;
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
      mp();
      resetL();
  }
//    s1.scribble();
    //s2.scribble();
    strokeWeight(3);
    //line(20, 30, SIZE-20, 30);
    //line(SIZE-35, 20, SIZE-35, SIZE-25);
    //line(20, SIZE-25, 90, SIZE-25);
    //line(30, SIZE-90, 30, SIZE-10);
    noStroke();
        fill(255, 255, 0,1);

    rect(x1, y1, w1, h1);
        fill(255, 0, 255,1);

    rect(x2,y2,w2,h2);
        fill(0, 255, 255,1);

    rect(x3,y3,w3,h3);

    //strokeWeight(1.25);
    //triangle(SIZE*0.385, SIZE*0.465, SIZE*0.27, SIZE*0.465, SIZE*0.385, SIZE*0.58);
    //line(SIZE*0.385, SIZE*0.465, SIZE*0.385, SIZE*0.635);
    //triangle(0, 0, SIZE,0, SIZE, SIZE);
    //lines();
    noFill();
//    fill(255,1);
//    stroke(255, 1);
//
//
//    ellipse(SIZE*0.5,SIZE*0.5,50,50);
//        ellipse(SIZE*0.5,SIZE*0.5,40,40);
//            fill(255,10);
//
//            stroke(255, 10);
//
//        ellipse(SIZE*0.5,SIZE*0.5,30,30);
//        ellipse(SIZE*0.5,SIZE*0.5,20,20);
//        ellipse(SIZE*0.5,SIZE*0.5,10,10);
//                ellipse(SIZE*0.5,SIZE*0.5,5,5);
//
//

    //s3.scribble();

}