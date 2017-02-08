/*
 Curves II
 Ira Greenberg, December 4, 2005
 Updated January 7, 2014
 */
 
ArrayList<Particle> particles;
 
//int particles = 25;
//float[]x = new float[particles];
//float[]y = new float[particles];
//float[]xSpeed = new float[particles];
//float[]ySpeed = new float[particles];
//float[]accel = new float[particles];
float gravity = .5;

void setup(){
  size(400, 400);
  background(0);
  strokeWeight(.1);
  stroke(255,100);
  
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 100; i++) {
    Particle part = new Particle();
    particles.add(part);
  }


}

void draw() {
  
  for (int i = 0; i < 100; i++) {
    Particle part = new Particle();
    particles.add(part);
  }
  
  //for (Particle part : particles) {
  //  part.update();
  //}
  
  for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      if (p.isDead()) {
        particles.remove(i);
        println("removing");
      }
    }

  
  
}