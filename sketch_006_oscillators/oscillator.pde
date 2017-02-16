class Oscillator  {

  // Using a PVector to track two angles!
  PVector angle;
  PVector velocity;
  PVector amplitude;

  Oscillator(PVector iVel, PVector iAmp)  {
    angle = new PVector();
    velocity = iVel;
    amplitude = iAmp;
  }

  void oscillate()  {
    angle.add(velocity);
  }

  void display()  {
    // Oscillating on the x-axis
    float x = sin(angle.x)*amplitude.x;
    // Oscillating on the y-axis
    float y = sin(angle.y)*amplitude.y;

    pushMatrix();
    translate(width/2,height/2);
    stroke(0);
    strokeWeight(10);
    fill(0);
    // Drawing the Oscillator as a line connecting a circle
    line(0,0,x,y);
    //ellipse(x,y,16,16);
    popMatrix();
  }
}