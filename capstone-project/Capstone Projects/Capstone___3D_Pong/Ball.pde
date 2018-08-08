class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector velXY;
  int radius;
  float dist, mag2d, rotX, rotY;


  Ball() {
    radius = 10;
    reset(true);
  }

  void reset(boolean player) {
    //Resets the ball after a goal or at the start of a game.
    //X and Y velocitys depend on difficulty
    velocity = new PVector(0, 0, 8);
    if (player) {
      location = new PVector(width/2, height/2, -400);
      if (difficulty == 1) velocity  = new PVector(random(-2, 2), random(-2, 2), 8);
      if (difficulty == 2) velocity = new PVector(random(-3, 3), random(-3, 3), 8);
      if (difficulty >= 3) velocity = new PVector(random(-7, 7), random(-7, 7), 8);
      acceleration = new PVector(0, 0);
    } else {
      location = new PVector(width/2, height/2, -200);
      if (difficulty == 1) velocity  = new PVector(random(-2, 2), random(-2, 2), -8);
      if (difficulty == 2) velocity = new PVector(random(-3, 3), random(-3, 3), -8);
      if (difficulty >= 3) velocity = new PVector(random(-7, 7), random(-7, 7), -8);
      acceleration = new PVector(0, 0);
    }
    rotX = 0;
    rotY = 0;
    velocity.setMag(10);
    keepMag = 10;
    delayCount = 0;
  }

  void move() {
    //Applies velocity to location and acceleration to velocity
    velocity.add(acceleration);
    velocity.setMag(keepMag);
    location.add(velocity);
    acceleration.mult(.98);
    //Acceleration/Spin slowly decrease over time
  }

  void display() {
    rotX += acceleration.x;
    rotY += acceleration.y;
    //Rotates ball based off of acceleration
    pushMatrix();
    translate(location.x, location.y, location.z);
    rotateY(rotX);
    rotateX(-rotY);
    shape(s, 0, 0);
    //Places the model of the ball 
    popMatrix();
  }

  void bounce() {
    //Makes ball bounce off of the walls
    if (location.x < radius || location.x > width-radius) {
      acceleration.mult(0.5);
      velocity.x = velocity.x*-1;
      if (location.x > 580) location.x = 580;
      if (location.x < 20) location.x = 20;
    }
    if (location.y < radius || location.y > height-radius) {
      acceleration.mult(0.5);
      velocity.y = velocity.y*-1;
      if (location.y > 580) location.y = 580;
      if (location.y < 20) location.y = 20;
    }
    //When the ball is about to hit either of the sides, checks for the hit and reflection
    if (abs(location.z) < radius && velocity.z > 0) {
      if (hitDetectPlayer()) {
        reflect(p.location.x, p.location.y, location.x, location.y);
        velocity.z = velocity.z*-1;
        location.z = -20;
        if (keepMag < 20)keepMag = keepMag + 0.2;
      } else { 
        //If the player misses, give the computer a point and reset ball
        ellipse(location.x, location.y, 20, 20);
        rect(p.location.x, p.location.y, 40, 40, 10);
        reset(true); 
        score2++;
      }
    }
    if (abs(location.z) > 600-radius && velocity.z < 0) {
      if (hitDetectEnemy()) {
        reflect(e.location.x, e.location.y, location.x, location.y);
        velocity.z = velocity.z*-1;
        location.z = -590;
        if (keepMag < 20)keepMag = keepMag + 0.2;
      } else {
        //If the 2nd player/ enemy misses give the first player a point and reset ball
        reset(false);
        score++;
      }
    }
  }

  float distance() {
    //Returns distance from both goals
    dist = location.z;
    return dist;
  }
}