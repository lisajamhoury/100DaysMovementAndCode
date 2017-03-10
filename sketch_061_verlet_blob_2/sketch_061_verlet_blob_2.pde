/*
 * Verlet Integration - stable Form
 * Pos  = pos + (pos-posOld)
 * alternative to  x += speed
 */

int particles = 150;
VerletNode[] nodes = new VerletNode[particles];

int bonds = particles + particles/2;
ArrayList<VerletStick>sticks = new ArrayList<VerletStick>();

void setup() {
  size(300, 300);
  float theta = PI/4.0;
  float shapeR = 100;
  float tension = .8;
  // balls
  for (int i=0; i<particles; i++) {
    PVector push = new PVector(1+random(1.6), .2);
    PVector p = new PVector(cos(theta)*shapeR, sin(theta)*shapeR);
    nodes[i] = new VerletNode(p,.2);
    theta += TWO_PI/particles;
  }

  // sticks
  for (int i=0; i<particles; i++) {
    if (i>0) {
      sticks.add(new VerletStick(nodes[i-1], nodes[i], tension, false));
    } 
    if (i==particles-1) {
      sticks.add(new VerletStick(nodes[i], nodes[0], tension, false));
    }
  }

  // internal sticks for stability
  for (int i=particles; i<bonds; i++) {
    if (i%5==0) {
      sticks.add(new VerletStick(nodes[i-particles], nodes[i-particles/2], tension, false));
    }
  }
}

void draw() {
  fill(100, 20);
  rect(-1, -1, width+1, height+1);
  translate(width/2, height/2);
  for (int i=0; i<sticks.size(); i++) {
    sticks.get(i).render();
    sticks.get(i).constrainLen();
  }

  for (int i=0; i<particles; i++) {
    nodes[i].verlet();
    nodes[i].render();
    nodes[i].boundsCollision();
  }
}