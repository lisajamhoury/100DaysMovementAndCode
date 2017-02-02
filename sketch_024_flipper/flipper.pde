class Flipper {
  PVector startPos;
  PVector endPos;
  float newPos;
  int clr;
  float inc = 10;
  String dir; 
  
  Flipper(PVector isPos, PVector iePos, int iClr, String iDir) {
    startPos = isPos;
    endPos = iePos;
    clr = iClr;
    dir = iDir;
    
    if (dir == "x") {
      newPos = endPos.x;
    }
    if (dir == "y") {
      newPos = endPos.y;
    }
  }

  void update() {
    if (newPos > width) {
      inc = -10;
      next = true;
    } 

    if (newPos < 1) {
      inc = 10;
      next = true;
    }
    newPos += inc;
  }

  void display() {
    stroke(clr);
    if (dir == "x") {
      line(startPos.x, startPos.y, newPos, endPos.y);
    }
    if (dir == "y") {
      line(startPos.x, startPos.y, endPos.x, newPos);
    }
    

  }
}