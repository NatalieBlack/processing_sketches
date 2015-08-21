
import java.util.Map;
HashMap<Character,Coord> coords = new HashMap<Character,Coord>();
color COLOUR;
int p;
float hoverRange;
int WINDOWSIZE;
float xSpacing;
int num;
Character LETTER;
int redboost, blueboost, jboost, kboost, wboost,boost5,boost6;
int XRANGE, YRANGE;
int ALPHA;
Character[] letters = {'0', '1','2','3','4','5','6','7','8','9'};
class Coord{
  float x,y;
  Coord(float _x, float _y)
  {
    x=_x;
    y=_y;
  }
} 
void setup() {
  redboost = 75;
  blueboost = 75;
  jboost = 75;
  kboost = wboost = 10;
  boost5 = boost6 = 10;
  XRANGE = YRANGE = WINDOWSIZE;
  hoverRange = 8;
  ALPHA = 10;
  LETTER = ' ';
  WINDOWSIZE = 700;
  xSpacing = (WINDOWSIZE*0.9)/letters.length;
  size(WINDOWSIZE, WINDOWSIZE); 
  p = 0;
  fill(255);
  for(int n = 0;n<letters.length;n++){
    Coord lCoord = new Coord(getXSpacing(n), getYSpacing(n));
    coords.put(letters[n], lCoord);
    text(letters[n],lCoord.x, lCoord.y);
  }
  mybackground();

}
color getNext0Colour(){
  int q;
 if(random(10) >= 0){
  q = int(random(200,255));
 } else {
  q = int(random(40,65));
 }
  return color(q,ALPHA);
}
color getNext1Colour(){
  int q = int(random(230,255));
  return color(q,ALPHA);
}
color getNext2Colour(){
  int r,g,b;
  r = int(random(10));
  g = int(random(10));
  b = int(random(20,60));

    return color(r,g,b,ALPHA);

}
color getNext3Colour(){
  int r,g,b;
  if(random(10) > 1){
    r = int(random(190,250));
    g = int(random(r-35,r-30));
    b = int(random(40,55));
  } else {
    r = int(random(220,230));
    g = int(random(r-15,r-5));
    b = int(random(150,160)); 
  }
    return color(r,g,b,ALPHA);
}
color getNext4Colour(){
  int r,g,b;
  if(random(10) > 4){
    r = int(random(45,70));
    g = int(random(15,20));
    b = int(random(r+10,r+60)); 
  } else {
    r = int(random(10));
    g = int(random(10));
    b = int(random(10));
  }
    return color(r,g,b,ALPHA);

}

color getNext5Colour(){
  int r,g,b,x;
  boost5 = boost5++%50;
  x = int(random(50));
  r = int(random(240,255))-x;
  g = int(random(80,100))-x;
  b = int(random(75,160))-x;

    return color(r+boost5,g,b,ALPHA);
}
//todo too varied?
color getNext6Colour(){
int r,g,b;
int q = 100;
  if(random(10) > 5){
    r = int(random(45,70));
    g = int(random(15,20));
    b = int(random(r+45,255)); 
  }else{
    boost6 = boost6++%50;
    r = int(random(10))+boost6;
    g = int(random(10))+boost6;
    b = int(random(10,50))+boost6;
  }
  if(random(20) > 16){
   q = 0;
  }
    return color(r+q,g+q,b+q,ALPHA);
}


color getNext7Colour(){
  int b,g,r;
    if(int(random(5)) > 1){
    r = int(random(0,5));
    g = int(random(230,245));
    b = int(random(g,g+10));
    } else {
      r = int(random(240,245));
      g = int(random(250,255));
      b = 255;
    }
    return color(r,g,b, 5);
}
color getNext8Colour(){
  if(random(10) > 3){
  redboost = redboost++%150;
  int b,g;
  b = int(random(0,5));
  g = int(random(5,90));
  return color(g+30+redboost,g,5, ALPHA);
  }else{
    int r,g,b;
     r = int(random(160,200));
     g = int(random(80,105));
     b = int(random(40,50));
     return color(r,g,b,ALPHA);
  }
}
color getNext9Colour(){
  int r,g,b,x;
  if(random(10) > 5){
   x = int(random(0,160));
   r = int(random(200,210))-x;
   g = int(random(240,245))-x;
   b = int(random(250,255))-x;
   
  }else{
  r = int(random(100,120));
  g = int(random(190,210));
  b = int(random(240,255));
  }
    return color(r,g,b,ALPHA);

}


color getNextColour(Character l, int num){
  int r;
  int b;
  int g;
  int a = 10;
  if(p++%25==0){
      XRANGE = int(random(50,WINDOWSIZE-50));
      YRANGE = int(random(50,WINDOWSIZE-50));
   }
  if(l == '1'){
       return getNext1Colour();
  } else if (l == '2'){
    return getNext2Colour();

  }  else if (l == '3'){
    return getNext3Colour();
  } else if (l == '4'){ 
    return getNext4Colour();
  } else if (l == '5'){
    return getNext5Colour();

  } else if (l == '6'){
    return getNext6Colour();

  } else if (l == '7'){
    return getNext7Colour();

  } else if (l == '8'){
    return getNext8Colour();

  } else if (l == '9'){
    return getNext9Colour();
  } else if (l == '0'){
    return getNext0Colour();
  }else {
    r = 0;
    b = 0;
    g = 0;
  }
  return color(r,g,b,a);
}

float getXSpacing(int n){
  float ret = xSpacing*(n+1);
  return ret;
}

float getYSpacing(int n){
  int ySpacing = 50;
  int numCols = int(WINDOWSIZE/xSpacing);
  int row = n / numCols + 1;
  int ret = ySpacing * row;
  return ret;
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
 for(int i = 0; i < letters.length; i++){
   if(hovering(letters[i])){
     if( LETTER != letters[i]){
       num = 0;
       LETTER = letters[i];
       mybackground();
       for(int j = 0; j < 150; j++){
         colourPiece(getNextColour(LETTER,num));
       }
     }
     return;
   }
 }
 LETTER = ' '; 

}

void draw() {
  if(LETTER != ' '){
     colourPiece(getNextColour(LETTER, num++), XRANGE, YRANGE);
  } else {
    mybackground();
  }
}

boolean coinToss(){
  return int(random(10)) == 1; 
}

void colourPiece(color c){
  colourPiece(c,WINDOWSIZE/2,WINDOWSIZE/2,WINDOWSIZE/2);
}

void colourPiece(color c, int XRANGE, int YRANGE){
  colourPiece(c,XRANGE,YRANGE,200);
}

void colourPiece(color c, int XRANGE, int YRANGE, int range){
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
