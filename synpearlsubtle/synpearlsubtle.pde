import java.util.Map;
HashMap<Character,Coord> coords = new HashMap<Character,Coord>();
PImage img, img2, img3, img4, img5;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
color COLOUR;
int i;
float hoverRange;
int WINDOWSIZE;
Character LETTER;
int redboost;
int XRANGE, YRANGE;
int ALPHA;
Character[] letters = {'A','B','C','D','E'};
class Coord{
  float x,y;
  Coord(float _x, float _y)
  {
    x=_x;
    y=_y;
  }
} 

void setup() {
  frameRate(20);
  redboost = 75;
  XRANGE = YRANGE = WINDOWSIZE;
  hoverRange = 8;
  ALPHA = 10;
  LETTER = ' ';
  WINDOWSIZE = 700;
  size(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  fill(255);
  for(int n = 0;n<letters.length;n++){
    Coord lCoord = new Coord(getXSpacing(n), getYSpacing(n));
    coords.put(letters[n], lCoord);
  }
  mybackground();

}

color getNextColour(){
 
  int a = 10;
  if(i++%10==0){
      XRANGE = int(random(50,WINDOWSIZE-50));
      YRANGE = int(random(50,WINDOWSIZE-50));
   }

 
  
 int b,g,r;
  
  if(int(random(2)) == 1){
    g = int(random(200,235));
    return color(g+60,g+60,g,5);
  } else if(int(random(12)) == 1){
    r = int(random(200,245));
    g = int(random(r-5,r+5));
    b = int(random(5));
    return color(r,g,b, 5);
  }  else if(int(random(5)) == 2){
    r = int(random(245,255));
    g = int(random(60,80));
    b = int(random(130,160));
    return color(r,g,b, 5);
  } else {
    r = int(random(0,5));
    g = int(random(200,250));
    b = int(random(235,255));
    return color(r,g,b, 5);
   
  }
}


float getXSpacing(int n){
  int xSpacing = 20;
  int ret = xSpacing*(n+1);
  return ret;
}

float getYSpacing(int n){
  int ySpacing = 50;
  int numCols = WINDOWSIZE/ySpacing;
  int row = n / numCols + 1;
  int ret = ySpacing * row;
  return ret;
}


void mybackground() {
  background(50,1);
  stroke(0,30);
}

void mousePressed(){
    mybackground();
}


void draw() {
     sketchyCircle(getNextColour(), XRANGE, YRANGE);

}

boolean coinToss(){
  return int(random(10)) == 1; 
}

void sketchyCircle(color c){
  sketchyCircle(c,WINDOWSIZE/2,WINDOWSIZE/2,WINDOWSIZE/2);
}

void sketchyCircle(color c, int XRANGE, int YRANGE){
  sketchyCircle(c,XRANGE,YRANGE,200);
}

void sketchyCircle(color c, int XRANGE, int YRANGE, int range){
 beginShape();
  
  int minX = XRANGE - range;
  int maxX = XRANGE + range;
  int minY = YRANGE - range;
  int maxY = YRANGE + range;
  int x1 = int(random(minX,maxX));
  int y1 = int(random(minY,maxY));
  fill(c);
  
  vertex(x1,y1);

  bezierVertex(int(random(minX,maxX)), int(random(minY,maxY)),int(random(minX,maxX)), int(random(minY,maxY)),int(random(minX,maxX)), int(random(minY,maxY)));
  bezierVertex(int(random(minX,maxX)), int(random(minY,maxY)),int(random(minX,maxX)), int(random(minY,maxY)),int(random(minX,maxX)), int(random(minY,maxY)));


  endShape();
  
 

}
