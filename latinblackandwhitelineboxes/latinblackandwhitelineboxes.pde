int i;
ArrayList<Character> chars;
int minx, miny, column, row;
int WINDOWSIZE, BOXSIZE, MARGIN, COLSNUM;
int CHINDEX;

void setup() {
  
  WINDOWSIZE = 495;
  COLSNUM = 3;
  size(WINDOWSIZE, WINDOWSIZE);
  BOXSIZE = int(float(WINDOWSIZE) / COLSNUM);
  MARGIN = (WINDOWSIZE-(BOXSIZE*COLSNUM))/(COLSNUM+1);
  imageMode(CENTER);
  noStroke();
  background(0);
  i = 0;
  column = 0;
  row = 0;
  minx = MARGIN;
  miny = MARGIN;
  chars = new ArrayList<Character>();
  strokeWeight(0.5);

  String[] lines = loadStrings("http://www.gutenberg.org/cache/epub/1342/pg1342.txt");
  for(int li = 0; li < lines.length; li++){
    String line = lines[0];
    String[] words = splitTokens(line.toUpperCase());
    
    for(int lj = 0; lj < words.length; lj++){
      String word = words[lj];
      for(int lk = 0; lk < word.length(); lk++) {
          chars.add(word.charAt(lk));
      }
    }
  }
  CHINDEX = 0;
}
void draw() {
}

void mousePressed() { 
    int ch;
    ch = int(chars.get(CHINDEX));

    if(ch < 65 || ch > 90){
      ch = 64;
    }


      //float colour = map(ch, 64, 90, 0, 255);
  int colour = int(random(255));
  color pix = color(colour);
     
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
  stroke(pix);
  taperedLine(a,b,c,d);       
  minx = (minx + BOXSIZE + MARGIN) % (WINDOWSIZE-MARGIN);
  column++;
  row = column/COLSNUM;
  miny = ((BOXSIZE + MARGIN)*(row)) % (WINDOWSIZE-MARGIN);
  CHINDEX++;
  CHINDEX = CHINDEX % chars.size();
         
   
}
void taperedLine(int x1, int y1, int x2, int y2){
  line(x1,y1,x2,y2);
  
  int midx = (x1+x2)/2;
  int midy = (y1+y2)/2;
  
  int midx1 = (x1+midx)/2;
  int midy1 = (y1+midy)/2;
  int midx2 = (x2+midx)/2;
  int midy2 = (y2+midy)/2;
  
  int midx3 = (x1+midx1)/2;
  int midy3 = (y1+midy1)/2;
  int midx4 = (x2+midx2)/2;
  int midy4 = (y2+midy2)/2;

  strokeWeight(1.5);
  line(midx1,midy1,midx2,midy2);
  strokeWeight(1);
  line(midx3,midy3,midx4,midy4);
  strokeWeight(0.5);
}
