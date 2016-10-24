// Paint With Shapes Simple
// By Michael McMahon
// Based on the example sketch from mobile.

// Left click draws circles.

void setup() {
  //size(displayWidth, displayHeight);
  fullScreen();
  background(0);
  
  // Start in Center
  mouseX=width/2;
  mouseY=height/2;
  
}

void draw() {
  
  // Color
  strokeWeight(5);
  stroke(255,255,255);
  fill(255,255,255);
  
  // Draw Shapes
  if (mouseButton == LEFT) {
    ellipse(mouseX,mouseY,50,50);
  }

  // While the s key is pressed, it will record the images as numbered frames.
  // Speed takes a large hit.
  // Taking out the if keyPressed line and the close bracket will start recording frames.
  if ( keyPressed ) {
    if ((key == 's') || (key == 'S')){
      saveFrame("images/PaintWithShapes-####.png");
    }
  }

}
