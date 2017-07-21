int s = 800;
color[][] pixels = new color[s][s];

void setup() {
  surface.setSize(s,s);
  setPixels();
}

void setPixels() {
  for(int i = 0; i < s; i++){
      for(int j = 0; j < s; j++){
      }
  }
}

void mousePressed() {
  for(int i = 0; i < height; i++) {
          int r = int(random(-5,5));

    for(int j = 0; j < width; j++) {
      img.pixels[(j*height+i)] = img.pixels[min(max(j*img.height+i+r, 0), img.pixels.length - 1)];
    }
  }
  img.updatePixels();
  image(img,0,0);
}

void draw(){
}