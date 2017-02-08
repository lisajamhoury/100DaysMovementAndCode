/* Started with Curves II example from Ira Greenberg */
 
ArrayList<Particle> particles;
float gravity = .5;

void setup(){
  size(400, 400);
  background(0);
  
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 10; i++) {
    Particle part = new Particle();
    particles.add(part);
  }


}

void draw() {
  fill(0,10);
  rect(0, 0, width, height);
  
  for (int i = 0; i < 10; i++) {
    Particle part = new Particle();
    particles.add(part);
  }
  
  strokeWeight(.5);
  stroke(255,200);
  for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      if (p.isDead()) {
        particles.remove(i);
        //println("removing");
      }
    }
  
  //framerate   
  //fill(0);
  //rect (width/2,0, 200, 50);
  //fill(255);
  //text(frameRate, width/2, 20);
  
}