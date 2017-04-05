class Rose {
  PVector pos = new PVector();
  PVector oldPos = new PVector();
  float multiplier;
  String dir;
  //boolean dead = false;
  
  Rose(float iX, float iY, float iM, String iD) {
    oldPos.x = iX;
    oldPos.y = iY;
    pos.x = iX;
    pos.y = iY;
    multiplier = iM;
    dir = iD;
  }
  
  void update() { 
    
   oldPos.x = pos.x;
   oldPos.y = pos.y;
   
   if (dir == "pos" ) {  
     pos.x += cos(5*angle)*cos(5*angle)* multiplier;
     pos.y += sin(5*angle)*sin(3*angle) * multiplier;
   }
   
   if (dir == "neg") {
     pos.x -= cos(5*angle)*cos(5*angle)* multiplier;
     pos.y -= sin(5*angle)*sin(3*angle) * multiplier;
   }
   
   //dead = isDead();
   //println(dead);
  }
  
  boolean isDead() {
    if (dir == "pos") {
      if (pos.x > width + 10) return true;
    }
    
    if (dir == "neg") {
      if (pos.x < -10) return true; 
    }
    
    return false;
  }
  
  void display() {
   strokeWeight(0.5);
   stroke(0,50);   
   line(oldPos.x, oldPos.y, pos.x, pos.y);
  }  
}