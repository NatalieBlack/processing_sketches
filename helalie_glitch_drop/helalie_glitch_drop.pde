PImage img;
boolean go = false;
int SIZE = 800;
float j = 0;
int smallPoint, largePoint;
int SW;
float minSW = 0.5;
float maxSW = 2.5;
int timer = 0;

int linenum = 28;

ArrayList<Line> exes = new ArrayList<Line>();
ArrayList<Line> whys = new ArrayList<Line>();

class Line {
  float xpos;
  float ypos;
  boolean vertical;
  float weight;
  color colour;
  int k;
  float sw;
  
  Line(float xpos, float ypos, boolean vertical, color c){
    this.xpos = xpos;
    this.ypos = ypos;
    this.vertical = vertical;
    this.colour = c;
    this.k = 0;
    this.sw = random(minSW, maxSW);
    float w;
    if(random(3) < 2) {
      w = 2;
    } else {
      w = random(minSW, maxSW);
    }
    this.weight = w;
  }
  
  void drawIt(){
    stroke(colour, 75);
    strokeWeight(sw);

    if(vertical) {
      line(xpos, ypos, xpos, ypos + ((SIZE/600.0)*(k)));

    } else {
      line(xpos,ypos, xpos + ((SIZE/600.0)*(k)), ypos);
    }
    k++;
  }
}

void setup() {
  surface.setSize(SIZE,SIZE);
  img = loadImage("/home/natalie/Pictures/helaliedoodleII.png");
  smallPoint = 4;
  largePoint = 20;
  background(255);
  noStroke();
}


void lines() {
  for(int i = 0; i < exes.size(); i++){
    Line l = exes.get(i);
    l.drawIt();  
  }
    for(int i = 0; i < whys.size(); i++){
    Line l = whys.get(i);
    l.drawIt();  
  }
  //j = (j + 1);
  //if(j > 600) {
  //  resetExes();
   //j = 0;
  //}
}

void mousePressed() {
 glitch();
}

void glitch() {
   for(int i = 0; i < img.height; i++) {
          int r = int(random(-5,5));

    for(int j = 0; j < img.width; j++) {
      img.pixels[(j*img.height+i)] = img.pixels[min(max(j*img.height+i+r, 0), img.pixels.length - 1)];
    }
  }
  img.updatePixels();
  image(img,0,0);
}

void keyPressed() {
  if(key == ' '){
    go = true;
        int x = int(random(img.width));
    int y = int(random(img.height));
    color pix = img.get(x, y);

    int a = int(random(img.width));
    int b = int(random(img.height));
    color pix2 = img.get(a, b);

    exes.add(new Line(x, y,  true, pix));
    whys.add(new Line(a, b, false, pix2));
  }
}
void draw() {
  if(go){

    lines();
  } else {
    if(timer % 30 == 0) {
      glitch();
    }
    timer++;

  }
}