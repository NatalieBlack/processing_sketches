import java.util.Map;
HashMap<Character,Coord> coords = new HashMap<Character,Coord>();
color COLOUR;
int p;
float hoverRange;
int WINDOWSIZE;
int xSpacing;
int num;
Character LETTER;
int redboost, blueboost, jboost, kboost, wboost, dcount;
int XRANGE, YRANGE;
int ALPHA;
Character[] letters = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
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
  dcount = 10;
  XRANGE = YRANGE = WINDOWSIZE;
  hoverRange = 8;
  ALPHA = 10;
  LETTER = ' ';
  WINDOWSIZE = 700;
  xSpacing = WINDOWSIZE/letters.length;

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
color getNextGColour(){
  int r,g,b;
  r = int(random(0,60));
  g = int(random(0,5));
  b = int(random(r-10,r+25));
  if(int(random(10)) == 1){
    return color(0,0,0,ALPHA);
  } else {
    return color(r,g,b, ALPHA);
  }
}
//TODO: no
color getNextLColour(){
    int r,g,b;
    r = int(random(200,230));
    g = int(random(r-65,r-60));
    b = int(random(25,30));
    return color(r,g,b,ALPHA);
}
color getNextIColour(){
  int b,g,r;
  if(int(random(6)) == 1){
    r = int(random(0,5));
    g = int(random(200,250));
    b = int(random(235,255));
    return color(r,g,b, 5);
  } else if(int(random(12)) == 1){
    r = int(random(200,245));
    g = int(random(r-5,r+5));
    b = int(random(5));
    return color(r,g,b, 5);
  } else {
    g = int(random(200,235));
    return color(g+60,g+60,g,5);

  }}
color getNextOColour(){
  int b,g,r;
  
  if(int(random(3)) > 0){ //light grey
    b = int(random(230,255));
    return color(b+40,b+60,b,5);
  } else if(int(random(12)) == 1){ //yellowish
    r = int(random(200,245));
    g = int(random(r-5,r+5));
    b = int(random(5));
    return color(r,g,b, 5);
  }  else if(int(random(8)) == 2){ //pinkish
    r = int(random(245,255));
    g = int(random(60,80));
    b = int(random(130,160));
    return color(r,g,b, 5);
  } else { //tealish
    r = int(random(0,5));
    g = int(random(200,250));
    b = int(random(235,255));
    return color(r,g,b, 5);
   
  }
}
color getNextJColour(){
  
  jboost = jboost++%170;
  int b,g;
  b = int(random(0,10));
  g = int(random(50,110));
  return color(g+jboost,g,20, ALPHA);
}
//gross greenish thing
//??
color getNextDColour2(){
  
  int b,g;
  if(random(10) > 5) {
      redboost = redboost++%40;

    g = int(random(30,70));
    return color(g+40+redboost,g,5,ALPHA);
  } else {
    int r,base;
    base = 20;//int(random(20,22));
    r = base + int(random(30,35));
    g = base;//int(random(28,30));
    b = base + int(random(4,5));
    return color(r,g,b,ALPHA);
  }
}
//I don't even know
color getNextDColour3(){
  int r,g,b;
  r = int(random(140,180));
  g = int(random(r-100,r-50));
  b = int(random(5,10));

  return color(r,g,b,ALPHA);
}
color getNextDColour(){
dcount = dcount++%50;
 int r,g,b; 
 if(dcount < 40){
  r = int(random(140,220));
  g = int(random(r-100,r-90));
  b =  int(random(20,30));
 } else {
   int x = int(random(20));
    r = int(random(85,100))-x;
    g = int(random(10,20))-x;
    b =  int(random(g))-x;
 }
  return color(r,g,b,ALPHA);
}
color getNextKColour(){
  kboost = kboost++%20;

  int b,g,r;
  g = int(random(10,40));
  r = int(random(g+8,g+48));
  b = int(random(g+5,r-10));
  return color(r+kboost,g,b, ALPHA);
}
color getNextHColour(){
  
  int g,r;
  r = int(random(60,210));
  g = int(random(r-70,r-20));
  return color(r,g,10, ALPHA);
}
color getNextFColour(){
  
  int r,g,b; 
  r = int(random(140,220));
  g = int(random(r-100,r-65));
  b =  int(random(20,30));
  return color(r,g,b,ALPHA);
}
color getNextEColour(){
    blueboost = blueboost++%35;

    int r,g,b;
    g = int(random(80,180));
    r = int(random(g-80,g-30));
    b = int(random(0,90));
    return color(r+blueboost,g,b+(blueboost%10),ALPHA);
}
color getNextCColour(){
  /*int r,g,b;
  float minrg = random(140,150);
    b = int(random(10,15));
    r = int(random(170,200));
    g = int(random(r-20,r-10));
    return color(r,g,b,ALPHA);*/
    int r,g,b;

    r = int(random(200,245));
    g = int(random(r-45,r-25));
    b = int(random(45,g-25));
    return color(r,g,b,ALPHA);
}
color getNextVColour(){
 int r,g,b;
    b = int(random(25,100));
    r = int(random(200,235));
    g = int(random(190,r-25));
    return color(r,g,b,ALPHA);
}
color getNextSColour(){
  int r,g,b;

  r = int(random(200,230));
  g = int(random(r-60,r-20));
  b = int(random(5,g-60));
  return color(r,g,b,ALPHA);
}
color getNextYColour(){
 int r,g,b;
    b = int(random(25,100));
    r = int(random(200,235));
    g = int(random(190,r-25));
    return color(r,g,b,ALPHA);
}
color getNextNColour(){
     int r,g,b;
      b = int(random(70,120));
      r = int(random(170,245));
      g = int(random(20,b-10));
     return color(r,g,b,ALPHA);
}
color getNextPColour(){
     int r,g,b;
      if(int(random(10)) == 1){
        return color(255,ALPHA);
      } else {
       b = int(random(170,190));
       r = int(random(230,255));
       g = int(random(100,b));
       return color(r,g,b,ALPHA); 
     }
}
color getNextQColour(int num){
  
  if(num/4000 % 2 == 0) {
    return QColourA();
  } else {
    return QColourB();
  }
}
color QColourA(){
  int r, g, b;

  if(int(random(4)) == 1){
    r = int(random(0,5));
    g = int(random(235,255));
    b = int(random(235,250));
    return color(r,g,b, 5);
  } else {
    g = int(random(200,250));
    return color(g,g+5,g+10,5);
  }
}
color QColourB(){
   int r,g,b;
  r = int(random(60,110));
  g = int(random(0,5));
  b = int(random(r+30,r+55));
  if(int(random(8)) == 1){
    return color(255,4);
  } else {
    return color(r,g,b, ALPHA);
  }
}

//more rusty?
color getNextRColour(){
     /*int r,g,b;
     g = int(random(10,40));
     r = int(random(g+20,g+50));
     b = int(random(g-5,g+5));
    return color(r,g,b, ALPHA);

}*/

int r,g,b;
    r = int(random(50,130));
    g = int(random(r/3.0 - 5,r/3.0 + 10));
    //g = int(random(30,40));
    b = int(random(g-10,g));
    return color(r,g,b,ALPHA);
}
color getNextMColour(){
   int r,g,b;
  r = int(random(40,90));
  g = int(random(0,5));
  b = int(random(r-10,r+25));
  if(int(random(25)) == 1){
    return color(0,0,0,ALPHA);
  } if(int(random(30)) == 2){
    fill(255, 40);
    int x1 = int(random(WINDOWSIZE));
    int y1 = int(random(WINDOWSIZE));
    //curve(x1, y1, x1+int(random(-30,30)), y1+int(random(-30,30)), x1+int(random(-30,30)), y1+int(random(-30,30)),x1+int(random(-30,30)), y1+int(random(-30,30)));
    return color(r,g,b,ALPHA);
  } else {
    return color(r,g,b, ALPHA);
  }
}
color getNextAColour(){
  int r,g,b;
   r = int(random(150,190));
    b = int(random(0,90));
    g = int(random(0,90));
        return color(r,g,b, ALPHA);

}
//TODO ??
color getNextXColour() {
  int r,g,b; 
  r = int(random(140,220));
  g = int(random(r-100,r-90));
  b =  int(random(20,30));
  return color(r,g,b,ALPHA);
}
color getNextTColour(){
    int r,g,b;
    if(int(random(10)) == 1){
        r = 255;
        b = 255;
        g = 255;
    } else {
      r = 5;
      g = 5;
      b = 5;
    }
    return color(r,g,b, ALPHA);
}
color getNextZColour(){
     int r,g,b;
    if(int(random(20)) == 1){
        r = 215;
        b = 215;
        g = 215;
    } else if (int(random(6)) < 1) {
        r = int(random(30));
        b = int(random(r,r+30));
        g = int(random(5));
} 
    else {
      r = 5;
      g = 5;
      b = 5;
    }
    return color(r,g,b, ALPHA);
}
color getNextUColour(){
    int r,g,b;
    if(int(random(20)) == 1){
        r = 215;
        b = 215;
        g = 215;
    } else if (int(random(4)) > 1) {
        r = int(random(30));
        b = int(random(r,r+30));
        g = int(random(5));
} 
    else {
      r = 5;
      g = 5;
      b = 5;
    }
    return color(r,g,b, ALPHA);
}
//TODO ?
color getNextWColour(){
  wboost = wboost++%20;

  int b,g,r;
  g = int(random(10,15));
  r = int(random(g+30,g+38));
  b = int(random(g+5,r-20));
  return color(r+wboost,g,b, ALPHA);}
color getNextColour(Character l, int num){
  int r;
  int b;
  int g;
  int a = 10;
  if(p++%25==0){
      XRANGE = int(random(50,WINDOWSIZE-50));
      YRANGE = int(random(50,WINDOWSIZE-50));
   }
  if(l == 'A'){
       return getNextAColour();

  } else if (l == 'B'){
    b = int(random(150,255));
    r = int(random(0,100));
    g = int(random(0,100));
  }  else if (l == 'C'){
    return getNextCColour();
  } else if (l == 'D'){ 
    return getNextDColour();
  } else if (l == 'E'){
    return getNextEColour();

  } else if (l == 'F'){
    return getNextFColour();

  } else if (l == 'G'){
    return getNextGColour();

  } else if (l == 'H'){
    return getNextHColour();

  } else if (l == 'I'){
    return getNextIColour();

  } else if (l == 'J'){
    return getNextJColour();

  } else if (l == 'K'){
    return getNextKColour();

  } else if (l == 'L') {
    return getNextLColour();
  } else if (l == 'M') {
    return getNextMColour();
  } else if (l == 'N') {
    return getNextNColour();
  } else if (l == 'O') {
    return getNextOColour();
  }else if (l == 'P') {
    return getNextPColour();
  }else if (l == 'Q') {
    return getNextQColour(num);
  }else if (l == 'R') {
    return getNextRColour();
  }else if (l == 'S') {
    return getNextSColour();
  }else if (l == 'T') {
    return getNextTColour();
  }else if (l == 'U') {
    return getNextUColour();
  }else if (l == 'V') {
    return getNextVColour();
  }else if (l == 'W') {
    return getNextWColour();
  }else if (l == 'X') {
    return getNextXColour();
  }else if (l == 'Y') {
    return getNextYColour();
  }else if (l == 'Z') {
    return getNextZColour();
  }else {
    r = 0;
    b = 0;
    g = 0;
  }
  return color(r,g,b,ALPHA);
}

float getXSpacing(int n){
  int ret = xSpacing*(n+1);
  return ret;
}

float getYSpacing(int n){
  int ySpacing = 50;
  int numCols = WINDOWSIZE/xSpacing;
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
