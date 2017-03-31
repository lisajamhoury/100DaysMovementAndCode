// thanks to mimi yin for the original polar rose code

float x, y;
float angle; 

RoseBunch roses1;
RoseBunch roses2;

void setup() {
  size(400, 400);
  background(255);
  fill(255);
 
  float mult = 1;
  roses1 = new RoseBunch(0, height/2, mult, "pos" );
  roses2 = new RoseBunch(width, height/2, mult, "neg" );
}

void draw() {
  // Keep moving around the circle
  angle+=0.01;
  
  roses1.run();
  roses2.run();
}