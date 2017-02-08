class Particle {
  float x = 0;
  float y = 0;
  float xSpeed = random(.75, 1.2);
  float ySpeed;
  float accel = random(.005, .2);
  float counter = 0;
 

  Particle() {
  }
  
  boolean isDead() {
    if (x >= width) return true;
    else return false;
  }

  void update() {
    if (x < width) {
      x+=xSpeed;

      // double assignment creates y acceleration
      ySpeed += accel;
      y+=ySpeed;
      point(x, y);

      // check ground dection only
      if ( y>=height) {
        // reverse particle direction
        ySpeed*=-1;
        // lower particle speed
        ySpeed*=gravity;
        // keep particle from sliding out of window
        y=height;
      }
    }
  }

  void display() {
  }
}