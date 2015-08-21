import java.util.Map;
HashMap<Character,Coord> coords = new HashMap<Character,Coord>();
PImage img, img2, img3, img4, img5;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
color COLOUR;
int i;
float hoverRange;
int WINDOWSIZE;
Character LETTER;
Character[] letters = {'A','B','C','D','E'};
class Coord{
  float x,y;
  Coord(float _x, float _y)
  {
    x=_x;
    y=_y;
  }
} 

color getNextColour(Character l){
  int r;
  int b;
  int g;
  int a = 10;
  if(l == 'A'){
    r = int(random(150,255));
    b = int(random(0,100));
    g = int(random(0,100));
  } else if (l == 'B'){
    b = int(random(150,255));
    r = int(random(0,100));
    g = int(random(0,100));
  }  else if (l == 'C'){
    float minrg = random(80,150);
    b = int(random(0,minrg));
    r = int(random(minrg-10,minrg+30));
    g = int(random(minrg-10,minrg+20));
  } else if (l == 'D'){
    r = int(random(100,250));
    b = int(random(0,10));
    g = int(random(20,140));
  } else if (l == 'E'){
    
    g = int(random(80,180));
    r = int(random(g-80,g-30));
    b = int(random(0,80));
  } else {
    r = 0;
    b = 0;
    g = 0;
  }
  return color(r,g,b,a);
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

void setup() {
  hoverRange = 8;
  LETTER = ' ';
  WINDOWSIZE = 700;
  size(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  fill(255);
  for(int n = 0;n<letters.length;n++){
    Coord lCoord = new Coord(getXSpacing(n), getYSpacing(n));
    coords.put(letters[n], lCoord);
    text(letters[n],lCoord.x, lCoord.y);
  }
  mybackground();

}
void mybackground() {
  fill(255);
  background(0);
  for(int n = 0;n<letters.length;n++){
    Coord lCoord = coords.get(letters[n]);
    text(letters[n],lCoord.x, lCoord.y);
  }
  noStroke();
}

void mousePressed(){
    mybackground();
}

boolean hovering(char l){
  Coord c = coords.get(l);
  float maxX = c.x + hoverRange;
  float minX = c.x - hoverRange;
  float maxY = c.y + hoverRange;
  float minY = c.y - hoverRange;

  return (mouseX > minX) && (mouseX < maxX) && (mouseY <= maxY) && (mouseY >= minY);
}

void mouseMoved(){
  LETTER = ' ';
 for(int i = 0; i < letters.length; i++){
   if(hovering(letters[i])){
     LETTER = letters[i];
     for(int j = 0; j < 20; j++){
       sketchyCircle(getNextColour(LETTER));
     }
   } 
 }
}

void draw() {
  if(LETTER != ' '){
     sketchyCircle(getNextColour(LETTER));
  } else {
    mybackground();
  }
}

boolean coinToss(){
  return int(random(10)) == 1; 
}

void sketchyCircle(color c){
  beginShape();
  int x1 = int(random(WINDOWSIZE));
  int y1 = int(random(WINDOWSIZE));

  fill(c);
  

  vertex(x1,y1);

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(100)), x1, x1, int(random(WINDOWSIZE)));

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1, y1, int(random(WINDOWSIZE)));

  endShape();
  
 

}