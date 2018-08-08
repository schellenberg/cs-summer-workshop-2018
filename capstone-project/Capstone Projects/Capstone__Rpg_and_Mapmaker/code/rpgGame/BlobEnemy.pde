//Class for making blob enemies. Inherits from sprite
class BlobEnemy extends Sprite{
  
  //CLASS VARIABLES
  
  PImage[][] blobImgs = new PImage[4][1]; //holds the blob animations
  
  
  //CLASS CONSTRUCTOR
  
  BlobEnemy(int x_, int y_, int maxHealth_){
    super(x_, y_, maxHealth_);
    loadBlobImages();
  }//end BlobEnemy constructor
  
  
  //CLASS METHODS
  
  //Loads the blob animation images in to memory
  private void loadBlobImages(){
    for (int i = 0; i < blobImgs.length; i++) {
      for (int j = 0; j < blobImgs[i].length; j++) {
        blobImgs[i][j] = loadImage("/../_resources/imgs/rayce-game_enemy_blob_" + ((i*blobImgs[i].length)+j) + ".png");
      }
    }
  }//end loadBlobImages method
  
  //displays the blob on to the screen
  void display(){
    //Change the blob animation every 12 frames
    if(frameCount % 12 == 0){
      currentDir++;
      if (currentDir > blobImgs.length-1) currentDir = 0;
    }
    
    //display the blob if it is alive
    if(alive){
      super.display(blobImgs, currentDir, 0, x, y, w, h);
    }
  }//end display method
  
  //Give the blob a random location on the map
  void setRandomLocation(){
    //give the blob a random x and y position until it is in a valid position (not on any unwalkable tiles, onscreen, and not on the player)
    do{
      x = int(random(0, GAME_COLS-1))*TILE_SIZE;
      y = int(random(0, GAME_ROWS-1))*TILE_SIZE;
    } while(!game.getCurrentMap().grid[y/TILE_SIZE][x/TILE_SIZE].isWalkable() || (x == game.player.x && y == game.player.y));
  }//end setRandomLocation method
  
  //Crude simulation for making a new blob - reset important variables
  void reset(){
    setRandomLocation(); //give the blob a random position on the map
    health = maxHealth;
    alive = true;
  }//end reset method
  
}//end BlobEnemy class