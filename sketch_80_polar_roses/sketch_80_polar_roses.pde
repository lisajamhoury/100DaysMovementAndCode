// thanks to mimi yin for the original polar rose code

float x, y;
float angle; 
ArrayList<Rose> roses;

void setup() {
  size(400, 400);
  background(200);
  fill(255);

  x = width/2;
  y = height/2;

  float mult = 1;

  roses = new ArrayList<Rose>();

  for (int i = 0; i < 20; i++) {
    Rose rose = new Rose(x, y, mult);
    roses.add(rose);
    mult += 0.1;
  }
}

void draw() {
  //background(0);
  fill(200, 5);
  rect(0, 0, width, height);
  // Keep moving around the circle
  angle+=0.01; 

  for (Rose rose : roses ) {
    rose.update();
    rose.display();
  }

}