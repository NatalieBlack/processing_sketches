import java.lang.String;

PImage img;
int cindex = 0;
float nindex = 0;
String name;

PImage[] imgs = new PImage[20];
PImage[] blurred_imgs = new PImage[20];


color[] colours = {#0a1c20, #41a6de, #fedb0e, #f6343c, #471BAE, #FF6C41, #FFCB41, #515FE3};

String[] names = {"Sara Quin", "Tegan Quin", "Kristen Stewart", "Tyler Oakley", "Hannah Hart", "Chris Colfer", "Helen Marukh", "Korey Kuhl", "Ingrid Nilsen", "Troye Sivan", "Neil Patrick Harris", "Kathryn Moenig", "Ellen Degeneres", "Ellen Page"};

float hashMap(int h, float min, float max ) {
  //return map(h, -2147483648, 2147483647, min, max);
  return random(min, max);
}

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

void bubbles(int h, String n) {
  int index;
  pushMatrix();
  if (n.length() % 2 == 0) {
    index = abs(h)%imgs.length;
    img = imgs[index].copy();
  } else {
    index = abs(h)%imgs.length;
    img = blurred_imgs[index].copy();
  }
  float ii = hashMap(h, 0.25, 1.5);
  if (n.length() % 2 == 0) {
    img.resize(int(img.width*ii), int(img.height*ii)); 
    image(img, hashMap(h, -100, width), hashMap(h, -100, height));
  } else {
    scale(-1, 1);
    img.resize(int(img.width*ii), int(img.height*ii)); 
    image(img, hashMap(h, -width, 100), hashMap(h, -100, height));
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
  nindex = ((nindex + 1) % names.length);
  name = names[int(nindex)];
  println(name);
  int h = name.hashCode();
  String[] letters = name.split("");
  for(int j = 0; j < letters.length; j++) {
     bubbles(letters[j].hashCode(), name);
  }
  bubbles(h, name);
}

void nameBubbles(String n) {

}