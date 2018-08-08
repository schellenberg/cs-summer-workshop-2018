class Bullet {
  //Making all of the variables
  float bsize = 10;
  int delay;
  PVector bspeed;
  PVector position;
  PVector velocity;
  boolean clear0 = true;
  boolean clear1= true;
  Boolean clear2= true;
  Boolean clear3= true;
  Boolean clear4= true;

  
  //When bullet is called it requires its x position, y position, x velocity and y velocity
  Bullet(float x, float y, float vx, float vy) {
    delay = 20;
    bspeed = new PVector(10, 10);
    position = new PVector(x, y);
    velocity = new PVector(vx*5, vy*5);
  }
  
  
  //When moving the bullet, the velocity is added to the position.
  void move() {
    position = position.add(velocity);
  }
  
  //Drawing the bullet
  void display() {
    fill(200);
    ellipse(position.x, position.y, bsize, bsize);
  }
  
  
  //If the bullet touches the barriers, tanks or leaves the screen then it will dissapear. 
  boolean isAlive() {
    if ((position.x>1200)||(position.x< 0)||(position.y> 1200)||(position.y<0)||  (clear0 == false) || (clear1 == false)|| (clear2 == false)|| (clear3 == false)|| (clear4 == false)) {
      return false;
    } else return true;
  }
  

  
  
  //Each clear function 0 - 2 determines if the bullet runs into a certain barrier
  void clear0(float right_, float left_, float up_, float down_) {
    if ((int(position.x) < right_)&&(int(position.x)  > left_)) {
      if ((int(position.y) > up_)&&(int(position.y)< down_)) {
        clear0 = false;
      } else clear0 = true;
    } else clear0 = true;
  }


  void clear1(float right1_, float left1_, float up1_, float down1_) {
    if ((int(position.x)  < right1_)&&(int(position.x)  > left1_)) {
      if ((int(position.y) > up1_)&&(int(position.y)  < down1_)) {
        clear1 = false;
      } else clear1 = true;
    } else clear1 = true;
  }


  void clear2(float right2_, float left2_, float up2_, float down2_) {
    if ((int(position.x)  < right2_)&&(int(position.x)  > left2_)) {
      if ((int(position.y)  > up2_)&&(int(position.y)  < down2_)) {
        clear2 = false;
      } else clear2 = true;
    } else clear2 = true;
  }


//Each clear function 3-4 determines if the bullet runs into the tanks
  void clear3(float right3_, float left3_, float up3_, float down3_) {
    if ((int(position.x)  < right3_)&&(int(position.x)  > left3_)) {
      if ((int(position.y)  > up3_)&&(int(position.y)  < down3_)) {
        clear3 = false;
      } else clear3 = true;
    } else clear3 = true;
  }


  void clear4(float right4_, float left4_, float up4_, float down4_) {
    if ((int(position.x)  < right4_)&&(int(position.x)  > left4_)) {
      if ((int(position.y)  > up4_)&&(int(position.y)  < down4_)) {
        clear4 = false;
      } else clear4 = true;
    } else clear4 = true;
  }
}