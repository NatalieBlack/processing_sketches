PImage img;
int cindex = 0;

PImage[] imgs = new PImage[20];
PImage[] blurred_imgs = new PImage[20];


color[] colours = {#0a1c20, #41a6de, #fedb0e, #f6343c, #471BAE, #FF6C41, #FFCB41, #515FE3};

void setup() {
  fullScreen();
  stroke(255);
  frameRate(10);
  noFill();
  loadImgs();
}

void loadImgs() {
  String[] fnames = {"bubble", "kapow", "kaboom", "blast", "blast0", "blast1", "blast2", "blast3", "blast4", "blast5", "blast6", "blast7", "blast8", "speech", "speech1", "speech2", "speech3", "speech4", "speech5", "thought"};
  for (int i = 0; i < fnames.length; i++) {
    imgs[i] = loadImage("/home/natalie/nuitrose/" + fnames[i] + ".png");
    blurred_imgs[i] = blur(imgs[i]);
  }
  tint(255, 126);
}

void bubbles() {
  pushMatrix();
  if (int(random(6)) > 1) {
    img = imgs[int(random(imgs.length))].copy();
  } else {
    img = blurred_imgs[int(random(blurred_imgs.length))].copy();
  }
  float ii = random(0.25, 1.5);
  if (int(random(2)) == 1 ) {
    img.resize(int(img.width*ii), int(img.height*ii)); 
    image(img, random(-100, width), random(-100, height));
  } else {
    scale(-1, 1);
    img.resize(int(img.width*ii), int(img.height*ii)); 
    image(img, random(-width, 100), random(-100, height));
  }
  popMatrix();
}

PImage blur(PImage pin) {
  PImage pout = pin.copy();
  for (int i = 0; i < 5; i++) {
    pout.resize(pin.width/10, pin.height/10);
    pout.resize(pin.width, pin.width);
  }
  return pout;
}

void draw() {  
  background(colours[(cindex++/10)%colours.length]);
  for (int i = 0; i < 5; i++) {
    bubbles();
  }
  //loadImgs();
}