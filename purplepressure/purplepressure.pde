int i, min, max;
JSONArray values;
int smallPoint, largePoint;

void setup() {
  size(640, 360);
  smallPoint = 4;
  largePoint = 20;
  imageMode(CENTER);
  noStroke();
  background(255);
  values = loadJSONArray("/home/natalie/pressurenet/data/July-01-2013:00:00:00_July-31-2013:00:00:00_43-44_-80--79.json");
  i = 0;
  min = 960;
  max = 1050;
}

void draw() { 
    JSONObject entry = values.getJSONObject(i); 
    float reading = entry.getFloat("reading");
    if(reading < min){
      reading = min;
    }else if(reading > max){
      reading = max;
    }
    float col = map(reading, min, max, 0, 255);
    color pix = color(0, col, 150);
    fill(pix, 255);
    int a = int(random(640));
    int b = int(random(360));
    ellipse(a, b, 20, 20);
    i++;   
}
