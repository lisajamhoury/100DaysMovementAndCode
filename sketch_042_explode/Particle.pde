// A simple Particle class, renders the particle as an image

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;
  PImage img;

  Particle(PVector l, PImage img_) {
    acc = new PVector(0, 0);
    //USE THIS FOR SMOKE RING
    //float vx = randomGaussian()*0.3;
    //float vy = randomGaussian()*0.3 - 1.0;
    float vx = random(-10, 10);
    float vy = random(-10, 10);
    vel = new PVector(vx, vy);
    loc = l.copy();

    float radius = 50;
    float randomVal = random (0, TWO_PI);
    loc.x = width/2+ cos( randomVal )*radius;
    loc.y = height/2+ sin( randomVal )*radius;
    
    
    lifespan = 100.0;
    img = img_;
  }

  void run() {
    update();
    render();
  }

  // Method to apply a force vector to the Particle object
  // Note we are ignoring "mass" here
  void applyForce(PVector f) {
    //acc.add(f);
  }  

  // Method to update position
  void update() {
    vel.add(acc);
    loc.add(vel);
    lifespan -= 2.5;
    acc.mult(0); // clear Acceleration
    //loc.z -= vz;
  }

  // Method to display
  void render() {
    //FOR SMOKE USE THIS
    //imageMode(CENTER);
    //tint(255, lifespan);
    //image(img, loc.x, loc.y);
    // Drawing a circle instead
     fill(255,lifespan);
     noStroke();
     ellipse(loc.x,loc.y,img.width,img.height);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}