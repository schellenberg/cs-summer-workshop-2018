//Class used to load and display in the different maps/environments
class Map {

  //CLASS VARIABLES

  Tile[][] grid; //2d array of tiles to hold every tile in the map/grid


  //CLASS CONSTRUCTOR

  Map(File mapFile) {
    grid = new Tile[GAME_ROWS][GAME_COLS];
    loadTilePositions(mapFile);
  }//end Map constructor


  //CLASS METHODS

  //Draws the map on to the screen
  void display() {
    for (int y = 0; y < GAME_ROWS; y++) {
      for (int x = 0; x < GAME_COLS; x++) {
        int index = grid[y][x].id;
        image(game.tiles[index], x*TILE_SIZE, y*TILE_SIZE);
      }
    }
  }//end display method

  //Loads the map tile positions
  private void loadTilePositions(File levelPath) {
    try {
      File mapFile = levelPath;

      //Does the map file exist?
      if (mapFile.exists()) {
        //Create a BufferReader to read the contents of the file
        BufferedReader br = new BufferedReader(new FileReader(mapFile));

        String line = ""; //empty string to be replaced with each row of text in the file
        int rows = 0; //used to run load each line of text in the file
        //Read each line (row) of text from the file until there are no lines (rows) left
        while ((line = br.readLine()) != null) {
          int cols = 0; //used to put each value from the file in the proper "x" position in the array

          //Take all of the tile information from the file and place in its own wrapper  
          String[] values = line.split(",");

          //Loop through all the values in the file and place them in to their corresponding map array position
          for (String v : values) {
            grid[rows][cols] = new Tile(int(v));
            if (grid[rows][cols].getId() >= 2) grid[rows][cols].setWalkable(false); //set all the non-walkable tiles to not be walkable

            cols++;
          }

          //read next and take values from the next line (row)
          rows++;
        }

        //Close the reader
        br.close();
      } else {
        println("Game Error! Missing valid map resource!");
        noLoop();
      }
    }
    catch(IOException e) {
      e.printStackTrace();
      noLoop();
    }
  }//end loadTilePositions
  
}//end Map class