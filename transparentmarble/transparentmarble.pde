float a;                 // Angle of rotation
float offset = PI/24.0;  // Angle offset between boxes
int num = 12;            // Number of boxes
color[] COLOURS = {#9BE0D2,#9BE0D2, #CBF4EC,#CBF4EC, #F5FEFC,#F5FEFC};
int i;
void setup() { 
  size(640, 490, P3D);
  noStroke();
i = 0;  
} 
 

color getNextColour(){
  i++;
  return color(COLOURS[i%COLOURS.length], 5);
}

void draw() {
  
  lights();
  
  background(0, 0, 26);
  translate(width/2, height/2); 
  
  for(int i = 0; i < num; i++) {
    float gray = map(i, 0, num-1, 0, 255);
    pushMatrix();
    fill(getNextColour());
    rotateY(a + offset*i);
    rotateX(a/2 + offset*i);
    sphere(200);
    popMatrix();
  }
  
  a += 0.01;    
} 
