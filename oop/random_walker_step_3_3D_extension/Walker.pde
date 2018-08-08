class Walker {

  //Properties
  
  float x, y, z;  //location
  float speed, size;
  color c;

  //Constructor
  
  Walker(float x_, float y_, float z_, color c_) {
    speed = 5;
    x = x_ - x_%speed;   //ensure random selected coordinates are all
    y = y_ - y_%speed;   //divisible by speed. Aligns all boxes onto the same
    z = z_ - z_%speed;   //grid. No partial overlaps this way.
    
    c = c_;   //set color to argument c_ passed in.
    size = 5; 
  }

  //Class Functions
  
  void move() {
    //equal random probability of moving in any of six directions. Updates the x,y,or z position variable.

    int choice = int(random(6));  //choice will hold 0, 1, 2, 3, 4, or 5
    if (choice == 0) {//moving left
      x = x - speed;
    } else if (choice == 1) {//moving right
      x = x + speed;
    } else if (choice == 2) {//moving up
      y = y - speed;
    } else if (choice == 3) {//moving down
      y = y + speed;
    } else if (choice == 4) {//moving in
      z = z - speed;
    } else { //moving out
      z = z + speed;
    }
  }

  void display() {   //to avoid confusion, we don't call it draw()
    //Draws the box (cube). This function always draws at (0,0,0), so anytime we want
    //to display, we translate the origin to x,y,z so that the origin is where the
    //box is to be drawn. push/pop Matrix isolates this transformation to this particular
    //box so that it doesn't impact any of the others to be drawn.
    //rectMode(CENTER);
    
    fill(c);
    pushMatrix();
    translate(x, y, z);
    box(size);
    popMatrix();
  }
}