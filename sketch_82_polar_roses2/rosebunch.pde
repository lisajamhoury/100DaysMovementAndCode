class RoseBunch {
  PVector startPos = new PVector();
  PVector oldPos = new PVector();
  float multiplier;
  String dir;
  ArrayList<Rose> roses;
  
  
  RoseBunch(float iSX, float iSY, float iM, String iD) {
    startPos.x = iSX;
    startPos.y = iSY;
    multiplier = iM;
    dir = iD;
    
    roses = new ArrayList<Rose>();

    for (int i = 0; i < 1000; i++) {
      Rose rose = new Rose(startPos.x, startPos.y, multiplier, dir);
      roses.add(rose);
      multiplier += 0.01;
    }
  }
  
  void run() {
    for (Rose rose : roses ) {
      rose.update();
      rose.display();
    }
  }
}