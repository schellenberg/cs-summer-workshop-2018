//Template class used to make a general animated sprite. Used for the player and enemies
class Sprite{

  //CLASS VARIABLES
  
  int DIR_RIGHT = 0, DIR_DOWN = 1, DIR_LEFT = 2, DIR_UP = 3; //constants for sprite's direction
  int currentDir; //tracks the current direction of the sprite
  
  int x, y, w, h; //position and dimensions
  int health, maxHealth; //tracks the health and the maximum health of the sprite
  int speed; //used for how fast a sprite goes
  boolean alive; //tracks the status of the sprite
  
  
  //CLASS CONSTRUCTOR
  
  Sprite(int x_, int y_, int maxHealth_){
    x = x_;
    y = y_;
    w = TILE_SIZE;
    h = TILE_SIZE;
    maxHealth = maxHealth_;
    health = maxHealth;
    speed = 1;
    alive = true;
    currentDir = DIR_DOWN;
  }//end Sprite constructor
  
  
  //CLASS METHODS
  
  //moves the sprite over in the specified direction by the number of half tiles given
  // dist: the number of half tiles desired to move
  void move(int dir, int dist){
    //is the dist a valid distance? (1 or more)
    if(dist >= 1){
      
      //the sprite wants to move right
      if (dir == DIR_RIGHT) {
        //Is the sprite anywhere but the right edge of the scene?
        if (x < (GAME_COLS*TILE_SIZE)-TILE_SIZE) {
          //If the player can move to the right without hitting a non-walkable tile, move half a tile to the right.
          if (game.getCurrentMap().grid[y/TILE_SIZE][(x/TILE_SIZE)+1].isWalkable() &&
            game.getCurrentMap().grid[(y+h-1)/TILE_SIZE][(x/TILE_SIZE)+1].isWalkable()) {
            x += TILE_SIZE/2;
          }
          //The player can not move any further in this direction
          else {
            //set dist equal to 0 because there is no need to check any further movements
            dist = 0;
          }
        }
        //The sprite can not move any further in this direction
        else {
          //set dist equal to 0 because there is no need to check any further movements
          dist = 0;
        }
      }
      
      //the sprite wants to move left
      else if (dir == DIR_LEFT) {
        //Is the sprite anywhere but the left edge of the scene?
        if (x > 0) {
          //If the user can move to the left without hitting a non-walkable tile, move half a tile to the left.
          if (game.getCurrentMap().grid[y/TILE_SIZE][((x+w-1)/TILE_SIZE)-1].isWalkable() &&
            game.getCurrentMap().grid[(y+h-1)/TILE_SIZE][((x+w-1)/TILE_SIZE)-1].isWalkable()) {
            x -= TILE_SIZE/2;
          }
          //The player can not move any further in this direction
          else {
            //set dist equal to 0 because there is no need to check any further movements
            dist = 0;
          }
        }
        //The sprite can not move any further in this direction
        else {
          //set dist equal to 0 because there is no need to check any further movements
          dist = 0;
        }
      }
      
      //the sprite wants to move down
      else if (dir == DIR_DOWN) {
        //Is the sprite anywhere but the bottom edge of the scene?
        if (y < (GAME_ROWS*TILE_SIZE)-TILE_SIZE) {
          //If the player can move downwards without hitting a non-walkable tile, move half a tile downwards.
          if (game.getCurrentMap().grid[(y/TILE_SIZE)+1][x/TILE_SIZE].isWalkable() &&
            game.getCurrentMap().grid[(y/TILE_SIZE)+1][((x+w-1)/TILE_SIZE)].isWalkable()) {
            y += TILE_SIZE/2;
          }
          //The player can not move any further in this direction
          else {
            //set dist equal to 0 because there is no need to check any further movements
            dist = 0;
          }
        }
        //The sprite can not move any further in this direction
        else {
          //set dist equal to 0 because there is no need to check any further movements
          dist = 0;
        }
      }
      
      //the sprite wants to move up
      else if (dir == DIR_UP) {
        //Is the sprite anywhere but the top edge of the scene?
        if (y > 0) {
          //If the player can move upwards without hitting a non-walkable tile, move half a tile upwards.
          if (game.getCurrentMap().grid[((y+h-1)/TILE_SIZE)-1][x/TILE_SIZE].isWalkable() &&
            game.getCurrentMap().grid[((y+h-1)/TILE_SIZE)-1][((x+w-1)/TILE_SIZE)].isWalkable()) {
            y -= TILE_SIZE/2;
          }
          //The sprite can not move any further in this direction
          else {
            //set dist equal to 0 because there is no need to check any further movements
            dist = 0;
          }
        }
        //The sprite can not move any further in this direction
        else {
          //set dist equal to 0 because there is no need to check any further movements
          dist = 0;
        }
      }
    }
    
    //If the sprite hasn't moved the proper distance, keep moving half a tile
    if(dist > 1) move(dir, dist-1);
  }//end move method
  
  //Draws the sprite on to the scene with a specific animation, x/y, and width/height
  void display(PImage[][] imgs, int row, int col, int x_, int y_, int w_, int h_) {
    //Draw the given animation at the given coordinates with the given dimensions
    image(imgs[row][col], x_, y_, w_, h_);
  }//end display method
  
  //Checks for a bounding box between two rectangles (sprites)
  boolean isRectCollision(int x1, int y1, int w1, int h1, int x2, int y2, int w2, int h2){
    //find the current sprites' dimensions
    int left1 = x1+1;
    int right1 = x1-1 + w1;
    int top1 = y1+1;
    int bottom1 = y1-1 + h1;
    
    //find the other sprites' dimensions
    int left2 = x2;
    int right2 = x2 + w2;
    int top2 = y2;
    int bottom2 = y2 + h2;
    
    //If the bounding box of one sprite is inside the bounding box othe other, return true as there is a collision
    if(left1 <= right2 && right1 >= left2){
      if(top1 <= bottom2 && bottom1 >= top2){
        return true;
      }
    }
    
    //There was no collision - return false
    return false;
  }//end isRectCollision
  
  //setters
  void setX(int x_){x = x_;}
  void setY(int y_){y = y_;}
  void setW(int w_){w = w_;}
  void setH(int h_){h = h_;}
  void setMaxHealth(int maxHealth_){maxHealth = maxHealth_;}
  void setHealth(int health_){health = health_;}
  void setCurrentDir(int currentDir_){currentDir = currentDir_;}
  void setAlive(boolean alive_){alive = alive_;}
  
  //getters
  int getX(){return x;}
  int getY(){return y;}
  int getW(){return w;}
  int getH(){return h;}
  int getMaxHealth(){return maxHealth;}
  int getHealth(){return health;}
  int getCurrentDir(){return currentDir;}
  boolean isAlive(){return alive;}
  
}//end Sprite class