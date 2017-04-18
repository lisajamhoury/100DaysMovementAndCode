class Flipper {
  PVector startPos;
  PVector endPos;
  float newPos;
  int clr;
  float inc = 0.025;
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

    // flip directions back and forth
    if (newPos > width-random(width/2)) {
      inc = -0.025;
      next = true;
      clr = color(255);
    } 

    if (newPos < 1 + random(width/2)) {
      inc = 0.025;
      next = true;
      clr = color(0);
    }


    //newPos += inc;
  }

  void display() {
    strokeWeight(0.5);
    stroke(clr, 10);

    for (int i = 0; i < width/2; i++) {
      if (dir == "x") {
        line(startPos.x, startPos.y, newPos, endPos.y);
      }
      if (dir == "y") {
        line(startPos.x, startPos.y, endPos.x, newPos);
      }
      newPos += inc;
    }
  }
}