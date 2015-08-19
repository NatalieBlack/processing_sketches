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
int k;


void setup() {
  color[] primary = {color(#94E750), color(#C9F6A3), color(#ACEF74), color(#7DDB2F), color(#5CBA0E)};
color[] secondary = {color(#41BA86),  color(#98E6C4), color(#65D0A2), color(#24A870), color(#0B8F57)};
color[] tertiary = {color(#FF8858), color(#FFC1A8), color(#FFA17C), color(#F66C35), color(#D14710)};
color[] fourth = {color(#E8507E), color(#F7A3BC), color(#EF749A), color(#DC2F64), color(#BB0F43)};
  size(640, 360);
  background(255);
  k = 0;
  imgMask = loadImage("mask.jpg");
    img = createImage(imgMask.width, imgMask.height, ARGB);

  int stop1 = img.pixels.length / 1;
  int stop2 = img.pixels.length * 2/3;

  for(int i = 0; i < stop1; i++) {
    float a = map(i, 255, img.pixels.length, 255, 100);
    int g = 255 / (i%3 + 1);
    img.pixels[i] = color(g, 100, 255,200);//,map(i%imgMask.width, 0, imgMask.width-1, 0, 255)); 
  }
  
  int circlesize = 150;
  int circlenum = 800;

  //image(img,0,0);
  noStroke();
  //img.mask(imgMask);
  //imageMode(CENTER);
  for(int k = 0; k < circlenum; k++){
    fill(tertiary[(int(random(4)))],10);

  fadedcircle(random(640),random(360), circlesize);
  }

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

}
