  
PShape s;
PShape file;

void setup() {
  size(100, 100);
  // The file "bot.svg" must be in the data folder
  // of the current sketch to load successfully
  
  file = loadShape("/home/natalie/Desktop/bubble.svg");
}

void draw() {
  //shape(s, 10, 10, 80, 80);
  //println(file.getChild(0).getChildCount());
  PShape c = file.getChild(1).getChild(0);
  
  println(c.getChildCount());
  println(c.getParams());
}

String getFamilyName(int family) 
{
  switch (family) 
  {
  case GROUP:
    return "GROUP";
  case PShape.PRIMITIVE:
    return "PRIMITIVE";
  case PShape.GEOMETRY:
    return "GEOMETRY";
  case PShape.PATH:
    return "PATH";
  }
  return "unknown: " + family;
}
 String getKindName(int kind) 
{
  switch (kind) 
  {
  case LINE:
    return "LINE";
  case PShape.ELLIPSE:
    return "ELLIPSE";
  case PShape.RECT:
    return "RECT";
  case 0:
    return "(PATH)";
  }
  return "unknown: " + kind;
}