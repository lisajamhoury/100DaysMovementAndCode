ArrayList<Circle> circles;
float newX = -10;
float newY= 40;
int xInc = 40;
int yInc = 40;
float xLimit;

void setup()
{
  size(300, 300, P3D);
  smooth(4);
  //stroke(255, 10);
  //strokeWeight(0.5);
  noStroke();
  circles = new ArrayList<Circle>();
  
  xLimit = width;
  
  for (int i = 0; i < 42; i++) {    
    if (newX >= xLimit-xInc) {
      newX = 30;
      newY += yInc;
    } else {
      newX += xInc;
    }
    
    PVector startLoc = new PVector(newX, newY);
    Circle newCircle = new Circle(startLoc);
    circles.add(newCircle);
    

  }
  
}

void draw() { 
  fill(0,10);
  rect(0,0, width, height);
  //background(0);
  
  fill(255, 100);
  for (Circle circ : circles) {
    circ.update();
    circ.display();
  }
  
  

}
 