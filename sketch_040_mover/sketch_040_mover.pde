// Made with lots of inspiration from Dan Shiffman's Nature of Code 

// An array of objects
Mover[] movers = new Mover[1];
//Mover mover;

void setup() {
  size(400,400);
  background(255);
  //mover = new Mover();
  for (int i = 0; i < movers.length; i++) {
    // Initialize each object in the array.
    movers[i] = new Mover();
  }
}

void draw() {
  //background(255);
  fill(0,10);
  rect(0,0,width,height);
  
  //mover.update();
  //mover.checkEdges();
  //mover.display();

  for (int i = 0; i < movers.length; i++) {
    //[full] Calling functions on all the objects in the array
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
    //[end]
  }
}