int i;
Table table;
HashMap cast;
HashMap order;
String lines[];
color grey;
long lastTime = 0;

void setup() {
  size(640, 360);
  grey = color(139, 139, 139);
  imageMode(CENTER);
  noStroke();
  background(255);
  table = loadTable("/home/natalie/Desktop/cast.csv");
  cast = new HashMap<String, String>();
  order = new HashMap<String, Integer>();

  //println(table.getRowCount() + " total rows in table"); 
  for(int y = 0; y < table.getRowCount(); y++){
    TableRow row = table.getRow(y);
 
    String c = row.getString(0);
        
    for(int x = 1; x < row.getColumnCount(); x++){
      String name = (String) row.getString(x);
      if(name != null && name != ""){
        cast.put(name.toLowerCase(), c);
        order.put(name.toLowerCase(), x - 1);
      }
    }

  }
  i = 0;
  
  lines = loadStrings("/home/natalie/Desktop/names.txt");
  lastTime = millis();
}

void draw() { 
    
    try{
     

      String entry = lines[i]; 
      String words[] = splitTokens(entry);
  
      for(int j = 0; j < words.length; j++){
        //println(lastTime);
        String name = words[j].toLowerCase();
        if(cast.containsKey(name)){

          String colour = (String) "FF" + cast.get(name);
          //println(colour);
          int pix = unhex(colour);
          //println(pix);
          Integer no = (Integer) order.get(name);
          pix = lerpColor(pix, grey, no / 10.0);
          fill(pix, 255);
          int a = int(random(640));
          int b = int(random(360));
          ellipse(a, b, 20, 20);
        
        }
      }
    
    }catch(Exception e){
      e.printStackTrace();
    }finally{
       i++;
       i = i % lines.length;
       
    
    }
}
