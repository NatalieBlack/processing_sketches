int k, x,y;
color[] primary = {#94E750, #C9F6A3, #ACEF74, #7DDB2F, #5CBA0E};
color[] secondary = {#41BA86,  #98E6C4, #65D0A2, #24A870, #0B8F57};
color[] tertiary = {#FF8858, #FFC1A8, #FFA17C, #F66C35, #D14710};
color[] fourth = {#E8507E, #F7A3BC, #EF749A, #DC2F64, #BB0F43};
int WINDOWWIDTH, WINDOWHEIGHT;
float blue, green, red, blueboost, greenboost, redboost;
float maxsat;
void setup() {
  WINDOWWIDTH = 700;
  WINDOWHEIGHT = 350;
  red = random(50,200);
  blue = random(50,200);
  green = random(50,200);
  surface.setSize(WINDOWWIDTH, WINDOWHEIGHT);
  background(255);
  k = 0;
  x = 0;
  y = 0;

  noStroke();
  maxsat = 200;
 

}

void fadedcircle(float x,float y,int s){
  //for(float i = 1; i < 10; i++){
    rect(x,y,s, s);
  //}
}
color getColour() {
  red = random(red - 30, min(red + 30, 200)) + redboost;
  blue = random(blue - 50, min(blue + 50, 200)) + blueboost;
  green = random(green - 50, min(green + 50, 200)) + greenboost;
  return color(red, green, blue);
}
void keyPressed() {
  if(key == 'b'){
    blueboost += 10;
  } else if(key == 'g') {
    greenboost += 10;
  } else if(key == 'r') {
    redboost += 10;
  } else if(key == ' ') {
    blueboost = greenboost = redboost = 0;
  } else if(key == '1') {
    red = random(50,200);
    blue = random(50,200);
    green = random(50,200);  
    blueboost = greenboost = redboost = 0;
    } else if(key == '=') {
       redboost += 10;
       blueboost += 10;
       greenboost += 10;
    } else if(key == '-') {
       redboost -= 10;
       blueboost -= 10;
       greenboost -= 10;
    }
}
void draw() {
  
  fill(getColour(),10);
  fadedcircle(x%WINDOWWIDTH,y%WINDOWHEIGHT, 100);
  x+=50;
  if(x%WINDOWWIDTH == 0){
    y+=100;
  }
  
}