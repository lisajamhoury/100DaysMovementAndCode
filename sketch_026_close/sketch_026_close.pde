int cx = 250;
int cy = 250;
int r = 100;
ArrayList<PVector> points;
float t = 3*PI/2;
float inc = 0.08;
boolean growing = true;

//Circle circle1;
ArrayList<Circle> circles;

void setup()
{
  size(500, 500, P3D);
  smooth(4);
  stroke(255);
  strokeWeight(0.5);
  noFill();
  points = new ArrayList<PVector>();
  circles = new ArrayList<Circle>();
  
  for (int i = 0; i < 2; i++) {
    PVector startLoc = new PVector((width/3) + i*200, height/2);
    Circle newCircle = new Circle(startLoc);
    circles.add(newCircle);
  }
  
}

void draw() { 
  fill(0,10);
  rect(0,0, width, height);
  
  if(t > (TWO_PI + 3*PI/2)) {
    growing = false;
  } 

  if (t < 3*PI/2 + inc) {
    growing = true;
  } 

  stroke(255);
  for (Circle circ : circles) {
    circ.update();
    circ.display();
  }
  
  

}
 