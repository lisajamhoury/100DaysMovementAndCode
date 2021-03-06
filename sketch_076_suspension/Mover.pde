// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  // position, velocity, and acceleration 
  PVector position;
  PVector velocity;
  PVector acceleration;

  // Mass is tied to size
  float mass;
  
  int opac;

  Mover(float m, float x, float y) {
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    opac = int(random(40, 100));
  }

  // Newton's 2nd law: F = M * A
  // or A = F / M
  void applyForce(PVector force) {
    // Divide by mass 
    PVector f = PVector.div(force, mass);
    // Accumulate all forces in acceleration
    acceleration.add(f);
  }

  void update() {

    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // position changes by velocity
    position.add(velocity);
    // We must clear acceleration each frame
    acceleration.mult(0);
  }

  // Draw Mover
  void display() {
    
    stroke(0, opac);
    strokeWeight(.5);
    //noStroke();
    //fill(0, 30);
    noFill();
    rect(position.x-25, position.y, mass*20, mass/2);
  }

  // Bounce off bottom of window
  void checkEdges() {
    if (position.y > height) {
      velocity.y *= -0.9;  // A little dampening when hitting the bottom
      position.y = 0;
    }
  }
}