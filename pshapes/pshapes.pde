PShape s1;
void setup() {
  size(600,600);
  noFill();
}

//y = xcircle + (r * sine(angle))
//x = ycircle + (r * cosine(angle))
void draw() {

   s1 = createShape(ARC,100,100, 100,100, 0.25, 2*PI);
   float y1 = 100 + (50 * sin(0.25));
   float x1 = 100 + (50 * cos((0.25)));
   float y2 = 100 + (50 * sin((2*PI)));
   float x2 = 100 + (50 * cos((2*PI)));

    pushMatrix();
      translate(100,100);
      rotate(radians(45));
      stroke(0,0,255);
      //shape(s1,0,0);
      stroke(255,0,0);
      curve(100, 100, x1,y1, x1, y1, 60, 120);

    popMatrix();
}