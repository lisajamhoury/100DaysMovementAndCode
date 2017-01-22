float minVel = 0.01;
float maxVel = 0.05;

float angle = 0;
float rectWidth = 125;
float rectInc = 0.5;

float velocity = 0.01;
float acceleration = 0.001;


void setup() {
  background(0);
  size( 500, 500, P3D);
  noStroke();
  smooth(4);
}

void draw() {
 rectMode(CORNER);
 fill(0, 1);
 rect(0,0,width,height);
 
 angle = angle + velocity;
 translate(width/2,height/2,0);
 rotateZ(angle);

 if (degrees(angle) > 360) angle = 0;
 
 if (degrees(angle) > 90 && degrees(angle) < 270) {
   velocity = accelerate(velocity);
   fill(255);
 } else {
   velocity = deccelerate(velocity); 
   fill (255);
 }
 
 rectMode(CENTER);

 rectWidth += rectInc; 
 rect(0, 0, rectWidth, 5);
}

float accelerate(float vel) {
 if (vel >= maxVel) { return vel; }
 vel += acceleration;
 return vel;
}

float deccelerate(float vel) {
  if (vel<= minVel) { return vel; }
  vel -=acceleration;
  return vel;
}