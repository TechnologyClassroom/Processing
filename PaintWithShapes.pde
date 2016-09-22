// Paint With Shapes
// By Michael McMahon
// Based on the example sketch from mobile.

// The mouse without clicking draws squares.
// Left click draws circles.
// Right click draws triangles.

void setup() {
  size(displayWidth, displayHeight);
  background(0);
  
  // Start in Center
  mouseX=width/2;mouseY=height/2;
  
}

void draw() {

  // Random Radius
  float d = random(100);
  
  // Random Color
  strokeWeight(random(40));
  stroke(random(255),random(255),random(255));
  fill(random(255),random(255),random(255));
  
  // Draw Shapes
  if (mouseButton == LEFT) {
    ellipse(mouseX,mouseY,d/random(4),d/random(5));
  } else if (mouseButton == RIGHT) {
    triangle(mouseX-random(30),mouseY+random(30),mouseX+random(30),mouseY+random(30),mouseX-random(30),mouseY-random(30));
  } else {
    rect(mouseX-((d*5)/2),mouseY-((d*5)/2),d*5,d*5);
  }

  // While the s key is pressed, it will record the images as numbered frames.
  // Speed takes a large hit.
  // Taking out the if keyPressed line and the close bracket will start recording frames.
  if ( keyPressed ) {
    if ((key == 's') || (key == 'S')){
      saveFrame("images/madcolors-####.png");
    }
  }

}

