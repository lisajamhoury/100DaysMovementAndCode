// thanks to mimi yin for the original polar rose code

float x, y;
float angle; 
float mult = 1;
float inc = 10;


ArrayList<RoseBunch> bunches;

RoseBunch roses1;
RoseBunch roses2;
RoseBunch roses3;
RoseBunch roses4;
RoseBunch roses5;
RoseBunch roses6;

void setup() {
  size(400, 400);
  background(255);
  fill(255);
  
  bunches = new ArrayList<RoseBunch>();
 
  //roses1 = new RoseBunch(0, height/2, mult/2, "pos" );
  //roses2 = new RoseBunch(width, height/2, mult/2, "neg" );
  
  roses1 = new RoseBunch(0, height/2, mult*2, "pos" );
  roses2 = new RoseBunch(width, height/2, mult*2, "neg" );
  
  
  bunches.add(roses1);
  bunches.add(roses2);
  //bunches.add(roses3);
  //bunches.add(roses4);

//  roses5 = new RoseBunch(0, height/4, mult*2, "pos" );
//  roses6 = new RoseBunch(width, height/4, mult/2, "neg" );

}

void draw() {
  // Keep moving around the circle
  angle+=0.01;
  
  //fill(255,1);
  //rect(0,0,width,height);
  
  for (int i = bunches.size()-1; i >= 0 ; i--) {
    bunches.get(i).run();
    if (bunches.get(i).isDead()) {
      
      String dir = bunches.get(i).dir;
      //float startX = bunches.get(i).startPos.x;
      bunches.remove(i);
      if ( dir == "pos") {
        inc++ ;
        RoseBunch roses = new RoseBunch(0, height/2 + inc, mult*2, "pos");
        bunches.add(roses);

      }
      if (dir == "neg") {
        RoseBunch roses = new RoseBunch(width, height/2 - inc, mult*2, "neg");
        bunches.add(roses);
      }
      
    }
  }
  
  
  

}