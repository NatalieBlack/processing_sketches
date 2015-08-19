void setup(){
  size(500,400);
  float x1 = 250;
  float y = 200;
  float x2 = 350;
  noFill();
  ellipse(x1,y, 200, 200);
  ellipse(x2,y, 200, 200);
  fill(0);
  text("cerebral", x1 - 75,y);
  text("emotional", x2+10,y);
  text("emotional\nand\ncerebral", (x1+x2)/2 - 25,y-35);

  text("neither emotional nor cerebral", 100,80);
}
