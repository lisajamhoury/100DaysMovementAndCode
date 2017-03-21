//Some changes to

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Demonstration of Craig Reynolds' "Flocking" behavior
// See: http://www.red3d.com/cwr/
// Rules: Cohesion, Separation, Alignment

// Click mouse to add boids into the system

Flock flock;

float theta = 0;
float inc = 0.5;
float steerX = 0;
float steerY = 0;

void setup() {
  size(300,300);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 400; i++) {
    Boid b = new Boid(width/2,height/2);
    flock.addBoid(b);
  }
}

void draw() {
  //background(255);
  fill(255,5);
  rect(0,0,width,height);
  flock.run();
  
  float newX = theta * cos(theta);
  float newY = theta * sin(theta);
  
  steerX = newX + width/2;
  steerY = newY + height/2;
  fill(0);
  ellipse(steerX, steerY, 5, 5);
  
  theta += inc;
  
  // Instructions
  //fill(0);
  //text("Drag the mouse to generate new boids.",10,height-16);
}

// Add a new boid into the System
void mouseDragged() {
  flock.addBoid(new Boid(mouseX,mouseY));
}