import java.util.Map;
HashMap<Character,Coord> coords = new HashMap<Character,Coord>();
PImage img, img2, img3, img4, img5;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
color COLOUR;
int i;
float hoverRange;
int WINDOWSIZE;
Character[] letters = {'A','B'};
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
  if(l == 'A'){
    r = int(random(150,255));
    b = int(random(0,100));
    g = int(random(0,100));
  } else if (l == 'B'){
    b = int(random(150,255));
    r = int(random(0,100));
    g = int(random(0,100));
  } else {
    r = 0;
    b = 0;
    g = 0;
  }
  return color(r,g,b);
}

void setup() {
  hoverRange = 10;
  frameRate(20);
  WINDOWSIZE = 700;
  surface.setSize(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  mybackground();
  fill(255);
  Coord aCoord = new Coord(10.0,10.0);
  Coord bCoord = new Coord(50.0,10.0);
  coords.put('A', aCoord);
  coords.put('B', bCoord);
  text("A",aCoord.x, aCoord.y);
  text("B",bCoord.x, bCoord.y);

}
void mybackground() {
  background(0);
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

  return (mouseX >= minX) && (mouseX <= maxX) && (mouseY <= maxY) && (mouseY >= minY);
}

void mouseMoved(){
 for(int i = 0; i < letters.length; i++){
   if(hovering(letters[i])){
     sketchyCircle(getNextColour(letters[i]));
   }
 }
}

void draw() {
}

boolean coinToss(){
  return int(random(10)) == 1; 
}

void sketchyCircle(color c){
  beginShape();
  int x1 = int(random(WINDOWSIZE));
  int y1 = int(random(WINDOWSIZE));

  fill(c, 10);
  

  vertex(x1,y1);

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(100)), x1, x1, int(random(WINDOWSIZE)));

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1, y1, int(random(WINDOWSIZE)));

  endShape();
  
 

}