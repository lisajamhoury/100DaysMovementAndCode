class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  int counter = 0;
  float tx = 0;
  float ty = 10000;
  PVector mouse;
  PVector dir;
  float clr;

  Mover() {
    location = new PVector(0,height/2);
    velocity = new PVector(0,0);
    topspeed = 1;
    //mouse = new PVector(random(0,width), random(0, height));
    mouse = new PVector( 0, 0);
    dir = PVector.sub(mouse,location);
    //clr = random(100);
    clr = 200;
  }

  void update() {
    counter++;
    tx += 0.1;
    ty += 0.1;
    // <b><u>Our algorithm for calculating acceleration</b></u>:

    //[full] Find the vector pointing towards the mouse.
    //if (counter > 1) {
      //mouse = new PVector(random(0,width), random(0, height));
      float nx = noise(tx);
      float ny = noise(ty);
      float x = map(nx, 0,1,0, width);
      float y = map(ny, 0,1,0, height);
      mouse = new PVector( x, y);
      dir = PVector.sub(mouse,location);
      counter = 0;
    //}
    //[end]
    // Normalize.
    dir.normalize();
    // Scale.
    dir.mult(0.3);
    // Set to acceleration.
    acceleration = dir;

    //[full] Motion 101! Velocity changes by acceleration.  Location changes by velocity.
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    //[end]
  }

  // Display the Mover
  void display() {
    //stroke(0);
    noStroke();
    fill(clr, 5);
    for ( int i = 1; i < 50; i++ ) {
      //ellipse(location.x+(random(30)),location.y+(random(30)),30,30);
      float r = random(50);
      ellipse(location.x,location.y,r,r);
    }
  }

  // What to do at the edges
  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }
  }
}