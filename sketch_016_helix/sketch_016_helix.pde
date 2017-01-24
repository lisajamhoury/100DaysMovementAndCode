//started with https://www.openprocessing.org/sketch/52194

float spin = 0.0;
int[] xpos=new int[150];
int[] ypos=new int[150];

void setup() 
{
  size(800, 500, P3D);
  noStroke();
  smooth();
}

void draw() 
{

  background(255);
  lights();
  
  spin += 0.001;
  shiftpos(xpos,width/2);
  shiftpos(ypos,height/2);
  for(int t = 0;t<xpos.length;t++)
  {
    translate(-30,height/2, -100);
    fill(255-t*255/xpos.length);
    rotateX(PI+spin);
    rotateY(5);
    //box(xpos[t],ypos[t],t);
    box(5);
    translate(0,0,20);
    box(8);
    translate(0,0,40);
    box(10);
   }
  
}

void shiftpos(int[] name,int filler)
{
  for(int i =0;i<name.length-1;i++)
    name[i]=name[i+1];
  name[name.length-1]=filler;
}