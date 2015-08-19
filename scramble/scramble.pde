PImage img;
int smallPoint, largePoint;

void setup() {
  size(640, 360);
  img = loadImage("/home/natalie/Pictures/helaliedoodleII.png");
  smallPoint = 4;
  largePoint = 20;
  imageMode(CENTER);
  noStroke();
  background(255);
}

void draw() { 
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 128);
  int a = int(random(img.width));
  int b = int(random(img.height));
  ellipse(a, b, pointillize, pointillize);
}


