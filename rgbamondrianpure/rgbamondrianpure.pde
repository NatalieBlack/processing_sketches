int SIZE = 600;
int baset, tvar;
int SW;
float j = 0;
float[] exes = {random(SIZE*0.25, SIZE*0.75), random(SIZE*0.25, SIZE*0.75), random(SIZE*0.25, SIZE*0.75), random(SIZE*0.25, SIZE*0.75)};
int i = 0;
float x1,x2,x3,y1,y2,y3,w1,w2,w3,h1,h2,h3;
int BG = 255;

void mousePressed() {
  mp();
}
void mp(){
 fill(255);
 //line(20, 30, SIZE-20, 30);
 //   line(SIZE-35, 20, SIZE-35, SIZE-25);
 //   line(20, SIZE-25, 90, SIZE-25);
 //   line(30, SIZE-90, 30, SIZE-10);

    rect(random(SIZE-100), random(SIZE-100),random(100,400), random(100,400));
    rect(random(SIZE-100), random(SIZE-100),random(100,400),random(100,400));

    rect(random(SIZE-100), random(SIZE-100),random(100,400),random(100,400));

    strokeWeight(1.25);
    //triangle(SIZE*0.385, SIZE*0.465, SIZE*0.27, SIZE*0.465, SIZE*0.385, SIZE*0.58);
    //line(SIZE*0.385, SIZE*0.465, SIZE*0.385, SIZE*0.635);
}

void setup() {
  SW = 10;
    stroke(30);

  strokeCap(SQUARE);
  surface.setSize(SIZE, SIZE);
  background(BG);
  //background(color(0,100,100, 1));
  strokeWeight(SW);
  baset = 5;
  tvar = 0;
//  s1 = new Scribbler(random(SIZE), random(SIZE), 60, 5);
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

void lines() {
  strokeWeight(2);
    for(int i = 0; i < exes.length; i++){
          float x = exes[i];

    line(x,SIZE*0.25,x,(SIZE*0.25+(SIZE*0.5/600.0)*j));
    }
    j = (j + 1);
    println(j);
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
  }
//    s1.scribble();
    //s2.scribble();
    strokeWeight(3);
    //line(20, 30, SIZE-20, 30);
    //line(SIZE-35, 20, SIZE-35, SIZE-25);
    //line(20, SIZE-25, 90, SIZE-25);
    //line(30, SIZE-90, 30, SIZE-10);
        fill(255, 0, 0,1);

    rect(x1, y1, w1, h1);
        fill(0, 255, 0,1);

    rect(x2,y2,w2,h2);
        fill(0, 0, 255,1);

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