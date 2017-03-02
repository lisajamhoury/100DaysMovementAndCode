//based on this example https://www.openprocessing.org/sketch/7522

Particle [] chain;
boolean jiggle = false;

void setup()
{
  size(400,400, P3D);
  smooth(4);
  background(0);
  chain = new Particle [50];
  for (int i = 0; i < chain.length; i++) {
    chain[i] = new Particle();
  }
}

float y = 0;
float z = 0;
float x = 0;

void draw()
{
  //background(0);
  fill(0, 100);
  //rect(0,0,width, height); 
  stroke(128); 
  noStroke();
  //strokeWeight(.05);
  pushMatrix();
  //translate(width/2, height/2, 0);
  rotateY(y);
  rotateZ(z);
  rotateX(x);
  y += 0.001;
  z += 0.01;
  x += 0.1;
  
  fill(255);
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
  popMatrix();
}

void mousePressed()
{
  jiggle = true; 
}