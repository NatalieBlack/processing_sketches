PImage img0,img1,img2, img;
int cindex = 0;
int t = 0;
int f = 0;
PImage[] imgs = new PImage[3];

color[] colours = {#0a1c20, #41a6de, #fedb0e, #f6343c,#471BAE,#FF6C41,#FFCB41,#515FE3};

void setup(){
fullScreen();
stroke(255);
  frameRate(10);
  noFill();
  img0 = loadImage("/home/natalie/Desktop/bubble.png");
  img1 = loadImage("/home/natalie/Desktop/kapow.png");
  img2 = loadImage("/home/natalie/Desktop/kaboom.png");
  imgs[0] = img0;
  imgs[1] = img1;
  imgs[2] = img2;
  tint(255, 126);
}

void bubbles() {
  pushMatrix();
  img = imgs[int(random(3))];
  float i = random(-1.5,1.5);
  if(int(random(2)) == 1 ){
    t++;
    scale(i); 
    image(img, random(-100,500), random(-100,500));
  } else {
    f++;
    scale(-i,i);
   image(img,random(-300,0)-img.width,random(-100,500));
  }
  popMatrix();
}

void draw(){  
  background(colours[(cindex++/10)%colours.length]);
  for(int i = 0; i < 5;i++){
    bubbles();
  }
}