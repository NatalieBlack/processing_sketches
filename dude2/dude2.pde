color yellow = color(245, 245, 10);
color navy = color(25, 10, 100);
color blue = color(100,200,245);

void draw() {
  background(blue);

  //head
  fill(yellow);
  stroke(navy);
  ellipse(50, 25, 25, 25);
  
  //eyes
  fill(navy);
  ellipse(40, 22.5, 3, 3);
  ellipse(55, 22.5, 4, 4);

  //body
  line(50, 37.5, 50, 65);
  
  //arms
  line(42.5, 50, 57.5, 50);
  
  //legs
  line(50, 65, 55, 80);
  line(50, 65, 45, 80);
  
}