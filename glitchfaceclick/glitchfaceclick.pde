PImage img;

void setup() {
  surface.setSize(800,800);
  img = loadImage("/home/natalie/Pictures/my face/me.jpg");
}

void mousePressed() {
  for(int i = 0; i < img.height; i++) {
          int r = int(random(-5,5));

    for(int j = 0; j < img.width; j++) {
      img.pixels[(i*img.width+j)] = img.pixels[min(max(i*img.width+j+r, 0), img.pixels.length - 1)];
    }
  }
  img.updatePixels();
  image(img,0,0);
}

void draw(){
}