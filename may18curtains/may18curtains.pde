int i, j;
color[] colours = {50, 250};
color COLOUR;
int WINDOWSIZE, BOXSIZE, MARGIN, COLSNUM;
int minx, miny, col, row;
int doublecolour;
int BGCOLOUR;
int glx, gly,glx2,gly2;
int redboost, blueboost,greenboost;
boolean rincrease, gincrease, bincrease;
boolean DRAW;

void setup() {
  DRAW=true;
  WINDOWSIZE = 495;
  COLSNUM = 3;
  BGCOLOUR = 50;
  redboost = greenboost = blueboost = 0;
  rincrease = bincrease = gincrease = false;
  glx = 0;
  gly = 0;
  glx2 = 0;
  gly2 = 0;
  size(WINDOWSIZE, WINDOWSIZE);
  BOXSIZE = int(float(WINDOWSIZE) / COLSNUM);
  MARGIN = (WINDOWSIZE-(BOXSIZE*COLSNUM))/(COLSNUM+1);
  imageMode(CENTER);
  noStroke();
  noFill();
  background(BGCOLOUR);
  i = 0;
  j = 0;
  doublecolour = 0;
  col = 0;
  row = 0;
  minx = MARGIN;
  miny = MARGIN;
  COLOUR = 0;
  strokeWeight(1);
}

void mousePressed() {
 DRAW=!DRAW;
}     



void repeat(){
int a = minx + int(random(BOXSIZE));
      int b = miny + 1 + int(random(BOXSIZE));
      int c;
      int d;
      do {
        c = minx + int(random(BOXSIZE));
      } while(a == c);
      do {
        d = miny + 1 + int(random(BOXSIZE));
      } while (d == b);

      sketchyCircle(a,b);
}

void draw() { 
  if(DRAW){
  glx++;
  glx = glx%WINDOWSIZE;
  if(rincrease){
    redboost += 1;
  } 
  if(gincrease){
    greenboost += 1;
  }
  if(bincrease){
    blueboost +=1;
  }
      int a = minx + int(random(BOXSIZE));
      int b = miny + 1 + int(random(BOXSIZE));
      int c;
      int d;
      do {
        c = minx + int(random(BOXSIZE));
      } while(a == c);
      do {
        d = miny + 1 + int(random(BOXSIZE));
      } while (d == b);
      COLOUR = getNextColour();
      stroke(COLOUR);
      sketchyCircle(a,b);
  }
}

void sketchyCircle(int xx1, int yy1){
  stroke(getNextColour(),10);



  bezier(glx+random(-1,1), 0, glx+random(-50,50), WINDOWSIZE/3, glx+random(-50,50), 2*WINDOWSIZE/3, glx+random(-50,50), WINDOWSIZE);


}
color getNextColour(){
  color c =  colours[i%colours.length];
  int r = (c >> 16) & 0xFF;  // Faster way of getting red(argb)
  int g = (c >> 8) & 0xFF;   // Faster way of getting green(argb)
  int b = c & 0xFF;          // Faster way of getting blue(argb)
  
  return (color(r+redboost,g+greenboost,b+blueboost));
}

void keyPressed() {
 if(key == 'k') {
    glx+=random(10);
  } else if(key == 'j') {
    glx-=random(10);
  }  else if(key == 'b'){
    blueboost += 10;
  } else if(key == 'g') {
    greenboost += 10;
  } else if(key == 'r') {
    redboost += 10;
  } else if(key == ' ') {
    blueboost = greenboost = redboost = 0;
  } else if(key == '=') {
       redboost += 10;
       blueboost += 10;
       greenboost += 10;
    } else if(key == '-') {
       redboost -= 10;
       blueboost -= 10;
       greenboost -= 10;
    } else if(key == 'e') {
       rincrease = !rincrease;
    }  else if(key == 'v') {
       bincrease = !bincrease;
    }   else if(key == 'f') {
       gincrease = !gincrease;
    } /*else if(int(key) < 58 && int(key) > 49) {
      int o = ((int(key) + 2) % 50) * 10;
       sketchyCircle(getNextColour(), o);
    } else if(key == ']') {
      FR += 5;
      frameRate(FR);
    } else if(key == '[') {
      FR -= 5;
      frameRate(max(FR, 1));
    } else if(key == '0') {
      sketchyCircle(0, 100);
    } else if(key == 'j') {
      started = !started;
    }  else if(key == 'k') {
      cont = !cont;
    } else if(key == 'l') {
      rand = !rand;
    } else if(key == '\'') {
      cycles += 5;
     } else if(key == ';') {
      cycles -= 5;
      cycles = max(1,cycles);
     }*/
}
