class Circle {
  ArrayList<PVector> points;
  PVector loc;
  float t = 3*PI/2;
  int r = 15;
  float inc = 0.08;
  boolean growing = true;
  
  Circle(PVector iloc) {
    loc = iloc;
    points = new ArrayList<PVector>();

  }
  
  void update() {
    
    if(t > (TWO_PI + 3*PI/2)) {
      growing = false;
    } 

    if (t < 3*PI/2 + inc) {
      growing = true;
    } 

    if (growing == true) {
      PVector newPoint = new PVector();

      t += inc;
      newPoint.x = (int)(loc.x + r * cos(t));
      newPoint.y = (int)(loc.y + r * sin(t));

      points.add(newPoint);
    }

    if (growing == false) {
      t -= inc;
      int lastPt = points.size() - 1;
      points.remove(lastPt);
    }
  }

  void display() {
    if (points.size() > 1) {

      beginShape();
      for (PVector vect : points) {
        curveVertex(vect.x, vect.y);
      }
      endShape();
    }
  }
}