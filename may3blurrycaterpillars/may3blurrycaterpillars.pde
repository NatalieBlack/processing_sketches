int k, x,y;
color[] primary = {#94E750, #C9F6A3, #ACEF74, #7DDB2F, #5CBA0E};
color[] secondary = {#41BA86,  #98E6C4, #65D0A2, #24A870, #0B8F57};
color[] tertiary = {#FF8858, #FFC1A8, #FFA17C, #F66C35, #D14710};
color[] fourth = {#E8507E, #F7A3BC, #EF749A, #DC2F64, #BB0F43};
int WINDOWWIDTH, WINDOWHEIGHT;

void setup() {
  WINDOWWIDTH = 640;
  WINDOWHEIGHT = 360;

  size(WINDOWWIDTH, WINDOWHEIGHT);
  background(255);
  k = 0;
  x = 0;
  y = 0;


  
  int circlesize = 5;
  int circlenum = 800;

  noStroke();

 

}
void mousePressed() {
  fadedcircle(mouseX,mouseY, 100);
}

void fadedcircle(float x,float y,int s){
  for(float i = 1; i < 10; i++){
    ellipse(x,y,s*(1-i/10), s*(1-i/10));
  }
}

void draw() {
  fill(color(secondary[int(random(5))]),10);
  fadedcircle(x%WINDOWWIDTH,y%WINDOWHEIGHT, 100);
  x+=50;
  if(x%WINDOWWIDTH == 0){
    y+=50;
  }
  
}
