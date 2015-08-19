/**
 * Alpha Mask. 
 * 
 * Loads a "mask" for an image to specify the transparency 
 * in different parts of the image. The two images are blended
 * together using the mask() method of PImage. 
 */

// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="moonwalk.jpg,mask.jpg"; */ 

PImage img;
PImage imgMask;
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
  imgMask = loadImage("mask.jpg");
    img = createImage(imgMask.width, imgMask.height, ARGB);

  int stop1 = img.pixels.length / 1;
  int stop2 = img.pixels.length * 2/3;

  for(int i = 0; i < stop1; i++) {
    float a = map(i, 255, img.pixels.length, 255, 100);
    int g = 255 / (i%3 + 1);
    img.pixels[i] = color(g, 100, 255,200);//,map(i%imgMask.width, 0, imgMask.width-1, 0, 255)); 
  }
  
  int circlesize = 5;
  int circlenum = 800;

  //image(img,0,0);
  noStroke();
  //img.mask(imgMask);
  //imageMode(CENTER);
 

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
  while(y < WINDOWHEIGHT){
  fill(color(secondary[int(random(5))]),10);
  fadedcircle(x%WINDOWWIDTH,y%WINDOWHEIGHT, 100);
  x+=50;
  if(x%WINDOWWIDTH == 0){
    y+=50;
  }
  }
}
