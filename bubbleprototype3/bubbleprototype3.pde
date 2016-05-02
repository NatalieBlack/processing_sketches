import java.lang.String;

PImage img;
int cindex = 0;
float nindex = 0;
String name;

String[] vowels = {"a","e","i","o","u","A","E","I","O","U"};

PImage[] imgs;
PImage[] blurred_imgs;


color[] colours = {#0a1c20, #41a6de, #fedb0e, #f6343c, #471BAE, #FF6C41, #FFCB41, #515FE3};

String[] names = {"Alan Turing", "Laura Jane Grace", "Sara Quin", "Tegan Quin", "Kristen Stewart", "Tyler Oakley", "Hannah Hart", "Chris Colfer", "Helen Marukh", "Korey Kuhl", "Ingrid Nilsen", "Troye Sivan", "Neil Patrick Harris", "Kathryn Moenig", "Ellen Degeneres", "Ellen Page"};

void setup() {
  fullScreen();
  frameRate(10);
  loadImgs();
  PFont bangers = createFont("Bangers.ttf", 24);
  textFont(bangers);
  textAlign(CENTER, CENTER);
}
void loadImgs() {
  String[] fnames = {"bubble", "kapow", "kaboom", "blast1", "blast3", "blast2", "blast7", "blast4", "blast8", "blast5", "blast", "speech4", "speech1", "speech5", "speech3", "thought"};
  imgs = new PImage[fnames.length];
  blurred_imgs = new PImage[fnames.length];
  
  for (int i = 0; i < fnames.length; i++) {
    imgs[i] = loadImage("/home/natalie/nuitrose/" + fnames[i] + ".png");
    blurred_imgs[i] = blur(imgs[i]);
  }
  tint(255, 126);
}

boolean vowel(String n) {
  for(int i = 0; i < vowels.length; i++) {
    if(vowels[i] == n) {
      return true;
    }
  }
  return false;
}

void bubbles(int h, String n, String name) {
  float tr = map(("LGBTQ+" + n).hashCode(), -2147483648, 2147483647, 100,200);

  fill(0,0,0,tr);
 
  int index;
  float x, y;
  if (h >= 0 ) {
    index = abs(h)%imgs.length;
    img = imgs[index].copy();
  } else {
    index = abs(h)%imgs.length;
    img = blurred_imgs[index].copy();
  }
  float ii = hashMap(h, 0.25, 1.5);
  if (n.length() % 2 == 0) {

    img.resize(int(img.width*ii), int(img.height*ii)); 
    x = hpos(h, 0, width)-img.width/2;
    y = vpos(h, -100, height)-img.height/2;
    image(img, x, y);
    textSize(24*ii);
    text(name, hpos(h, 0, width), vpos(h, 0, height));
  } else {
      pushMatrix();

    scale(-1, 1);
    img.resize(int(img.width*ii), int(img.height*ii)); 
    popMatrix();
    x = hpos(h,0,width) - img.width/2;
    y = vpos(h, -100, height)-img.height/2;
    image(img, x, y);
    textSize(24*ii);
    text(name, hpos(h, 0, width), vpos(h, 0, height));
  }
}

void bubblesRepeat(int h, String n, String name){
    float tr = map(("LGBTQ+" + n).hashCode(), -2147483648, 2147483647, 100,200);

  fill(0,0,0,tr);
 
  int index;
  float x, y;
  if (h >= 0 ) {
    index = abs(h)%imgs.length;
    img = imgs[index].copy();
  } else {
    index = abs(h)%imgs.length;
    img = blurred_imgs[index].copy();
  }
  float ii = hashMap(h, 0.25, 1.5);
  if (n.length() % 2 == 0) {

    img.resize(int(img.width*ii), int(img.height*ii)); 
    for(int k = -1; k < width/(img.width/2.0);k++){
      for(int kk = -1; kk < height/(img.height/2.0);kk++){
              image(img, k*img.width/2.0, kk*img.height/2.0);

      }
    }
    textSize(24*ii);
    text(name, hpos(h, 0, width), vpos(h, 0, height));
  } else {
      pushMatrix();

    scale(-1, 1);
    img.resize(int(img.width*ii), int(img.height*ii)); 
    popMatrix();
    for(int k = -1; k < width/(img.width/2.0);k++){
      for(int kk = -1; kk < height/(img.height/2.0);kk++){
        image(img, k*img.width/2.0, kk*img.height/2.0);
      }
    }    textSize(24*ii);
    text(name, hpos(h, 0, width), vpos(h, 0, height));
  }
}

PImage blur(PImage pin) {
  PImage pout = pin.copy();
  for (int i = 0; i < 5; i++) {
    pout.resize(pin.width/10, pin.height/10);
    pout.resize(pin.width, pin.width);
  }
  return pout;
}

float hashMap(int h, float min, float max ) {
  return map(h, -2147483648, 2147483647, min, max);
}

float hpos(int h, float min, float max) {
  
  if(random(10) > 9) {
    float third = (max - min) * 0.33;
   
    if(h % 2 == 0) {
     third  = third * 2;
    }
    return min + map(h, -2147483648, 2147483647, third - 0.5, third + 0.5);  
  }  else {
     return random(min, max); 
  }
  
}

float vpos(int h, float min, float max) {
  
  if(random(10)>9){
    float third = (max - min) * 0.33;
    if(h % 2 == 0) {
     third  = third * 2;
    }
    return min + map(h, -2147483648, 2147483647, third - 0.5, third + 0.5);
  } else {
     return random(min, max); 
  }
}
void draw() {}

void mousePressed(){  
  background(colours[(cindex++/10)%colours.length]);
  nindex = ((nindex + 1) % names.length);
  name = names[int(nindex)];
  int h = name.hashCode();
  String[] letters = name.split("");
  for(int j = 0; j < letters.length - 1; j++) {
     bubbles((letters[j]+letters[j+1]).hashCode(), letters[j] + letters[j+1], letters[j]);
  }
  bubblesRepeat(h, name, "");
}