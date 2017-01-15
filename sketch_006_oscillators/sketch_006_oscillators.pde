// based on example 3.7 from the nature of code http://natureofcode.com/book/chapter-3-oscillation/ thanks shiffman!

ArrayList<Oscillator> oscs;

//Oscillator oscOne;

void setup() {
  size(500,500);
  
  oscs = new ArrayList<Oscillator>();
  
  for (int i =0; i < 20; i++) {
    PVector vel = new PVector( random(-0.02,0.02), random(-0.02,0.02));
    float randW = random(width/2);
    float randH = random(height/2);
    
    PVector amp1 = new PVector(randW, randH);
    PVector amp2 = new PVector(-randW, -randH);
    
    Oscillator newOsc1 = new Oscillator(vel, amp1);
    oscs.add(newOsc1);
    Oscillator newOsc2 = new Oscillator(vel, amp2);
    oscs.add(newOsc2);
  } 
}

void draw() {
  background(255);

  for (int i =0; i < 10; i++) {
    oscs.get(i).oscillate();
    oscs.get(i).display();
  } 
 
  
}