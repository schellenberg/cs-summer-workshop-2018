//Class used to make the player and control its features
class Player extends Sprite{

  //CLASS VARIABLES

  PImage[][] playerImgs = new PImage[4][4]; //holds the player animations
  int imgCounter = 0; //tracks the position of the current animation
  
  boolean attacking = false; //used to decide whether the player has swung their sword or not
  boolean oneHit = true; //used to restrict the sword to only be able to attack once per spacebar press
  

  //CLASS CONSTRUCTOR

  Player(int x_, int y_, int maxHealth_) {
    super(x_, y_, maxHealth_);
    loadPlayerImages();
  }//end Player constructor


  //CLASS METHODS

  //Loads the player animation images in to memory
  private void loadPlayerImages() {
    for (int i = 0; i < playerImgs.length; i++) {
      for (int j = 0; j < playerImgs[i].length; j++) {
        playerImgs[i][j] = loadImage("/../_resources/imgs/rayce-game_player_" + i + "_" + j + ".png");
      }
    }
  }//end loadPlayerImages method

  //Moves the player by the arrow keys
  void checkPlayerKeys() {
    if (game.pressedKeys.contains(RIGHT) || game.pressedKeys.contains(LEFT) || 
        game.pressedKeys.contains(DOWN) || game.pressedKeys.contains(UP)) {   
          
      //play the player animation    
      imgCounter++;
      if (imgCounter > 1) imgCounter = 0;
      
      //Did the user press the right arrow key?
      if (game.pressedKeys.contains(RIGHT)) {
        //Change player imgs to the facing right anim
        currentDir = DIR_RIGHT;
        
        //Is the player on the right edge of the scene?
        if (x >= (GAME_COLS*TILE_SIZE)-TILE_SIZE) {
          //Change to the map that is right of the current map (+1 over in gameMapsX) if there is a map there
          if (game.getCurrentMapX() < game.gameMaps[game.getCurrentMapY()].length-1) game.setCurrentMap(game.currentMapY, game.currentMapX+1);
          //change player position to the left side of the screen (mimics walking in to a new room)
          x = 0;
          //simulate making a new blob
          game.blob.reset();
        }
        //the player is in a moveable area - move the player
        else{
          move(DIR_RIGHT, speed);
        }
      }
      
      //Did the user press the left arrow key?
      if (game.pressedKeys.contains(LEFT)) {
        //Change player imgs to the facing left anim
        currentDir = DIR_LEFT;
        
        //Is the player on the left edge of the scene?
        if (x <= 0) {
          //Change to the map that is left of the current map (-1 over in gameMapsX) if there is a map there
          if (game.getCurrentMapX() > 0) game.setCurrentMap(game.getCurrentMapY(), game.getCurrentMapX()-1);
          //change player position to the right side of the screen (mimics walking in to a new room)
          x = (GAME_COLS*TILE_SIZE)-TILE_SIZE;
          //simulate making a new blob
          game.blob.reset();
        }
        //the player is in a moveable area - move the player
        else{
          move(DIR_LEFT, speed);
        }
      }
      
      //Did the user press the down arrow key?
      if (game.pressedKeys.contains(DOWN)) {
        //Change player imgs to the facing down anim
        currentDir = DIR_DOWN;
        
        //Is the player on the bottom edge of the scene?
        if (y >= (GAME_ROWS*TILE_SIZE)-TILE_SIZE) {
          //Change to the map that is below the current map (+1 over in gameMapsY) if there is a map there
          if (game.getCurrentMapY() < game.gameMaps.length-1) game.setCurrentMap(game.getCurrentMapY()+1, game.getCurrentMapX());
          //change player position to the top side of the screen (mimics walking in to a new room)
          y = 0;
          //simulate making a new blob
          game.blob.reset();
        }
        //the player is in a moveable area - move the player
        else{
          move(DIR_DOWN, speed);
        }
      }
      
      //Did the user press the up arrow key?
      if (game.pressedKeys.contains(UP)) {
        //Change player imgs to the facing up anim
        currentDir = DIR_UP;
        
        //Is the player on the top edge of the scene?
        if (y <= 0) {
          //Change to the map that is above the current map (-1 over in gameMapsY) if there is a map there
          if (game.getCurrentMapY() > 0) game.setCurrentMap(game.getCurrentMapY()-1, game.getCurrentMapX());
          //change player position to the bottom side of the screen (mimics walking in to a new room)
          y = (GAME_ROWS*TILE_SIZE)-TILE_SIZE;
          //simulate making a new blob
          game.blob.reset();
        }
        //the player is in a moveable area - move the player
        else{
          move(DIR_UP, speed);
        }
      }
      
    }
    //the player is not attempting to move - show an idle image
    else {
      imgCounter = 0;
    }
    
    //has the user pressed the space bar?
    if(game.pressedKeys.contains(32)){
      //Is this the first time the spacebar has been detected to be pressed?
      if(oneHit){
        //show sword animation
        imgCounter = 2;
        //set attacking to true
        attacking = true;
        //set to true to disallow multiple hits with one spacebar press
        oneHit = false;
      }
    }
    //the user is not pressing the spacebar, set attacking to false and oneHit back to true
    else{
      attacking = false;
      oneHit = true;
    }
  }//end move method

  //Draws the player on to the scene
  void display() {
    //is the player alive?
    if(alive){
      //Check the keys being pressed
      if (frameCount % 4 == 0) {
        checkPlayerKeys();
      }
      //check for collisions with other sprites
      checkCollisions();
    }
    checkGameover();
    
    //is the player in a walking animation? - draw animation at regular position/dimensions
    if(imgCounter <= 1 || imgCounter == 3) super.display(playerImgs, currentDir, imgCounter, x, y, w, h);
    //the player is in a sword animation - draw animation at modified positions/dimensions to account for different sized images
    else {
      if(currentDir == DIR_RIGHT) super.display(playerImgs, currentDir, imgCounter, x, y, int(w*1.75), h);
      else if(currentDir == DIR_LEFT) super.display(playerImgs, currentDir, imgCounter, x-int(w*0.75), y, int(w*1.75), h);
      else if (currentDir == DIR_DOWN) super.display(playerImgs, currentDir, imgCounter, x, y, w, int(h*1.75));
      else super.display(playerImgs, currentDir, imgCounter, x, y-int(h*0.75), w, int(h*1.75));
    }
  }//end display method
  
  //Checks for collisions with the player
  void checkCollisions(){
    //is the player currently attacking? - collision in favor of player
    if(attacking){
      //temporary position and dimension variables to account for the different sized attacking images
      int x_=x, y_=y, w_=w, h_=h;
      
      //is the player attacking either left or right?
      if(currentDir == DIR_RIGHT || currentDir == DIR_LEFT){
        //set the width of the player to the proper sword image width
        w_ = int(w*1.75);
        //is the player attacking left? - change x to account for the new top left corner
        if(currentDir == DIR_LEFT) x_ = x-int(w*0.75);
      }
      //the player is attacking either down or up
      else{
        //set the height of the player to the proper sword image height
        h_ = int(h*1.75);
        //is the player attacking up? - change y to account for the new top left corner
        if(currentDir == DIR_UP) y_ = y-int(h*0.75);
      }
      
      //Is the blob alive/visible?
      if(game.blob.isAlive()){
        //Is there a collision between the blob and the player? - take away health from the blob and push them back
        if(isRectCollision(x_, y_, w_, h_, game.blob.x, game.blob.y, game.blob.w, game.blob.h)){
          game.blob.health--;
          game.blob.move(currentDir, 3);
        }
        
        //if the blob has no health left, set its alive property to false
        if(game.blob.health <= 0) game.blob.setAlive(false);
      }
    }
    //the player is not attacking - collision in favor of the enemies
    else{
      //Is the blob alive/visible?
      if(game.blob.isAlive()){
        //Is there a collision between the blob and the player? - take away health from the player and push the player back
        if(isRectCollision(x, y, w, h, game.blob.x, game.blob.y, game.blob.w, game.blob.h)){
          health--;
          
          //find opposite direction for 'push the player back'
          int oppDir = currentDir+2;
          if(oppDir > 3) oppDir = oppDir - 4;
          
          //push the player back
          move(oppDir, 3);
        }
      } 
    }
    
    //Is the player out of health? - kill the player
    if(health <= 0) alive = false;
  }//end checkCollisions method
  
  //Checks if the player is alive or not
  void checkGameover(){
    //Is the player dead?
    if(!alive){
      imgCounter = 3;
      game.gameover = true;
    }
  }//end checkGameover
  
}//end Player class