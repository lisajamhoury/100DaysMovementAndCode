//based on this example https://www.openprocessing.org/sketch/7522

Particle [] chain;
boolean jiggle = true;

void setup()
{
  size(400,400, P3D);
  smooth(4);
  background(0);
  chain = new Particle [500];
  for (int i = 0; i < chain.length; i++) {
    chain[i] = new Particle();
  }
}

void draw()
{
  //background(0);
  fill(255, 50);
  rect(0,0,width, height); 
  stroke(128); 
  noStroke();
  //strokeWeight(.05);
  //fill(0,0,255);
  // for correct physics, react then move
  for (int i = 0; i < chain.length; i++) {
    chain[i].react( chain );
  }
  for (int i = 0; i < chain.length; i++) {
    chain[i].move();
  }
  // draw springs
  for (int i = 0; i < chain.length; i++) {
    // starting at i+1 only draws springs once
    for (int j = i + 1; j < chain.length; j++) {
      //line(chain[i].pos.x, chain[i].pos.y, 
      //     chain[j].pos.x, chain[j].pos.y);
    }
  }
  // draw particles
  for (int i = 0; i < chain.length; i++) {
    chain[i].draw();
  }
  // respond to a request to jiggle the springs
  if (jiggle) {
    jiggle = false;
    for (int i = 0; i < chain.length; i++) {
      chain[i].jiggle();
    }
    //jiggle = true;
  }
}

void mousePressed()
{
  jiggle = true; 
}