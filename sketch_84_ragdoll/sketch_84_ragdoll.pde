/* woking from : 

  Ragdoll Aquarium
  Made by BlueThen on February 21, 2011
  Optimized, refined, etc on March 6, 2011.
  www.bluethen.com
  
  'R' to reset.
  Click to interact
*/

// This arraylist will keep track of the circles all of the bodies will collide with.
ArrayList circles = new ArrayList();
// See: World class
// All of the physics and objects are handled inside the "World"
World world;
float bottom = 0;
float inc = 0.25;


// Distance from each PointMass where interaction is done from the cursor.
// We keep tear size from the cloth simulator for the fun of it.
// The cloth simulator can be found at http://www.openprocessing.org/visuals/?visualID=20140
float mouseInfluenceSize = 100; 
float mouseTearSize = 20;

int bodyCount = 100;
int circleCount = 0;
// How tall is everyone? (Pixels)
int bodyHeights = 100;
// How big are the circles? (Radius)
int circleMin = 50;
int circleMax = 100;

// Setup is called whenever the program starts
void setup () {
  // 640x480.
  // P2D is the renderer used.
  size(400,400, P2D);
  
  // The "sizes" are squared here, so they don't need to be when compared in the PointMass class
  mouseInfluenceSize *= mouseInfluenceSize;
  mouseTearSize *= mouseTearSize;
  
  // Reset function initializes World, the bodies, and the circles in our environment.
  reset();
}
// Draw () is called over and over. It's our "frame" of the animation.
void draw () {
  // Color everything white so we can draw on top of it again.
  fill(255, 100);
  rect(0,0,width, height);
  //background(255);
  bottom += inc;
  println(bottom);
  
  // Update physics, draw bodies, etc.
  world.update();
  
  // Draw the environment
  for (int i = 0; i < circles.size(); i++) {
    EnvCircle circle = (EnvCircle) circles.get(i);
    circle.draw();
  }
  
  //if (frameCount % 60 == 0)
  //  println("Frame rate is " + frameRate);
}

// The reset function randomly places bodies and circles around the screen.
void reset () {
  // World class is constructed with 2 parameters: (int deltaTimeLength, int constraintAcc)
  // deltaTimeLength is the timestep used. Smaller would be more accurate.
  // constraintAcc is how many times constraints are solved per timestep.
  world = new World(15, 5);
  
  // Clear the cirlces just in case reset() has already been called
  circles.clear();
  
  // Create the Bodies. in the Body constructor, everything is added to the World automatically.
  for (int i = 0; i < bodyCount; i++) {
    Body body = new Body(new PVector(random(width), random(height)), bodyHeights);
  }  
  // Add circles to the environment
  for (int i = 0; i < circleCount; i++) {
    EnvCircle circle = new EnvCircle(new PVector(random(width), random(height)), random(circleMin,circleMax));
    circles.add(circle);
  }  
  // set frameCount to 0
  // The first constraint solve can cause ragdolls to go a little crazy
  // (bodies spawned inside circles will fly out)
  // So in EnvCircle, when bodies are pushed away, their velocities are kept to 0 if the frameCount is too low
  frameCount = 0;
}

// Allow the user to reset everything when they press 'R'.
void keyPressed() {
  if ((key == 'r') || (key == 'R'))
    reset();
}