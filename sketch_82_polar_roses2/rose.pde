class Rose {
  PVector pos = new PVector();
  PVector oldPos = new PVector();
  float multiplier;
  String dir;
  
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
  }
  
  void display() {
   strokeWeight(0.5);
   stroke(0,50);   
   line(oldPos.x, oldPos.y, pos.x, pos.y);
  }  
}