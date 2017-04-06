// The Nature of Code
// Started with
// Daniel Shiffman
// http://natureofcode.com
// Forces (Gravity and Fluid Resistence) with Vectors 

Mover[] movers = new Mover[1000];

// Liquid
Liquid liquid1;
Liquid liquid2;
Liquid liquid3;
Liquid liquid4;

void setup() {
  size(400, 400);
  noCursor();
  reset();
  // Create liquid object
  liquid1 = new Liquid(0, 0, width, height/5, 0.9);
  liquid2 = new Liquid(0, height/5 * 2, width, height/5, 0.9);
  liquid3 = new Liquid(0, height/5 * 4, width, height/5, 0.9);
  //liquid4 = new Liquid(width/4, height/2, width/3, height/10, 0.1);

}

void draw() {
  //background(255);
  fill(255,10);
  rect(0,0,width,height);

  // Draw water
  //liquid1.display();
  //liquid2.display();
  //liquid3.display();
  //liquid4.display();
  

  for (int i = 0; i < movers.length; i++) {
    runLiquid(liquid1, i);
    runLiquid(liquid2, i);
    runLiquid(liquid3, i);
    //runLiquid(liquid4, i);


    // Gravity is scaled by mass here!
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    // Apply gravity
    movers[i].applyForce(gravity);

    // Update and display
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }

 
}

void mousePressed() {
  reset();
}

// Restart all the Mover objects randomly
void reset() {
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.5, 8), random(width), random(height));
  }
}

void runLiquid(Liquid liquid, int i) {
  // Is the Mover in the liquid?
  if (liquid.contains(movers[i])) {
    // Calculate drag force
    PVector dragForce = liquid.drag(movers[i]);
    // Apply drag force to Mover
    movers[i].applyForce(dragForce);
  }

}