int amount = 10;

void setup() {
  size(400,400, P3D);
  smooth(4);
  frameRate(5);
}

void draw() {
 fill(255,10);
 rect(0,0,width,height);
 strokeWeight(0.5);
 stroke(0,10);
 //noFill();
 //fill(0);
 
 for (int i = 0; i < amount; i++) {
   color c = color(random(255));
   fill(c,100);
   triangle(random(width), random(height), random(width), random(height), random(width), random(height));
 }
  
}