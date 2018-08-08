class Carl {
  //class variables
  PVector location, gravity, antigrav, movement;
  PImage [] carlSprites = new PImage [7];
  int floor = 750;
  boolean carlIsJump = false;

  //class constructor
  Carl() {
    location = new PVector(300, 750);
    movement = new PVector(0, 0);
    for (int i = 0; i < 7; i++) {
      carlSprites[i] = loadImage("carl" + i + ".png");
    }
    gravity = new PVector(0, 0);
    antigrav = new PVector(0, 25);
  }

  void display() {
    //called each frame, we check our boolean values to see what direction 
    //Carl should be moving, and move/animate him accordingly.
    int sprite = (((frameCount/3) %3) + 1);
    image(carlSprites[sprite], location.x, location.y);
    movement.set(25, 0);
    location.add(movement);
    if (dist(location.x, location.y, p.location.x, p.location.y)<75) {
      location.set(1700, 750);
    }
  }

  void jump() {
    //the sacred V-Neck Adventures jumping/gravity mechanics, carefully 
    //re-created to feel like the original. called each frame.

    
    if (p.position == 3) {
      antigrav.y = 25;
      carlIsJump = true;
    } else if (p.position == 2) {
      antigrav.y = 20;
      carlIsJump = true;
    } else if (p.position == 1){ 
      antigrav.y = 17;
      carlIsJump = true;
    }else {
      carlIsJump = false;
    }
    if (location.x > 1600) carlIsJump = false;
    if (carlIsJump) {
      location.sub(antigrav);
    }
    if (location.y < floor) {
      location.add(gravity);
      gravity.y += 0.5;
    } else if (location.y >= floor) {
      location.y = floor;
      gravity.y = 0;
    }
  }
}