class Particle
{
  PVector pos;
  PVector oldPos;
  PVector vel;
  Particle()
  {
    pos = new PVector( random(0,width), random(0,height) );
    oldPos = pos.copy();
    float velRand = random(-5, 5);
    vel = new PVector( velRand, velRand );
  }
  void react(Particle [] chain)
  {
    for (int i = 0; i < chain.length; i++) {
      if (chain[i] != this) {
        float d = PVector.dist( pos, chain[i].pos );
        // force on a spring F = kx is proportional to its displacement from equilibrium
        // our spring has an equilibrium position of 100 units length
        float x = d;
        PVector dir = PVector.sub( chain[i].pos, pos );
        dir.normalize();
        // next step in symbols:
        // F = ma -> ma = kx -> dv/dt = kx/m -> dv = kx/m dt
        // i.e., in a short space of time, there's a small change in velocity
        // due to the spring's displacement from equilibrium, x. 
        // Much more simply:
        dir.mult( x / 1000000.0 );
        //
        vel.add(dir);
      }
    }
    //
    bounce();
    // friction: slow to equilibrium
    vel.mult(1.0);
  }
  void move()
  {
    pos.add(vel); 
  }
  void draw()
  {
    stroke(0,10);
    strokeWeight(0.5);
    line(oldPos.x, oldPos.y, pos.x, pos.y ); 
  }
  void bounce()
  {
    if ((pos.x < -100 && vel.x < 0) || (pos.x > width + 100 && vel.x > 0)) {
      vel.x = -vel.x; // non-elastic bounces: some energy lost to the wall
      //oldPos = pos.copy();

    }
    if ((pos.y < -100 && vel.y < 0) || (pos.y > height + 100 && vel.y > 0)) {
      vel.y = -vel.y; // non-elastic bounces: some energy lost to the wall
      oldPos = pos.copy();

    }
  }
  void jiggle()
  {
    vel = new PVector( random(-0.3,0.3), random(-0.3,0.3) );    
  }
}