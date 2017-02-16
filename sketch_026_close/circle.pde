class Circle {
  PVector loc;
  
  Circle(PVector iloc) {
    loc = iloc;
  }
  
  void update() {

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