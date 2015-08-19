PImage img, img2, img3, img4, img5;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
color COLOUR;
int i,j,x1,y1;
int t1;
int WINDOWSIZE;

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void setup() {
  WINDOWSIZE = 675;
  frameRate(10);
  size(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  j = 0;
  strokeWeight(0.5);
  stroke(#FFFFFF);
  noFill();
  
  mybackground();
}
void mybackground() {
  background(0);
  //image(img, 0, 0);
  //image(img2, 100, 0);
  //image(img3, 200, 0);
  //image(img4, 300, 0);
  //image(img5, 400, 0);
  //image(img5, 500, 0);
}

void mousePressed(){
x1 = mouseX;
y1 = mouseY;
COLOUR = getNextColour();
t1 = second();
  sketchyCircle(x1,y1,t1, COLOUR);

}
void mouseReleased(){
  mybackground();
  sketchyCircle(x1,y1,second() - t1, COLOUR);
}

void draw() {

}

boolean coinToss(){
  return int(random(50)) == 1; 
}

void sketchyCircle(int x1,int y1,int t, color colour){
  beginShape();
  t = t * 10;
  fill(colour,50);
  stroke(255);
  

  vertex(x1,y1);

  bezierVertex(0, 0, WINDOWSIZE/2, 0, int(random(WINDOWSIZE)), int(random(WINDOWSIZE/2)));
  bezierVertex(x1-t, y1-t, WINDOWSIZE*0.6, 0, x1, y1);

  endShape();

}

PGraphics2D create_cell_shape() {
  PGraphics2D cell = createGraphics(cellWidth, cellHeight, JAVA2D);
  cell.beginDraw();
  
  cell.smooth();
  cell.stroke(#AAAAAA);
  cell.fill(#FFFFFF);
  
    cell.beginShape(POLYGON);
    for (int i=0; i<x2s.length-1; i++)
    {
      cell.vertex(x2s[i], y2s[i]);
      cell.bezierVertex(x1, y1, x1, y1, x2s[i+1], y2s[i+1]);
    }
    cell.vertex(x2s[x2s.length-1], y2s[x2s.length-1]);
    cell.bezierVertex(x1, y1, x1, y1, x2s[0], y2s[0]);
    cell.endShape(CLOSE);

  cell.endDraw();
//  image(cell);
  
    return cell;
} 
