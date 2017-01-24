class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float pwidth;
  float mass = 1;
  
  Particle(PVector l, float pw) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-1, 1), random(-1, 0));
    location = l.copy();
    lifespan = 100.0;
    pwidth = pw;
  }
  
  void run() {
    update();
    display();
  }
  
  void applyForce(PVector force) {
    PVector f = force.copy();
    f.div(mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;  
  }
  
  void display() {
   stroke(random(200, 255), lifespan);
       
    float xStep = pwidth/(detail);
    float y = 0;
    float x = 0;
    noiseDetail(octaves, fallOff);
    beginShape();
    for (int i=0; i<=detail; i++) {
      x = i*xStep;
      noiseSpace += .000065;
      y = noise(noiseSpace)*height/4;
      vertex(x, y+(height/3));
    }
    endShape();    
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}