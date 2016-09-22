// JitterTriangles
// Michael McMahon

// Modified from:
// Example 10-10 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010

JitterBug[] bugs = new JitterBug[50];

void setup() {
  fullScreen();
  smooth();
  for (int i = 0; i < bugs.length; i++) {
    float x = random(width);
    float y = random(height);
    int r = i + 2;
    bugs[i] = new JitterBug(x, y, r);
  }
}

void draw() {
  for (int i = 0; i < bugs.length; i++) {
    bugs[i].move();
    bugs[i].display();
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

class JitterBug {

  float x;
  float y;
  int diameter;
  float speed = 5;

  JitterBug(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }

  void move() {
    x += random(-speed, speed);
    y += random(-speed, speed);
  }

  void display() {
    triangle(x + diameter, y + diameter, x, y + (2 * diameter), x-diameter, y+diameter);
  } 


  int number = 0;
  void draw(){}

}