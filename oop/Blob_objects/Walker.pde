class Walker {

  //Properties

  float x, y;  //location
  float speed, size;
  color c;

  //Constructor

  Walker(float x_, float y_, color c_) {
    x = x_;
    y = y_;
    c = color(255,200,0);
    speed = 2; 
    size = 5;
  }
  
  //Class Methods

  Boolean close(Walker w){
    //This method checks two things:
    //1. Is the Walker object (passed in as an argument) close to this Walker object (the one that have the .close()
    //   method invoked? "Close" in this case is within the sum of half of each object's size. 
    //2. Is the object (passed in as an argument) NOT the same object that called this method. The 'this' keyword
    //   is a built-in self-reference so we can ensure we aren't comparing an object with itself.
    if (dist(w.x,w.y,x,y)< w.size/2+size/2 && this!=w) return true;
    else return false;
  }

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