// JitterRotate
// Michael McMahon

// Modified from:
// Example 10-10 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010

//https://processing.org/examples/rotate.html
float jitter;
float angle;

JitterBug[] bugs = new JitterBug[70];

void setup() {
  fullScreen();

  smooth();
  background(random(0,255), random(0,255),random(0,255),random(0,255));
  
  for (int i = 0; i < bugs.length; i++) {

    float x = random(width);
    float y = random(height);

    int r = i + 2;

    bugs[i] = new JitterBug(x, y, r);

  }

}

 

void draw() {

  for (int i = 0; i < bugs.length; i++) {

    //https://processing.org/examples/rotate.html
    if (second() % 2 == 0) {
      jitter = random(-0.1, 0.1);
      };
    angle = angle + jitter;
    float c = cos(angle);
    translate(width/2, height/2);
    rotate(c);

    bugs[i].move();

    bugs[i].display();
  }

  // While the s key is pressed, it will record the images as numbered frames.
  // Speed takes a large hit.
  // Taking out the if keyPressed line and the close bracket will start recording frames.
  if ( keyPressed ) {
    if ((key == 's') || (key == 'S')){
      saveFrame("images/JitterRotate-####.png");
    }
    
  }

}

 

class JitterBug {
  
  float x;

  float y;

  int diameter;

  float speed = 2.5;
  
  JitterBug (float tempX, float tempY, int tempDiameter) {

  fill(random(0,255), random(0,100),random(0,255),random(0,255));

  stroke(random(0,255), random(0,255),random(0,255),random(0,255));

    x = tempX;

    y = tempY;

    diameter = tempDiameter;
    
  }

  void move() {
    //rotate(random(0,PI/2));
    //x += random(-speed, speed);

    //y += random(-speed, speed);

    x += random(-speed, speed);

    y += random(-speed, speed);
    
  }

  void display() {
    //rotate(random(0,2*PI));
    triangle(x + diameter, y + diameter, x, y + (2 * diameter), x - diameter, y + diameter);
    
  }

}