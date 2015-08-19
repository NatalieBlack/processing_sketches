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

void setup() {
  size(640, 360);
  imgMask = loadImage("mask.jpg");

  img = createImage(imgMask.width, imgMask.height, ARGB);
  for(int i = 0; i < img.pixels.length; i++) {
    float a = map(i, 255, img.pixels.length, 255, 100);
    img.pixels[i] = color(0, a, a); 
  }
  img.mask(imgMask);
  imageMode(CENTER);
}

void draw() {
  background(255);
  //image(img, width/2, height/2);
  image(img, mouseX, mouseY);
}
