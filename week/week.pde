int CENTRE;

void setup(){
  CENTRE = 400;
  size(500,500);
}
void draw(){
  background(10);
noStroke();
fill(255,50);
drawMonday();
drawTuesday();
drawWednesday();
}

void drawMonday(){
  beginShape();
    curveVertex(CENTRE-200, CENTRE-179);
    curveVertex(CENTRE-200, CENTRE-179);
    
    curveVertex(CENTRE-200,  CENTRE-130);

    curveVertex(CENTRE-140,  CENTRE-113);
        curveVertex(CENTRE-130,  CENTRE-120);

   curveVertex(CENTRE-158, CENTRE-179);
    curveVertex(CENTRE-158, CENTRE-179);
  endShape();
}
void drawTuesday(){
  beginShape();
    curveVertex(CENTRE-158, CENTRE-179);
    curveVertex(CENTRE-158, CENTRE-179);
    
    curveVertex(CENTRE-129,  CENTRE-113);
    curveVertex(CENTRE-82,  CENTRE-131);
    curveVertex(CENTRE-106,  CENTRE-185);
    curveVertex(CENTRE-106,  CENTRE-185);
  endShape();
}
void drawWednesday(){
    beginShape();
      curveVertex(CENTRE-106,  CENTRE-185);
    curveVertex(CENTRE-106,  CENTRE-185);
    curveVertex(CENTRE-70,  CENTRE-119);
        curveVertex(CENTRE-65,  CENTRE-115);
        curveVertex(CENTRE-50,  CENTRE-118);

    curveVertex(CENTRE-40,  CENTRE-185);
    curveVertex(CENTRE-40,  CENTRE-185);
    endShape();
}
void drawThursday(){
}
void drawFriday(){
}
void drawSaturday(){
}
void drawSunday(){
}
