class Line1 {
  float destLength = height;
  float tempLength;

  boolean moving = false;
  float now_ = 0;

  PVector mLoc = new PVector( 0, 0 );
  PVector mVel;
  PVector lineVel;
  float xChange;

  ArrayList<NewLine> mLines1 = new ArrayList<NewLine>();

  Line1(float iVel, float iFrames, float iXChange) {
    //mVel = new PVector( iVel, 0 );
    //mVel = new PVector( 0, 0 );
    tempLength = destLength/iFrames;
    lineVel = new PVector( 0, iVel );
    xChange = iXChange;
  }

  void update() {
    int frameCt = frameCount;

    if (frameCt > 0) { //change this to 1 min - 3600 frames

      if (!moving) {
        moving = true;
        now_ = frameCt;
      }
    }

    if (moving && (frameCt > now_ + 10)) {
      NewLine newLine = new NewLine( mLoc, lineVel );
      mLines1.add( newLine  );

      now_ = frameCt;
      mLoc.x += xChange;
    }


    if (mLines1.size() > 0) {
      for (NewLine line : mLines1) {
        line.step();
      }
      //mLoc.x += mVel.x;
    }
  }

  boolean remove() {
    if (mLoc.x > width) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    for (NewLine line : mLines1) {
      line.display();
    }
  }
}