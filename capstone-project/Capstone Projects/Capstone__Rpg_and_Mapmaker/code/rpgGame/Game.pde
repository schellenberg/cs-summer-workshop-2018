//Main class used to handle and store all game objects and run the game
class Game {

  //CLASS VARIABLES 

  PImage[] tiles = new PImage[23]; //holds the tile images
  ArrayList<Integer> pressedKeys = new ArrayList<Integer>(); //used to hold keypresses

  Map[][] gameMaps = new Map[3][3]; //2d array to track all the maps in the game
  int currentMapY = 2; // tracks the current row of maps to be displayed - start on the third row 
  int currentMapX = 1; // tracks the current map (column) to be displayed in the row - start on the second map in the row

  //game objects
  Player player;
  BlobEnemy blob;
  
  boolean gameover = false; //decides whether the game is done or not


  //CLASS CONSTRUCTOR

  Game() {
    noTint(); //get rid of any possible previous tinting from subsequent games
    
    //load tile images
    loadImages();

    //load all maps in to memory
    for (int i = 0; i < gameMaps.length; i++) {
      for (int j = 0; j < gameMaps[i].length; j++) {
        gameMaps[i][j] = new Map(new File(sketchPath() + "/../_resources/levels/rayce-game_level_" + i + "_" + j + ".rmap"));
      }
    }
    
    //init game objects
    player = new Player(int(TILE_SIZE*GAME_COLS/2)-(TILE_SIZE/2), int(TILE_SIZE*GAME_ROWS/2)+(TILE_SIZE/2), 6);
    blob = new BlobEnemy(int(TILE_SIZE*GAME_COLS/4), int(TILE_SIZE*GAME_ROWS/2), 3);
  }//end Game constructor


  //CLASS METHODS

  //Runs the game - display the map and all game objects if the game is on
  void run() {
    gameMaps[currentMapY][currentMapX].display();
    player.display();
    blob.display();
    displayPlayerHealth();
    
    //If the game is over, display the ending gameover text
    if(gameover) displayGameover();
  }//end run method

  //Loads the game images in to memory
  private void loadImages() {
    //load tile images
    for (int i = 0; i < tiles.length; i++) {
      tiles[i] = loadImage(sketchPath() + "/../_resources/imgs/rayce-game_map_" + i + ".png");
    }
  }//end loadImages method
  
  //displays the player's health in the top right corner
  void displayPlayerHealth(){
    fill(255,255,0);
    textAlign(RIGHT);
    textSize(width*0.07);
    text(player.getHealth(), width-(width*0.005), width*0.07);
  }//end displayPlayerHealth
  
  //Displays the gameover message and checks for a new game
  void displayGameover(){
    tint(255,128); //apply a small white tint
    fill(0); //text is black
    textAlign(CENTER); //text drawn horizontally centered
    
    //display ending text
    textSize(width*0.13);
    text("GAMEOVER!", width/2, height/2);
    
    //prompt the user to play again
    textSize(width*0.05);
    text("Press enter to play again", width/2, height*0.6);
    
    //if the user presses enter, start a new game
    if(pressedKeys.contains(10)){
      game = new Game();
    }
  }//end displayGameover

  // ***checkKeysPressed and checkKeysReleased***
  // - methods used to handle simultaneous key presses - when key is pressed down, add that to an arraylist. When the key is released, take it off the arraylist
  // - NOTE: Must be called inside main programs keyPressed() and keyReleased() functions respectively
  public void checkKeysPressed() {
    if (!pressedKeys.contains(keyCode)) {
      pressedKeys.add(keyCode);
    }
  }//end checkKeysPressed
  public void checkKeysReleased() {
    if (pressedKeys.contains(keyCode)) {
      pressedKeys.remove(pressedKeys.indexOf(keyCode));
    }
  }//end checkKeysReleased

  //Sets the current map location to the desired map location
  void setCurrentMap(int mapNumY, int mapNumX) {
    currentMapY = mapNumY;
    currentMapX = mapNumX;
  }//end setCurrentMap

  //getter methods
  Map getCurrentMap() {return gameMaps[currentMapY][currentMapX];}
  int getCurrentMapX() {return currentMapX;}
  int getCurrentMapY() {return currentMapY;}
  
}//end Game class