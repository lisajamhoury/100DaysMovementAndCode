// started with https://p5js.org/examples/dom-video-pixels.html

var depthVid;
var vidLoaded = false;

function setup() {
  createCanvas(256, 212);
  // specify multiple formats for different browsers
  depthVid = createVideo('video/055sm.mov', callBack);
  depthVid.loop();
  depthVid.hide();
  noStroke();
  fill(0);
}

function draw() {
  //console.log('drawing');
  if (!vidLoaded) {
    return;
  }
  background(255);
  //debugger;
  depthVid.loadPixels();
  //debugger;
  //var stepSize = round(constrain(mouseX / 8, 6, 32));
  var stepSize = 2;
  //var stepSize = 1;
  for (var y=0; y<height; y+=stepSize) {
    for (var x=0; x<width; x+=stepSize) {
      var i = y * width + x;
      var darkness = (255 - depthVid.pixels[i*4]) / 255;
      //debugger;
      //console.log(darkness);
      var radius = stepSize * darkness;
      if (darkness < 0.95 ) {
        fill(darkness);
        ellipse(x, y, radius, radius);  
      }
      
    }
  }
}

function callBack() {
  vidLoaded = true;
}