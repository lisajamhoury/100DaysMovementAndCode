// Just a few tweaks to:  The Nature of by Code Daniel Shiffman example 
// https://github.com/shiffman/The-Nature-of-Code-Examples/tree/master/chp03_oscillation/NOC_3_09_exercise_additive_wave

 
int xspacing = 1;   // How far apart should each horizontal position be spaced
int w;              // Width of entire wave
int maxwaves = 10;   // total # of waves to add together

float theta = 0.0;
float[] amplitude = new float[maxwaves];   // Height of wave
float[] dx = new float[maxwaves];          // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues;                           // Using an array to store height values for the wave (not entirely necessary)

void setup() {
  size(400,400);
  colorMode(RGB, 255, 255, 255, 100);
  w = width + 16;

  for (int i = 0; i < maxwaves; i++) {
    amplitude[i] = random(1, 30);
    float period = random(100,300); // How many pixels before the wave repeats
    dx[i] = (TWO_PI / period) * xspacing/2;
  }

  yvalues = new float[w/xspacing];
}

void draw() {
  background(0);
  //fill(0);
  //rect(0,0,width, height);
  calcWave();
  renderWave();
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.1;

  // Set all height values to zero
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = 0;
  }
 
  // Accumulate wave height values
  for (int j = 0; j < maxwaves; j++) {
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      // Every other wave is cosine instead of sine
      if (j % 2 == 0)  yvalues[i] += sin(x)*amplitude[j];
      else yvalues[i] += cos(x)*amplitude[j];
      x+=dx[j];
    }
  }
}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each position
  noStroke();
  fill(255,50);
  ellipseMode(CENTER);

  
  for (int i = 0; i < 20; i++) {
    
    for (int x = 0; x < yvalues.length; x++) {
      //ellipse(x*xspacing,yvalues[x],4,16);
      ellipse(yvalues[x] - 100 + (50 *i) ,x*xspacing,16,4);
    }
    
  }
}