ArrayList<Line1> lines = new ArrayList<Line1>();

Line1 line1;
Line1 line2;

float dest; 
float frames; 
float tempVel;
float xChange;
float xChange2;
float rot = 0;
boolean addLines = false;

void setup() {
  size(400, 400, P3D);
  smooth(4);
  background(0);

  dest = width; // half of third
  frames = 1000.0; // two minutes at 60fps
  tempVel = (dest/frames);

  xChange = 5;
  xChange2 = -5;

  line1 = new Line1(tempVel, frames, xChange);
  line2 = new Line1(-1*tempVel, frames, xChange2);
  lines.add(line1);
  lines.add(line2);
} 

void draw() {
  fill(0, 30);
  rect(0, 0, width, height);
  rot += 1;
  translate(width/2, height/2, 0);
  rotateZ(rot);

  if (addLines == false && frameCount % 150 == 0) {
    addLines = true;
  }

  if (addLines == true) {
    Line1 line3 = new Line1(tempVel, frames, xChange);
    Line1 line4 = new Line1(-1*tempVel, frames, xChange2);
    lines.add(line3);
    lines.add(line4);
    addLines = false;
  }
 
   for (int i = lines.size() - 1; i >= 0; i--) {
      Line1 line = lines.get(i);
      line.update();
      line.display();
      if (line.remove()) {
        lines.remove(i);
      }
      
  }     

}