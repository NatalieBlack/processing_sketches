float a;                 // Angle of rotation
float offset = PI/24.0;  
int num = 12;            
color[] COLOURS = {
  color(155, 224, 210), color(155, 224, 210), color(203, 244, 236), color(203, 244, 236), color(245, 254, 252), color(255)
};
int i;

void setup() { 
  fullScreen(P3D);
  noStroke();
  i = 0;
  frameRate(13);
} 
  
color getNextColour() {
  i++;
  return COLOURS[i%COLOURS.length];
}

void draw() {
  background(0, 0, 26);
  translate(width/2, height/2); 

  for (int i = 0; i < num; i++) {
    pushMatrix();
    color c = getNextColour();
    fill(red(c), green(c) + random(-5,10), blue(c)+random(-5,5));
    rotateY(a + offset*i);
    rotateX(a/2 + offset*i);
    sphere(height*0.7816326530612245);
    popMatrix();
  }
  
  a += 0.01;
} 