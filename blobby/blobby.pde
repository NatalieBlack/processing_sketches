float setX, setY;
void setup() {
    size(400, 400);
    stroke(255);
    setX = 150;
    setY = 50;
}
      
void draw() {
     ellipse(setX, setY, abs(mouseX - setX), abs(mouseY - setY));
}
     
void mousePressed() {
    setX = mouseX;
    setY = mouseY;
    background(10, 64, 70);
}     
