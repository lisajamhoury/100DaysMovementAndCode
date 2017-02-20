/*** started with Smoke Particle System * by Daniel Shiffman.*/

ParticleSystem ps;
float zDist = 200;
int counter = 0;

void setup() {
  size(400, 400, P3D);
  PImage img = loadImage("texture.png");
  ps = new ParticleSystem(1000, new PVector(width/2, height/2), img);
}

void draw() {
  background(0);
  //fill(0,150);
  //rect(0,0,width,height);

  ps.run();

  counter++;

  if (counter == 60) {
    for (int i = 0; i < 1000; i++) {
      ps.addParticle();
    }
    counter = 0;
  }
}