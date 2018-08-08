 //<>//
class maintank {
  //Creates all of the the variables
  PVector position = new PVector(100, 900);
  PImage base;
  PImage shooter;
  PImage heart;
  float a;
  float bsize;
  float speed = 2;
  float bspeed;
  float reload = 50;
  int lives = 3;
  boolean clear0;
  boolean clear1;
  Boolean clear2;


  maintank() {
  }
  
  
 //Displays the maintank while the gun always follows the mouse
  void display() {
    base = loadImage("maintank.png");
    shooter = loadImage("mainshooter.png");
    heart = loadImage("heart.png");
    image(base, position.x, position.y);
    pushMatrix();
    translate(position.x, position.y);
    float a = atan2(mouseY-position.y, mouseX-position.x);
    rotate(radians(270));
    rotate(a);
    image(shooter, 0, 20);
    popMatrix();
    lives();
  }


//If its not the end of the game and its not touching any of the barriers then the maintank will move depending on what key you press. 
  void move() {
    if (end == false) {
      if ((clear0) &&(clear1) &&(clear2)) {
        if (keyPressed) {
          if (keyCode == RIGHT) {
            if (position.x<width-40)position.x += speed;
            else position.x -= 2;
          }
          if (keyCode == LEFT) {
            if (position.x>0+40)position.x -= speed;
            else position.x += 2;
          }
          if (keyCode == UP) {
            if (position.y>0+40)position.y -= speed;
            else position.y += 2;
          }
          if (keyCode == DOWN) {
            if (position.y<height-40)position.y += speed;
            else position.y -= 2;
          }
        }
      }
    }
  }


//All of the clear functions determine if the maintank is touching the barriers
  void clear0(float right_, float left_, float up_, float down_) {
    if ((int(position.x) -40 < right_)&&(int(position.x) +40 > left_)) {
      if ((int(position.y) +40 > up_)&&(int(position.y) -40 < down_)) {
        clear0 = false;
      } else clear0 = true;
    } else clear0 = true;
  }


  void clear1(float right1_, float left1_, float up1_, float down1_) {
    if ((int(position.x) -40 < right1_)&&(int(position.x) +40 > left1_)) {
      if ((int(position.y) +40 > up1_)&&(int(position.y) -40 < down1_)) {
        clear1 = false;
      } else clear1 = true;
    } else clear1 = true;
  }


  void clear2(float right2_, float left2_, float up2_, float down2_) {
    if ((int(position.x) -40 < right2_)&&(int(position.x) +40 > left2_)) {
      if ((int(position.y) +40 > up2_)&&(int(position.y) -40 < down2_)) {
        clear2 = false;
      } else clear2 = true;
    } else clear2 = true;
  }


//If the maintank touches any of the barriers then its movement will bounce back in the opposite direction
  void reset() {
    if (((int(position.x) == 162)||(int(position.x) == 586))&&(allClear() == false)) position.x -= 2;
    if (((int(position.x) == 364)||(int(position.x) == 788))&&(allClear() == false)) position.x += 2;
    if (((int(position.y) == 136)||(int(position.y) == 586)||(int(position.y) == 262))&&(allClear() == false)) position.y -= 2;
    if (((int(position.y) == 414)||(int(position.y) == 864)||(int(position.y) == 738))&&(allClear() == false)) position.y += 2;
  }


//Returns true if the maintank isnt touching any of the barriers
  Boolean allClear() {
    if ((clear0)&&(clear1)&&(clear2))return true;
    else return false;
  }


//Displays the maintank lives in the top left corner
  void lives() {
    pushMatrix();
    scale(0.2);
    if (lives >= 1)image(heart, 100, 100);
    if (lives >= 2)image(heart, 325, 100);
    if (lives >=3)image(heart, 550, 100);
    popMatrix();
  }


}