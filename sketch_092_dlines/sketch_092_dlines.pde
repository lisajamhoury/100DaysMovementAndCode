float inc = 1;
color c = #000000;


ArrayList<DLine> lines = new ArrayList<DLine>();

void setup() {
  size(400,400, P3D);
  smooth(4);
  background(255);
  
  // create lines
  for (int i = 0; i < width*2; i++) {
     if (i%(width/8) == 0) {
       if (c == #ffffff) {
         c = #000000;
       } else if (c == #000000) { 
         c = #ffffff;
       }
     }
     
     if (c == #000000) {
       lines.add(new DLine(c, "left", 0+i, 0, 0, 0+i));
     } else if (c == #ffffff) {
       lines.add(new DLine(c, "right", 0+i, 0, 0+i, 0));
     }
    }
    
   // draw lines  
   for (DLine line : lines) {
    line.updateLine();
    line.drawLine();
  }
  
}

void draw() { 
  fill(255, 5);
  rect(0,0,width,height);
   // draw lines  
   for (DLine line : lines) {
    line.updateLine();
    line.drawLine();
  }

  
}