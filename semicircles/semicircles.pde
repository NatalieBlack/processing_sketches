int WINDOWSIZE;
 color[] colours = {#FF7400,#FFA65D,#FF8D2E,#F36E00,#BC5500,#FFAA00,#FFC95D,#FFB92E,#F3A200,#BC7D00,#144CCD,#5D83D8,#3866D1,#0A38A3,#082C7E,#00C3C3,#4CD0D0,#24C8C8,#009292,#007171};
void setup() {
  WINDOWSIZE = 500;
size(WINDOWSIZE, WINDOWSIZE);
noStroke();
frameRate(20);
}
int getrand(){
  return int(random(WINDOWSIZE));
}
void draw() {
  fill(colours[int(random(colours.length))]);
arc(getrand(), getrand(), getrand(), getrand(), PI, TWO_PI);

}
