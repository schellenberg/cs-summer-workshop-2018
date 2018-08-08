class Walker {

  //Properties

  float x, y;  //location
  float speed, size;
  color c;

  //Constructor

  Walker(float x_, float y_, color c_) {
    x = x_;
    y = y_;
    c = c_;
    speed = 10; 
    size = 5;
  }
  
  //Class Methods

  void move() {
    //equal random probability of moving in any of four directions. Updates the x or y position variable.

    int choice = int(random(4));  //choice will hold 0, 1, 2, or 3
    if (choice == 0) {//moving left
      x = x - speed;
    } else if (choice == 1) {//moving right
      x = x + speed;
    } else if (choice == 2) {//moving up
      y = y - speed;
    } else { //moving down
      y = y + speed;
    }
  }

  void display() {   //to avoid confusion, we don't call it draw()
    //draws the object (or rectangle, or ellipse, etc...) to the screen.
    rectMode(CENTER);
    fill(c);
    rect(x, y, size, size);
  }
}