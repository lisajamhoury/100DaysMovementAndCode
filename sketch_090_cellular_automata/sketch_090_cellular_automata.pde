/** Working off of: 
 * Cellular Automata Main Tab - 01
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

CA_1D ca;
//int xOff;
//int yOff;

int counter = 1;
int counter2 = 1;

void setup() {
  size(300, 300);
  background(255);
  ca = new CA_1D(600, 600, 1);
}

void draw() {
  translate(ca.w/2, ca.h/2);
  ca.createGeneration();
  translate(-ca.w/2, -ca.h/2);
  fill(255);
  stroke(255);
  strokeWeight(1);

  int xOff = 180;
  int xOff2 = 0;
  int yOff = 0;
  int yOff2 = 0;

  if (frameCount > 300) { //300
    for (int i = 0; i < counter; i++) {
      line(width, height- yOff, width-xOff, height-yOff);
      xOff--;
      yOff++;
      
    }

    if (frameCount > 515) { //515
      for (int i = 0; i < counter2; i++) {
        line(0, 75-yOff2, 170-xOff2, 75-yOff2);
        line(width, 75-yOff2, 250+xOff2, 75-yOff2);
        
        xOff2++;
        yOff2++;
      }
      
      counter2++;
    }

    counter++;
  }
  //println(frameCount);
}