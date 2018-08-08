//Computer Science 30
//3D Pong
//Library to Install: None

//Play a game of pong against an AI in 3D or against another person
//Choose AI difficulty with 1-5 keys. M for Mouse vs AI and K for Keyboard multiplayer

Ball b;
Paddle p;
Enemy e;
PShape s;
int delayCount, alf, score, score2, difficulty;
float hitX, hitY, keepMag, x1, x2, y1, y2, momentumFinalX, momentumFinalY;
PVector paddleBall, padLocation, ballLocation, actualMomentum;
color c;
float [] momentumX = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
float [] momentumY = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
boolean dirX, dirY, dirEnemy, multi;
boolean is_Up, is_Down, is_Right, is_Left, is_w, is_s, is_a, is_d;

void setup() {
  size(600, 600, P3D);
  rectMode(CENTER);
  stroke(0);
  colorMode(RGB);
  background(255);
  difficulty = 2;
  //Sets game to normal difficulty
  b = new Ball();
  p = new Paddle();
  e = new Enemy();
  //b,p,e Load all the different objects, the ball, the paddle and the enemy paddle respectively
  s = loadShape("ball4.obj");
  c = color(0, 0, 0);
  //s Loads the object file used for the ball, c saves the shadow's color
  noCursor();
  textSize(220);
  textAlign(CENTER, CENTER);
  frameRate(60);
  multi = false;
}

void draw() {
  clear();
  //Sets background to gray. This will act as the wall color
  background(50);
  pushMatrix();
  fill(50);
  rotateY(HALF_PI);
  //Rotates canvas on Y axis so I can draw on the Left Wall
  fill(0);
  textSize(220);
  scoreboard();
  slider();
  //Calls the functions that draw the scoreboard and the difficulty scale on the walls
  popMatrix();
  strokeWeight(1);
  noFill();
  pushMatrix();
  stroke(#F20A0A);
  strokeWeight(5);
  rect(width/2, height/2, width, height);
  //Draws Red border around player goal
  translate(0, 0, -600);
  stroke(#0D20BF);
  strokeWeight(3);
  fill(0);
  rect(width/2, height/2, width, height);
  //Draws Blue goal, with black background
  popMatrix();
  stroke(0);
  line(0, 0, 0, 0, 0, -600);
  line(0, width, 0, 0, width, -600);
  line(height, width, 0, height, width, -600);
  line(height, 0, 0, height, 0, -600);
  //Above Draws all of the receding lines from corner to corner 
  fill(0);
  if (!(score > 4 || score2 > 4)) {
    //Only runs if neither player has scored 5 times
    if (delayCount > 120) b.move();
    //Following startup or a goal, the ball will not move for 2 seconds
    shadow();
    //Calls for the ball shadows to be drawn
    if (multi) p.arrows();
    else p.follow();
    //Moves the Player paddle to the mouse 
    momentum();
    //Keeps track of the last 10 frames worth of mouse locations
    if (multi) e.wasd();
    //Moves the enemy based on WASD keys if game is being played in multiplayer
    else if (b.velocity.z < 0) { 
      //If ball is hit towards the enemy, pick a speed to follow at
      if (dirEnemy) {
        if (difficulty == 1) e.magnet = random(5, 9);
        if (difficulty == 2) e.magnet = random(6, 10);
        if (difficulty == 3) e.magnet = random(7, 11);
        if (difficulty == 4) e.magnet = random(8, 11);
        if (difficulty == 5) e.magnet = random(9, 14);
        dirEnemy = false;
      }
      e.follow();
    } else {   
      //If ball is moving away from enemy, slowly move back to middle of the screen
      e.magnet = 3;
      e.mid();
      dirEnemy = true;
    }
    b.bounce();
    b.display();
    e.display();
    p.display(); 
    delayCount++;
  } else endScreen();
}

void reflect(float x, float y, float bx, float by) {
  //Finds where on the paddle the ball hits it, and alters the balls velocity based on this 
  padLocation = new PVector(x, y);
  ballLocation = new PVector(bx, by);
  paddleBall = ballLocation.sub(padLocation);
  paddleBall.div(15);
  b.velocity.add(paddleBall);
  b.velocity.setMag(keepMag);
}

boolean hitDetectPlayer() {
  //Tests whether or not the ball has hit the player paddle
  hitX = p.location.x-b.location.x;
  hitY = p.location.y-b.location.y;
  if (abs(hitX) > 60|| abs(hitY)>60) return false;
  findMomentum();
  return true;
}

boolean hitDetectEnemy() {
  //Tests whether or not the ball has hit the enemy paddle
  hitX = e.location.x-b.location.x;
  hitY = e.location.y-b.location.y;
  if (abs(hitX) > 60 || abs(hitY) > 60) return false;
  return true;
}

void shadow() {
  //Draws shadows on the wall that fade as the ball moves away
  noStroke();
  alf = int(map(b.location.x, 600, 0, -200, 255));
  //For each of the four walls, maps the value used for alpha based on how far away the ball is 
  if (alf > 0) {
    fill(c, alf);
    pushMatrix();
    rotateY(-HALF_PI);
    ellipse(b.location.z, b.location.y, 20, 20);
    popMatrix();
  }
  alf = int(map(b.location.x, 0, 600, -200, 255));
  if (alf > 0) {
    fill(c, alf);
    pushMatrix();
    rotateY(HALF_PI);
    translate(0, 0, 600);
    ellipse(-b.location.z, b.location.y, 20, 20);
    popMatrix();
  }
  alf = int(map(b.location.y, 0, 600, -200, 255));
  if (alf > 0) {
    fill(c, alf);
    pushMatrix();
    rotateX(HALF_PI);
    translate(0, 0, -600);
    ellipse(b.location.x, b.location.z, 20, 20);
    popMatrix();
  }
  alf = int(map(b.location.y, 600, 0, -200, 255));
  if (alf > 0) {
    fill(c, alf);
    pushMatrix();
    rotateX(HALF_PI);
    ellipse(b.location.x, b.location.z, 20, 20);
    popMatrix();
  }
}

void keyPressed() {
  if (key == ' ') {
    score = 0;
    score2 = 0;
    b.reset(true);
  }
  if (key == '1') difficulty = 1;
  if (key == '2') difficulty = 2; 
  if (key == '3') difficulty = 3;
  if (key == '4') difficulty = 4;
  if (key == '5') difficulty = 5;
  //Set difficulty based on number pressed 1-5
  if (key == 'm') multi = false;
  if (key == 'k') multi = true;
  //Alternates between multiplayer(keyboard) and singleplayer(mouse vs computer)
  if (key == CODED) setTruth(keyCode, true);
  //Keeps track of which of the arrow keys are pressed using the setTruth function
  else setTruth(key, true);
}

void keyReleased() {
  if (key == CODED) setTruth(keyCode, false);
  //Using the setTruth sets keys to false after being released
  else setTruth(key, false);
}  

void scoreboard() {
  //Draws the both players scores on the left wall
  fill(237, 38, 38);
  text(score, 130, height/2);
  fill(#0D20BF);
  text(score2, 440, height/2);
  fill(0);
  rect(275, 325, 100, 50);
}

void momentum() {
  //Keeps a running lest of the last 10 mouse locations
  for (int i = 0; i < 9; i++) {
    momentumX[i] = momentumX[i+1];
  }
  momentumX[9] = mouseX;
  for (int i = 0; i < 9; i++) {
    momentumY[i] = momentumY[i+1];
  }
  momentumY[9] = mouseY;
}

void findMomentum() {
  //Measures how far the mouse has moved in the last 10 frames
  dirX = false;
  dirY = false;
  //Keeps track of whether or not the paddle has continued moving in the same direction 
  x1 = momentumX[9];
  y1 = momentumY[9];
  x2 = momentumX[8];
  y2 = momentumY[8];
  momentumFinalY = y2-y1;
  momentumFinalX = x2-x1;
  for (int i = 7; i <= 0; i = i-1) {
    //As long as dirY hasn't changed yet, calls the directSame to check the next value
    if (!dirY) dirY = directSame(y1, y2, momentumY[i]);
    if (!dirY) {
      //Saves the distance in Y that the mouse has moved without stopping or changing directions
      momentumFinalY = momentumY[i] - y1;
    }
    if (!dirX) dirX = directSame(x1, x2, momentumX[i]);
    if (!dirX) {
      momentumFinalX = momentumX[i] - x1;
      //Does everything that the Y part of the function did, but for X
    }
  }
  if (x1 == x2) momentumFinalX = 0;
  if (y1 == y2) momentumFinalY = 0;
  //If the paddle wasnt moving in the frame before the ball hit, no acceleration will be applied
  actualMomentum = new PVector(momentumFinalX, momentumFinalY);
  actualMomentum.div(40);
  b.acceleration.add(actualMomentum);
  //Adds 1/40th of the calculated momentum to the acceleration of the ball
}

boolean directSame(float num1, float num2, float num3) {
  //Test to see the paddle is still moving in the same direction x or y
  if (num1 < num2) {
    if (num2 > num3) return true;
    else return false;
  } else if (num1 > num2) {
    if (num2 < num3) return true;
    else return false;
  } else return false;
}

boolean setTruth(int k, boolean b) {
  //Toggles booleans for arrow and wasd keys between true and false depending on whether the key is held
  switch (k) {
  case UP:
    return is_Up = b;
  case DOWN: 
    return is_Down = b;
  case RIGHT:
    return is_Right = b;
  case LEFT:
    return is_Left = b;
  case 'w':
    return is_w = b;
  case 's':
    return is_s = b;
  case 'a':
    return is_a = b;
  case 'd':
    return is_d = b;
  default:
    return b;
  }
}

void endScreen() {
  //Prints end screen once game is over
  textSize(220);
  background(0);
  fill(237, 38, 38);
  text(score, 180, 300);
  fill(#0D20BF);
  text(score2, 420, 300);
  textSize(60);
  //Goes through different possibilities for the scoreboard
  if (score == 5) fill(237, 38, 38);
  if (score2 ==5 && !multi) {
    text("You Lose", 300, 150); 
    println(1);
  } else if (!multi) { 
    text("You Win", 300, 150); 
    println(2);
  } else if (score == 5) {
    text("Player 1 Wins!", 300, 150); 
    println(3);
  } else {
    text("Player 2 Wins", 300, 150); 
    println(4);
  }
}

void slider(){
  //Shows a slider on the top of the box that shows the selected difficulty
  //Colors are on a gradient scale which doesnt change, and the alpha for each changes 
  strokeWeight(2);
  stroke(0);
  pushMatrix();
  rotateX(HALF_PI);
  fill(#04C32B);
  rect(200,100,50,50);
  if (difficulty >= 2) fill(#35C604);
  else fill(#35C604,10);
  rect(200,200,50,50);
  if (difficulty >= 3) fill(#90C805);
  else fill(#90C805,10);
  rect(200,300,50,50);
  if (difficulty >= 4) fill(#CCA906);
  else fill(#CCA906,10);
  rect(200,400,50,50);
  if (difficulty >= 5) fill(#CF5006);
  else fill(#CF5006,10);
  rect(200,500,50,50);
  popMatrix();
}