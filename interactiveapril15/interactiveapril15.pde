PImage img, img2, img3, img4, img5;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
color COLOUR;
int i;
int WINDOWSIZE;
int redboost, blueboost,greenboost;
boolean started, cont, rand;
int FR;
int cycles;

color getNextColour(){
  color c =  colours[i%colours.length];
  int r = (c >> 16) & 0xFF;  // Faster way of getting red(argb)
  int g = (c >> 8) & 0xFF;   // Faster way of getting green(argb)
  int b = c & 0xFF;          // Faster way of getting blue(argb)
  
  return (color(r+redboost,g+greenboost,b+blueboost));
}

void setup() {
  cont = true;
  cycles = 25;
  rand = false;
  redboost = greenboost = blueboost = 0;
  started = false;
  WINDOWSIZE = 700;
  FR = 30;
  frameRate(FR);
  size(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  strokeWeight(1);

  mybackground();

  text("Click!",WINDOWSIZE/2,WINDOWSIZE/2);
  fill(255, 10);
}
void mybackground() {
  background(0);

}

void mousePressed(){
  if(!started){
     started = true;
  }

  mybackground();

}

boolean cointoss(){
  return rand && (random(cycles) == 1);
}

void draw() {
  if(started){
    i++;
    if(!cont && (cointoss() || (i % cycles == 0))){
      
        mybackground();
      
    }
    sketchyCircle(getNextColour(), 10);
   
  }
}
void keyPressed() {
  if(key == 'b'){
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
    } else if(int(key) < 58 && int(key) > 49) {
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
     }
}
void sketchyCircle(color f, int o){
  beginShape();
  int x1 = int(random(WINDOWSIZE));
  int y1 = int(random(WINDOWSIZE));
  fill(f, o);

  vertex(int(random(WINDOWSIZE)),int(random(WINDOWSIZE)));

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(100)), x1, x1, int(random(WINDOWSIZE)));

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1, y1, int(random(WINDOWSIZE)));

  endShape();
  
  beginShape();
  vertex(int(random(WINDOWSIZE)),int(random(WINDOWSIZE)));

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), x1, int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1);

  endShape();

}
