PImage img;

void setup() {
  surface.setSize(2000,2000);
  img = loadImage("/home/natalie/Pictures/my face/me.jpg");
}

void mousePressed() {
  for(int i = 0; i < img.height; i++) {
    for(int j = 0; j < img.width; j++) {
      int r = int(random(-10,10));
      img.pixels[(i*img.width+j)] = img.pixels[min(max(i*img.width+j+r, 0), img.pixels.length - 1)];
    }
  }
  img.updatePixels();
  image(img,0,0);
}

void draw(){
}