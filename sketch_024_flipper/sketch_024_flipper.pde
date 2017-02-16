// some design inspiration from eric wenqi li https://madebyeric.tumblr.com/post/156503247688/11100-overlap-and-sin

Flipper flipper1;
Flipper flipper2;
Flipper flipper3;
Flipper flipper4;

ArrayList<Flipper> flippers;

String direction = "up";
boolean next = true;
int i = 0;

void setup() {
  size(400, 400, P3D); 
  strokeWeight(0.5);

  PVector sPos = new PVector(0, 0);
  PVector ePos = new PVector(width, height);
  flipper1 = new Flipper(sPos, ePos, 80, "y");

  PVector sPos2 = new PVector(0, height);
  PVector ePos2 = new PVector(width, 0);
  flipper2 = new Flipper(sPos2, ePos2, 70, "x"); 

  PVector sPos3 = new PVector(width, height);
  PVector ePos3 = new PVector(0, 0);
  flipper3 = new Flipper(sPos3, ePos3, 60, "y");
  
  PVector sPos4 = new PVector(width, 0);
  PVector ePos4 = new PVector(0, height);
  flipper4 = new Flipper(sPos4, ePos4, 50, "x"); 

  flippers = new ArrayList<Flipper>();
  
  flippers.add(flipper1);
  flippers.add(flipper2);
  flippers.add(flipper3);
  flippers.add(flipper4);

}

void draw() {
  fill(230, 5);
  rect(0, 0, width, height);
  
  if (next == true) {
    //if (i == flippers.size() - 1) println(i, "yes");
    
    if (i > flippers.size()-2) direction = "down";
    if (i < 1)  direction = "up";
    
    if (direction == "up") i++;
    if (direction == "down") i--;
    next = false;
   
  }
  
  flippers.get(i).update();
  flippers.get(i).display();

}