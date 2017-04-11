class DLine {
  color col = color(0);
  PVector startPos = new PVector();
  PVector endPos = new PVector();
  String dir;

  DLine(color iC, String iDir, float iStartX, float iStartY, float iEndX, float iEndY) {
    col = #000000;
    startPos.x = iStartX;
    startPos.y = iStartY;
    endPos.x = iEndX;
    endPos.y = iEndY;
    dir = iDir;
  }
  
  void updateLine() {
    float randInc = random(3);
    if (dir == "left") {
      //println(endPos);
      endPos.x+=inc + randInc;
      endPos.y-=inc + randInc;
      
      if (endPos.x > width +1) {
        dir = "right";
      }
      
    } else if (dir == "right") {
      endPos.x-=inc +randInc;
      endPos.y+=inc +randInc;
      
      if (endPos.x < 0-1) {
        dir = "left";
      }
    }    
    
    // cool
    //endPos.x--;
    //endPos.y--;
  }
  
  void drawLine() {
    stroke(col, 100);
    strokeWeight(0.5);
    line(startPos.x, startPos.y, endPos.x, endPos.y);
  }
}