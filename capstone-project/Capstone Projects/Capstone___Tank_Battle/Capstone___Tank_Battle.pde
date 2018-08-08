// Tank Fighter
// A Players vs. CPU tank battle game
// Library needed: none


maintank maintank;
enemytank enemytank;
Barrier barrier;
//Making the list that will hold all of the shots
ArrayList<Bullet> shots = new ArrayList<Bullet>();
//Creating all of the variables
PImage[] explosions = new PImage[11];
PVector bdirection;
Boolean Hit;
Boolean Hit1;
Boolean Hit2;
Boolean Hit3;
Boolean reload;
boolean end = false;
int aiMovement;
int list = 0;
int currentFrame = -1;
float explosionx;
float explosiony;
float whichTank;


void setup() {
  imageMode(CENTER);
  //Loading all the images used for the explosion animation
  for (int i = 1; i < 12; i += 1) {
    explosions[list] = loadImage("explosion"+ str(i) + ".png");
    list++;
  }
  textSize(50);
  size(1000, 1000);
  //Calling the maintank class, the enemytank class and the barrier class
  maintank = new maintank();
  enemytank = new enemytank(900, 100);
  barrier = new Barrier();
}


void draw() {
  background(0);
  //Hit, Hit1, Hit2 represent the 3 barriers. If they are true it means that barrier is seen in the direction the enemytank is looking. 
  Hit = enemytank.lineRect(enemytank.position.x, enemytank.position.y, enemytank.lx, enemytank.ly, barrier.x, barrier.y, barrier.w, barrier.h);
  Hit1 = enemytank.lineRect(enemytank.position.x, enemytank.position.y, enemytank.lx, enemytank.ly, barrier.x1, barrier.y1, barrier.w1, barrier.h1);
  Hit2 = enemytank.lineRect(enemytank.position.x, enemytank.position.y, enemytank.lx, enemytank.ly, barrier.x2, barrier.y2, barrier.w2, barrier.h2);
  //Hit3 represents the maintank. If true, it means the maintank is in the direction the enemytank is looking
  Hit3 = enemytank.lineRect(enemytank.position.x, enemytank.position.y, enemytank.lx, enemytank.ly, maintank.position.x -40, maintank.position.y - 40, 80, 80);
  enemyShoot();
  //If the enemytank sees the maintank then reload becomes true. When it does not see the maintank then reload is false. 
  //This makes it so the enemytank wont shoot multiple bullets instead of 1 when it sees the maintank
  if (Hit3 == true) reload = true;
  if (Hit3 == false)reload = false;
  enemytank.display(maintank.position.y, maintank.position.x);
  enemytank.scan();
  enemyShoot();
  enemytank.move();
  
  tankCollision();
  
  maintank.display();
  maintank.move();
  maintank.reset();
  maintank.reload --;
  
  moveShots();
  
  barrier.display();
  barrierCollision();
  
  
  //If the currentFrame gets switched to above 0 then an explosion occures
  if(currentFrame > 0)explosion();

  end();
}


//Takes in the starting position of the bullet and where it will be headed
void shoot(PVector bposition, float bdirectionx, float bdirectiony) {
  bdirection = new PVector(bdirectionx, bdirectiony);
  bdirection = bdirection.sub(bposition);
  bdirection.normalize();
  //Adds a new bullet to the list with the direction and where it will be headed
  shots.add(new Bullet(bposition.x, bposition.y, bdirection.x, bdirection.y));
}


//If the mouse is pressed, its not the end of the game and reload is less then 50 a new bullet will be created at the position of the maintank and headed towards the mouse.
void mousePressed() {
  if (end == false && maintank.reload < 0) {
    shoot(maintank.position, mouseX, mouseY);
    maintank.reload = 50;
  }
}


//If the enter key is pressed and its the end of the game then the game will reset
void keyPressed() {
  if ((keyCode == ENTER) && (end = true)) {
    maintank = new maintank();
    enemytank = new enemytank(900, 10);
    barrier = new Barrier();
    end = false;
  }
}


//For each bullet in the list, moveShots will call all of the functions
void moveShots() {
  for (int i = 0; i < shots.size(); i++) {
    shots.get(i).delay--;
    shots.get(i).move();
    shots.get(i).display();
    shots.get(i).clear0(barrier.right, barrier.left, barrier.up, barrier.down);
    shots.get(i).clear1(barrier.right1, barrier.left1, barrier.up1, barrier.down1);
    shots.get(i).clear2(barrier.right2, barrier.left2, barrier.up2, barrier.down2);
    //Prevents the bullet from colliding with the tank it was shot from
    if (shots.get(i).delay <= 0) {
      shots.get(i).clear3(maintank.position.x+40, maintank.position.x-40, maintank.position.y-40, maintank.position.y+40);
      shots.get(i).clear4(enemytank.position.x+40, enemytank.position.x-40, enemytank.position.y-40, enemytank.position.y+40);
    }
    //If the shot hits the maintank and the maintank still has more than 0 lives then a life will be taken away. 
    //Which tank is also switched to 1 and currentFrame goes to 1 meaning the explosion will be called
    if (shots.get(i).clear3 == false && maintank.lives>0) {
      maintank.lives--;
      whichTank = 1;
      currentFrame = 1;
    }
    //If the shot hits the enemytank and the enemytank still has more than 0 lives then a life will be taken away. 
    //Which tank is also switched to 2 and currentFrame goes to 1 meaning the explosion will be called
    if (shots.get(i).clear4 == false&&enemytank.lives>0) {
      enemytank.lives--;
      whichTank = 2;
      currentFrame = 1;
    }
    //If a bullet hits the barriers then whichTank is set to 3 and the position of where the bullet struck the barrier is stored in explosionx and explosiony
    //currentFrame is also switched to 1 meaning the explosion will be called
    if ((shots.get(i).clear0 == false) || (shots.get(i).clear1 == false)|| (shots.get(i).clear2 == false)){
      explosionx = shots.get(i).position.x;
      explosiony = shots.get(i).position.y;
      currentFrame = 1;
      whichTank = 3;
    }
    if (shots.get(i).isAlive() ==false)shots.remove(i);
  }
}


//Determines if the tanks collide with the barriers
void barrierCollision() {
  maintank.clear0(barrier.right, barrier.left, barrier.up, barrier.down);
  maintank.clear1(barrier.right1, barrier.left1, barrier.up1, barrier.down1);
  maintank.clear2(barrier.right2, barrier.left2, barrier.up2, barrier.down2);
  enemytank.clear0(barrier.right, barrier.left, barrier.up, barrier.down);
  enemytank.clear1(barrier.right1, barrier.left1, barrier.up1, barrier.down1);
  enemytank.clear2(barrier.right2, barrier.left2, barrier.up2, barrier.down2);
}


//If its not the end of the game and the enemytank is looking at the maintank without looking at any barriers then it will shoot at the maintank. 
void enemyShoot() {
  if (end == false ) {
    if ((Hit == false)&&(Hit1 == false)&&(Hit2 == false)&&(Hit3 == true)&&(reload == false)) {
      shoot(enemytank.position, maintank.position.x, maintank.position.y);
    }
  }
}


//If the maintank has 0 lives or the enemytank has 0 lives then its the end of the game. 
//Tells you if you've won or loss and asks if you want to play again. 
void end() {
  textAlign(CENTER, CENTER);
  fill(150, 0, 150);
  if (enemytank.lives == 0) {
    end = true;
    text("You Win!!", width/2, height/2);
    text("Press ENTER To Play Again", width/2, height/2+ 50);
  } else if (maintank.lives == 0) {
    end = true;
    text("Better Luck Next Time", width/2, height/2);
    text("Press ENTER To Play Again", width/2, height/2+ 50);
  }
}


//If the tanks tpuch then they will move in opposite diretions. 
void tankCollision(){
  if (enemytank.tankCollide(maintank.position.x+40, maintank.position.x-40, maintank.position.y-40, maintank.position.y+40) == false) {
    if (enemytank.position.y>maintank.position.y) {
      enemytank.position.y+= 2;
      maintank.position.y -= 2;
    } else {
      enemytank.position.y-= 2;
      maintank.position.y += 2;
    }
  }
}


//Does an explosion animation if a bullet hits either one of the tanks or a barrier
void explosion() {
  //If whichTank is 1 then the explosion is drawn at the maintank
    if (whichTank == 1)image(explosions[currentFrame], maintank.position.x, maintank.position.y);
    //If whichTank is 2 then the explosion is drawn at the enemytank
    else if (whichTank == 2)image(explosions[currentFrame], enemytank.position.x, enemytank.position.y);
    //If whichTank is neither 1 or 2 then the explosion is drawn at the spot the bullet struck a barrier. 
    else image(explosions[currentFrame], explosionx, explosiony);
    if (frameCount%3 == 0)currentFrame += 1;
    //If the currentFrame exceeds 10(#number of images for explosion) it will be reset to -1. 
    if (currentFrame > 10)currentFrame = -1;
  }