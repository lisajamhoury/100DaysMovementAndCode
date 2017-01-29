//started with https://www.openprocessing.org/sketch/121912

float theta = 0;
float scrX, scrY;
ArrayList<PVector> points; 
float inc = 6;
boolean growing = true;

void setup() {
  size(400, 400);
  stroke(0);
  
  points = new ArrayList<PVector>();
  frameRate(24);
}

void draw() {
 
  if(theta >= 350) {
    growing = false;
  } 

  if (theta < 1) {
    growing = true;
  } 
  
  fill(255, 80);
  rect(0, 0, width, height);
  
  scrX = theta * cos(theta);
  scrY = theta * sin(theta);
  
  if (growing == true) {  
    theta += inc;
    
    float newX = scrX + width/2;
    float newY = scrY + height/2;
    PVector newPoint = new PVector(newX, newY);
  
    points.add(newPoint);
  }
  
  if (growing == false) {
    theta -= inc;
    int lastPt = points.size() - 1;
    points.remove(lastPt);
  }
  
  fill(0);  
  if (points.size() > 1) {
    
    beginShape();
    
    for (PVector vect : points) {  
      curveVertex(vect.x, vect.y);
    }    
    
    endShape();
    
  }
}