int d = 70;
int p1 = d;
int p2 = p1+d;
int p3 = p2+d;
int p4 = p3+d;

size(400, 700);
background(0);
translate(140, 0);

stroke(50);

for(int i = 20; i < 100; i += 4) {
  stroke(50+i);
  line(i, 2 * i + 40, i, 75); 
}

for(int i = 0; i < 100; i += 4) {
  stroke(50+i);
  line(i, 400 - i, i, 400 - 2*i + 50); 
}


