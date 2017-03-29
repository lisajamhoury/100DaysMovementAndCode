class Rose {
  PVector pos = new PVector();
  float multiplier;
  
  Rose(float iX, float iY, float iM) {
    pos.x = iX;
    pos.y = iY;
    multiplier = iM;
    
  }
  
  void update() {
   pos.x += cos(2.75*angle)*cos(angle)* multiplier;
   pos.y += sin(1.5*angle)*sin(angle) * multiplier; 
    
  }
  
  void display() {
   stroke(100,100);
   point(pos.x, pos.y); 
  }
  
}