class NewLine {
    PVector mLoc = new PVector();
    PVector mVel = new PVector();;
  
    NewLine ( PVector aLoc, PVector aVel ) {
     mLoc = aLoc.copy();
     mVel = aVel.copy();
    }


void step() {
  mLoc.y += mVel.y;
}

void display() {
    fill(255);
    stroke(255);
    //ellipse(mLoc.x, mLoc.y, 1,1);
    point(mLoc.x, mLoc.y);
}
}