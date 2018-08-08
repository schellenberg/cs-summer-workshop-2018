class enemytank {
  //Creating all of the variables
  PVector position = new PVector();
  PImage base;
  PImage shooter;
  float a;
  float bsize;
  float bspeed;
  float rotation = 0;
  float lx = 0;
  float ly = 0;
  float intersectionX;
  float intersectionY;
  int aiMovement;
  int lives = 3;
  int speed = 2;
  boolean clear0;
  boolean clear1;
  Boolean clear2;


  //When an enemytank is created it requires the x and y position
  enemytank(float x, float y) {
    position.x = x;
    position.y = y;
  }
  

  //When display is called it requires an x position and y position. This is because it needs to know the x and y position of the maintank so its gun can point in right direction.
  void display(float mainy, float mainx ) {
    reset();
    base = loadImage("enemytank.png");
    shooter = loadImage("enemyshooter.png");
    image(base, position.x, position.y);
    fill(255);
    //Rotates the gun depending on where the maintank is. 
    pushMatrix();
    translate(position.x, position.y);
    float a = atan2(mainy-position.y, mainx-position.x);
    rotate(radians(270));
    rotate(a);
    image(shooter, 0, 20);
    popMatrix();
    lives();
  }



//If its not end game then moving will be aloud
  void move() {
    if (end == false) {
      //If the remainder of frameCount divided by 100 is 0 then a new direction will be chosen for the enemytank
      //This expression is added so the tank doesnt change directions each frame
      if (frameCount%100 == 0) {
        aiMovement = int(random(1, 5));
      }
      
       //aiMovement pick eaither 1, 2, 3 or 4 and depending on that number is the direction it will go. 
       //The enemytank wont move if its outside of the window
      if (aiMovement == 1) {
        if (position.x<width-40)position.x += speed;
        else {
          position.x -= 2;
          aiMovement = int(random(1, 5));
        }
      }
      if (aiMovement== 2) {
        if (position.x>0+40)position.x -= speed;
        else {
          position.x += 2;
          aiMovement = int(random(1, 5));
        }
      }
      if (aiMovement == 3) {
        if (position.y>0+40)position.y -= speed;
        else {
          position.y += 2;
          aiMovement = int(random(1, 5));
        }
      }
      if (aiMovement == 4) {
        if (position.y<height-40)position.y += speed;
        else {
          position.y -= 2;
          aiMovement = int(random(1, 5));
        }
      }
    }
  }



//Each time through scan a line will be drawn. The direction changes each time. One end of the line is on enemytank while the other side rotates around the outside of the window
//This is done so we can determine if the enemytank spots the maintank without also viewing the barriers. 
  void scan() {
    stroke(254, 0);
    frameRate(100);
    

    if ((lx >= 0)&&(ly == 0)&&(lx<1000))lx+= 40;
    else if ((lx == 1000)&&(ly>=0)&&(ly<1000)) ly+=40;
    else if ((ly == 1000)&&(lx>0)&&(lx<=1000)) lx-=40;
    else if ((lx == 0)&&(ly>0))ly-=40;
    //println(lx, ly);


    line(position.x, position.y, lx, ly);
  }


//Clear functions determine if the enemytank is touching any of the barriers
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



//lineLine figures out if 2 different lines are touching
//This function is then used in lineRect
  boolean lineLine(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    float A = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
    float B = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
    if (A >= 0 && A <= 1 && B >= 0 && B <= 1) {
      return true;
    }
    return false;
  }


//This function checks collision detection between line and rectangle.
//This function uses the function lineLine with all of the sides of a square and the line at hand
  boolean lineRect(float x1, float y1, float x2, float y2, float rx, float ry, float rw, float rh) {
    boolean left =   lineLine(x1, y1, x2, y2, rx, ry, rx, ry+rh);
    boolean right =  lineLine(x1, y1, x2, y2, rx+rw, ry, rx+rw, ry+rh);
    boolean top =    lineLine(x1, y1, x2, y2, rx, ry, rx+rw, ry);
    boolean bottom = lineLine(x1, y1, x2, y2, rx, ry+rh, rx+rw, ry+rh);
    if (left || right || top || bottom) {
      return true;
    }
    return false;
  }


//Returns true if the enemytank is not touching any of the barriers
  Boolean allClear() {
    if ((clear0)&&(clear1)&&(clear2))return true;
    else return false;
  }

//Checks collision between the maintank and the enemytank
  Boolean tankCollide(float right, float left, float up, float down) {
    if (position.x -40 < right && position.x+40 > left && position.y - 40 < down && position.y +40 > up) return false;
    else return true;
  }


//Craetes the lifebar below the enemytank
  void lives() {
    stroke(254);
    noFill();
    rect(position.x-40, position.y +50, 80, 10);
    noStroke();
    fill(255, 0, 0);
    rect(position.x - 39, position.y +51, map(lives, 0, 3, 0, 79), 9);
  }


//If the tank touches the barriers then it will move in the opposite direction
  void reset() {
    if (((int(position.x) > 160 && (int(position.x) < 180 )||(int(position.x) > 580) && (int(position.x) < 600) )&&(allClear() == false))) {
      aiMovement = 2;
      position.x -=4;
    }
    if (((int(position.x) < 360 && int(position.x) > 340)||(int(position.x) < 790 && int(position.x) > 760))&&(allClear() == false)) {
      aiMovement = 1;
      position.x +=4;
    }
    if (((int(position.y) == 136)||(int(position.y) == 586)||(int(position.y) == 262))&&(allClear() == false)) {
      aiMovement = 3;
      position.y -= 4;
    }
    if (((int(position.y) == 414)||(int(position.y) == 864)||(int(position.y) == 738))&&(allClear() == false)) {
      aiMovement = 4;
      position.y += 4;
    }
  }
}