class Victor {

  //class variables
  PVector location, gravity, antigrav, movement;
  PImage [] victorSprites = new PImage [7];
  int floor = 750;

  //class constructor
  Victor() {//load up Victor with a location, his sprites, and his gravity values.
    location = new PVector(100, 750);
    movement = new PVector(0, 0);
    for (int i = 0; i < 7; i++) {
      victorSprites[i] = loadImage("victor" + i + ".png");
    }

    gravity = new PVector(0, 0);
    antigrav = new PVector(0, 17);
  }

  //class functions
  void display() {
    //called each frame, we check our boolean values to see what direction 
    //Victor should be moving, and move/animate him accordingly.
    if (isRight && (location.x <= width - 37)) {
      int sprite = (((frameCount/3) %3) + 1);
      image(victorSprites[sprite], location.x, location.y);
      movement.set(14, 0);
      location.add(movement);
    } else if (isLeft && (location.x >= 37)) {
      int sprite = (((frameCount/3) %3) + 4);
      image(victorSprites[sprite], location.x, location.y);
      movement.set(-14, 0);
      location.add(movement);
    } else { 
      image(victorSprites[0], location.x, location.y);
      movement.set(0, 0);
      location.add(movement);
    }
  }

  void jump() {
    //the sacred V-Neck Adventures jumping/gravity mechanics, carefully 
    //re-created to feel like the original. called each frame.
    if (isJump) {
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