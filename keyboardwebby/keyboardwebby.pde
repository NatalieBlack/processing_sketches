PImage img, img2, img3, img4, img5;
int k;
color[] colours = {color(0, 255, 255), color(0, 153, 255), color(0, 255, 200)};
int WINDOWSIZE;
int MINX, MAXX, MINY, MAXY;
int moveamount;
int green, red, blue;

void setup() {
  WINDOWSIZE = 700;
  green = red = blue;
  moveamount = 20;
  size(WINDOWSIZE,WINDOWSIZE); 
  frameRate(20);
  strokeWeight(1);
  stroke(#FFFFFF, 10);
  noFill();
  
 
  mybackground();
}
void mybackground() {
  background(0);
  
 
}

void mousePressed(){
  mybackground();
}
color getNextColour(){
  k++;
  color c;
  switch(k % 3) {
    case 0:
      c = color(0+red, int(random(255))+green, int(random(255))+blue);
    case 1:
      c = color(0+red, 153+green, int(random(255))+blue);
    default:
      c = color(0+red, int(random(255))+green, 200+blue);
  }
  return c;
}
void draw() {
  
  sketchyCircle(getNextColour());
}
void sketchyCircle(color c){
  stroke(c,10);
  beginShape();
  fill(c, 1);
  int x1 = int(random(MINX, MAXX));
  int y1 = int(random(MINY, MAXY));

  vertex(x1,y1);
  
  bezierVertex(int(random(MINX,MAXX)), int(random(MINY,MAXY)), int(random(MINX,MAXX)), x1, x1, int(random(MINY,MAXY)));


  endShape();
  
  beginShape();
  vertex(x1,y1);

  bezierVertex(int(random(MINX,MAXX)), int(random(MINY,MAXY)), int(random(MINX,MAXX)), x1, x1, int(random(MINY,MAXY)));

  endShape();

}

void keyPressed() {
if(key == 'q'){
  MINX = 0;
  MAXX = WINDOWSIZE / 2;
  MINY = 0;
  MAXY = WINDOWSIZE /2;
} else if(key == 'p'){
  MINY = 0;
  MAXY = WINDOWSIZE / 2;
  MINX = WINDOWSIZE /2;
  MAXX = WINDOWSIZE;
}
 else if(key == 'z'){
   MINX = 0;
  MAXX = WINDOWSIZE / 2;
  MINY = WINDOWSIZE /2;
  MAXY = WINDOWSIZE;
}
 else if(key == 'm'){
   MINX = WINDOWSIZE /2;
  MAXX = WINDOWSIZE;
   MINY = WINDOWSIZE /2;
  MAXY = WINDOWSIZE;
}else if(key == 'f'){
   MINX = WINDOWSIZE /3;
  MAXX = WINDOWSIZE*2/3;
   MINY = WINDOWSIZE /3;
  MAXY = WINDOWSIZE*2/3;
}else if(key == 'l'){
   MINX = MINX+moveamount;
  MAXX = MAXX+moveamount;
   
}else if(key == 'h'){
   MINX = MINX-moveamount;
  MAXX = MAXX-moveamount;
   
}else if(key == 'k'){
   
   MINY = MINY-moveamount;
  MAXY = MAXY-moveamount;
}else if(key == 'j'){
   MINY = MINY+moveamount;
  MAXY = MAXY+moveamount;
}else if(key == 'r'){
  red += 10;
}else if(key == 'g'){
  green += 10;
}else if(key == 'b'){
  blue += 10;
}else if(key == ' '){
  red = green = blue = 0;
}

}
