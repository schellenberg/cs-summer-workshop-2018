// V-Neck Adventures V2: Victor's Voyage 
// Platformer Game - sequel to a Scratch Platformer Game
// Library needed: None



Victor v;
Levels l;
Portal p;
Carl c;

ArrayList <Platform> platformlist = new ArrayList<Platform>();
ArrayList <Lava> lavalist = new ArrayList<Lava>();
PImage backdrop;
PImage[] introScene = new PImage [7];
PImage[] outroScene = new PImage[5];
boolean isLeft, isRight, isJump;
float platformDistance = height;

void setup() {
  size(1600, 900);
  rectMode(CORNER);
  imageMode(CENTER);
  for (int i = 0; i < 7; i++) {
    introScene[i] = loadImage("intro" + i + ".png");
  }
  for (int i = 0; i < 5; i++) {
    outroScene[i] = loadImage("outro" + i + ".png");
  }
  v = new Victor();
  l = new Levels(0);
  p = new Portal();
  c = new Carl();
  backdrop = loadImage("Base.png");
}

void draw() {
  image(backdrop, width/2, height/2);
  noStroke();
  fill(#006622);
  rect(0, height-100, 1600, 100);

  //play the introduction

  l.intro();
  if (l.level > 0) {
    //draw Victor each frame, check if he is jumping

    v.display();
    v.jump();

    c.display();
    c.jump();

    //draw the portal each frame, check if Victor is touching it.

    p.display();
    p.detect();
    p.movePortal();

    //check if Victor is above lava, above platforms, and draw the level each frame.
    for (Lava l : lavalist) {
      l.display();
      l.checkLava();
    }

    platformDistance = height;
    for (Platform p : platformlist) {
      p.display();
      p.checkPlatforms();
    }
    if (platformDistance == height) v.floor = 750;

    //level and death counters
    textSize(32);
    fill(0);
    text("Level", 120, 150); 
    text("Deaths", 100, 200);
    text(l.level, 220, 150);
    text(l.deaths, 220, 200);
  }
  l.outro();
}

void keyPressed() {//check when a key is pressed
  setMove(key, true);
}

void keyReleased() {//check when key released
  setMove(key, false);
}

boolean setMove(char d, boolean b) {

  //every time a key is pressed or released, check which one it is.
  //return a boolean value according to which key/keys are pressed, or if no keys are pressed.

  switch(d) {
  case 'a':
    return isLeft = b;

  case 'd':
    return isRight = b;

  case ' ':
    return isJump =  b;

  default:
    return b;
  }
}