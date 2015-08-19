int i;
String lines[];

void setup() {
  size(640, 360);
  imageMode(CENTER);
  noStroke();
  background(255);
  lines = loadStrings("http://www.gutenberg.org/cache/epub/1342/pg1342.txt");
  i = 0;
}

void draw() { 
      String entry = lines[i].toUpperCase(); 
      String words[] = splitTokens(entry);
      int ch;
      for(int j = 0; j < words.length; j++){

        for(int k = 0; k < words[j].length(); k++){
        ch = int(words[j].charAt(k));
        if(ch < 65 || ch > 90){
          ch = 64;
        }

      float col = map(ch, 64, 90, 0, 255);
      color pix = color(0, col, 150);
      fill(pix, 255);
      int a = int(random(360));
      int b = int(random(360));
      int c = int(random(360));
      int d = int(random(360));
      stroke(0, col, 150);
      line(a,b,c,d);
        }
      }
       i++;
       i = i % lines.length;
         
   
}
