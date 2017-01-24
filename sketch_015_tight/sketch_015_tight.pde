import java.util.Iterator;

ParticleSystem psLeft;
ParticleSystem psRight;

// Perlin noise 
float detail = 100.0;
float noiseFactor = .065;
float noiseSpace = 0;
int octaves = 1;
float fallOff = .59;

void setup() {
  size(500, 500, P3D);
  background(0);
  noFill();
  
  // Initialize particle system
  psLeft = new ParticleSystem(new PVector(width/4, height/4));
}
  
void draw() {
 fill(0,10);
 rect(0,0,width,height);
 psLeft.addParticle(random(800));

 psLeft.run();   
}
 
 
 



  