//Loads the tile images in to the tiles array/and the UI images
void loadImages() {
  //load tile images
  for (int i = 0; i < tiles.length; i++) {
    tiles[i] = loadImage(sketchPath() + "/../_resources/imgs/rayce-game_map_" + i + ".png");
  }

  //load ui save and load images
  saveMapImg = loadImage(sketchPath() + "/../_resources/imgs/rayce-game_ui_save.png");
  loadMapImg = loadImage(sketchPath() + "/../_resources/imgs/rayce-game_ui_load.png");
}//end loadImages

//Draws the user interface for selecting tiles 
void drawUI() {
  //UI TILES
  //draw the tile images on to the UI
  for (int i = 0; i < tiles.length; i++) {
    //If the tile can fit on the second row of the UI, draw it at the next available spot on the second row
    if (i < GAME_COLS) image(tiles[i], i*TILE_SIZE, (GAME_ROWS+(UI_ROWS-2))*TILE_SIZE);
    //The tile can't fit on the second row of UI, draw it at the next available spot on the third row
    else image(tiles[i], (i-GAME_COLS)*TILE_SIZE, (GAME_ROWS+(UI_ROWS-1))*TILE_SIZE);
  }

  //UI TILES GRID
  strokeWeight(1);
  stroke(0);
  //draw UI tiles horizontal grid lines
  for (int y = 1; y < UI_ROWS; y++) {
    line(0, (GAME_ROWS*TILE_SIZE)+(y*TILE_SIZE), width, (GAME_ROWS*TILE_SIZE)+(y*TILE_SIZE));
  }
  //draw UI tiles vertical grid lines
  for (int x = 1; x < GAME_COLS; x++) {
    line(x*TILE_SIZE, (GAME_ROWS+(UI_ROWS-2))*TILE_SIZE, x*TILE_SIZE, (GAME_ROWS+(UI_ROWS))*TILE_SIZE);
  }

  //UI SAVE AND LOAD IMAGE
  image(loadMapImg, (GAME_COLS-4)*TILE_SIZE, (GAME_ROWS)*TILE_SIZE);
  image(saveMapImg, (GAME_COLS-2)*TILE_SIZE, (GAME_ROWS)*TILE_SIZE);

  //OUTLINE AROUND SELECTED TILE
  int outlineSelectX; //decides x pos of outline
  int outlineSelectY; //decides y pos of outline
  //Is the selected tile on the second row of the UI? - x and y pos of outline should be on second row
  if (selectedTile < GAME_COLS) {
    outlineSelectX = selectedTile*TILE_SIZE;
    outlineSelectY = (GAME_ROWS+(UI_ROWS-2))*TILE_SIZE;
  }
  //The selected tile is in the third row of the UI - x and y pos of outline should be on third row
  else {
    outlineSelectX = (selectedTile-GAME_COLS)*TILE_SIZE;
    outlineSelectY = (GAME_ROWS+(UI_ROWS-1))*TILE_SIZE;
  }
  //draw a bold outline (rect with no fill) around the selected tile in the UI
  noFill();
  strokeWeight(5);
  stroke(255, 0, 0);
  rect(outlineSelectX, outlineSelectY, TILE_SIZE, TILE_SIZE);
}//end drawUI

//Draws the tiles to the appropriate position of the map grid
void drawMap() {
  for (int y = 0; y < GAME_ROWS; y++) {
    for (int x = 0; x < GAME_COLS; x++) {
      int index = level[y][x];
      image(tiles[index], x*TILE_SIZE, y*TILE_SIZE);
    }
  }
}//end drawMap

//Draws the grid to place the tiles in
void drawGameGrid() {
  strokeWeight(1);
  stroke(0);

  //draw horizontal grid lines
  for (int y = 1; y <= GAME_ROWS; y++) {
    line(0, y*TILE_SIZE, width, y*TILE_SIZE);
  }
  //draw vertical grid lines
  for (int x = 1; x < GAME_COLS; x++) {
    line(x*TILE_SIZE, 0, x*TILE_SIZE, GAME_ROWS*TILE_SIZE);
  }
}//end drawGrid

//Checks to see if the mouse is being pressed down
void checkMousePressed() {
  //is the mouse being pressed down?
  if (mousePressed) {
    //update the location of the mouse in comparison to the grid
    updateGridLoc();

    //Check for mouse press on screen
    if (gridLocY >=0 && gridLocX >= 0) {
      //If a tile of the game grid has been pressed, put a selected tile there
      if (gridLocY < GAME_ROWS && gridLocX < GAME_COLS) level[gridLocY][gridLocX] = selectedTile;
      //If a UI tile has been pressed, change the selected tile to that corresponding tile
      if ((gridLocY < GAME_ROWS+UI_ROWS && gridLocY > GAME_ROWS) && (gridLocX < GAME_COLS)) {
        selectedTile = checkSelectedTile(gridLocX+((gridLocY-GAME_ROWS-1)*GAME_COLS)); //parameter -> x + (y*width)
      }
      //If the UI save map button has been pressed, save the level
      if (gridLocY == GAME_ROWS && (gridLocX >= GAME_COLS-2 && gridLocX < GAME_COLS)) {
        saveMap();
        mousePressed = false; //set mousePressed to only allow clicks on saving maps - one click = one map save, don't want to accidentally save the map 30 times from holding the mouse button down for 1 sec
      }
      //If the UI save map button has been pressed, save the level
      if (gridLocY == GAME_ROWS && (gridLocX >= GAME_COLS-4 && gridLocX < GAME_COLS-2)) {
        loadMap();
        mousePressed = false; //set mousePressed to only allow clicks on saving maps - one click = one map save, don't want to accidentally save the map 30 times from holding the mouse button down for 1 sec
      }
    }
  }
}//end checkMousePressed

//Updates the current tile position in the grid
void updateGridLoc() {
  gridLocX = (mouseX/TILE_SIZE);
  gridLocY = (mouseY/TILE_SIZE);
}//end updateMouseLoc

//Checks to see if the tile desired from the UI exists. If it exists, selectedTile will be
//that desired tile. If not, selectedTile will stay at its previous known selectedTile
int checkSelectedTile(int desiredSelect) {
  return (desiredSelect < tiles.length) ? desiredSelect : selectedTile;
}//end checkSelectedTile

//Saves the 2D array "level" in to a rmap file
void saveMap() {
  //CONVERT 2D INT ARRAY "LEVEL" IN TO A STRING

  StringBuilder sb = new StringBuilder(); //makes the converted level string

  //loop through the level array and build a string of the level values with every row on its own line
  for (int y = 0; y < GAME_ROWS; y++) { //for rows of level
    for (int x = 0; x < GAME_COLS; x++) { //for columns of level
      //add the values of level to the string builder
      sb.append(level[y][x] + "");
      //As long as the value is not the last one in the row, add a comma between values
      if (x < GAME_COLS-1) sb.append(",");
    }
    //put the next row on its own line
    sb.append(System.lineSeparator());
  }

  //WRITE THE CONVERTED "LEVEL" ARRAY STRING TO A .RMAP FILE IN THE DATA FOLDER

  BufferedWriter bw = null; //BufferedWriter used to write the array to a rmap file
  File map = null; //holds the name and path of the .rmap file

  //Try to make a file out of "map" and place it in the levels folder of the resources folder
  try {
    //Find the levels folder in the resources folder - make a folder named "levels" if it is not found
    File levelsDir = new File(sketchPath() + "/../_resources/levels"); //directory of the levels folder
    if (!levelsDir.exists()) levelsDir.mkdirs();

    //Make a JFileChooser for saving the file - set starting directory to be the level folder 
    JFileChooser saveMapChooser = new JFileChooser(levelsDir);

    //Make levels number start from 0. If level_0_0 already exists, then increase the numbers until that level number
    // does not exist. This will be the recommended name of the specific .rmap file
    int numLevelX = 0;
    int numLevelY = 0;
    String desiredFileName = levelsDir + "/rayce-game_level_0_0.rmap";
    while (new File(desiredFileName).exists()) {
      numLevelX++;
      if(numLevelX > 2){
        numLevelX = 0;
        numLevelY++;
      }
      desiredFileName = levelsDir + "/rayce-game_level_" + numLevelY + "_" + numLevelX + ".rmap";
    }
    //Set the recommended file name
    saveMapChooser.setSelectedFile(new File(desiredFileName));

    //Create a filter to set the default extension to .rmap
    FileFilter filter = new FileNameExtensionFilter("RMAP file", "rmap");
    //Apply the filter
    saveMapChooser.setFileFilter(filter);
    //Disable the all files filter
    saveMapChooser.setAcceptAllFileFilterUsed(false);

    //Open the save map dialog
    int status = saveMapChooser.showSaveDialog(saveMapChooser);

    //Did the user pick or name a file to save?
    if (status == JFileChooser.APPROVE_OPTION) {
      //Set the abstract name of the desired file to the file that will be saved
      map = saveMapChooser.getSelectedFile();
      //If the extension of the abstract name is not of rmap type, then make the same file but add ".rmap" to the end of its name
      if (!getFileExtension(map).equals("rmap")) {
        String oldName = map.getAbsolutePath();
        map = new File(oldName + ".rmap");
      }

      //Create the level file 
      map.createNewFile();

      //Write the converted string array in to the newly made rmap file
      bw = new BufferedWriter(new FileWriter(map.getAbsolutePath()));
      bw.write(sb.toString());
    }
  }
  //Print out the stack trace incase an IO error occurs
  catch(IOException e) {
    e.printStackTrace();
  }
  //If the level file exists and the level was written to the level file, then flush/close the writer
  //give a message indicating a successful level save
  finally {
    try {
      if (bw != null && map != null) {
        bw.close();
        println("Map has been saved successfully to " + map.getCanonicalPath() + System.lineSeparator());
      }
    }
    catch(IOException e) {
    }
  }
}//end saveMap

//Loads a rmap file and converts it in to a map to be edited
void loadMap() {
  try {
    //Make a JFileChooser for loading the file - set starting directory to be the levels folder
    // - If the levels directory doesn't exist, make one
    File levelsDir = new File(sketchPath() + "/../_resources/levels"); //directory of the levels folder
    if (!levelsDir.exists()) levelsDir.mkdirs();
    JFileChooser loadMapChooser = new JFileChooser(levelsDir);

    //Create a filter to set the default extension to .rmap
    FileFilter filter = new FileNameExtensionFilter("RMAP file", "rmap");
    //Apply the filter
    loadMapChooser.setFileFilter(filter);
    //Disable the all files filter
    loadMapChooser.setAcceptAllFileFilterUsed(false);

    //Open the load map dialog
    int status = loadMapChooser.showOpenDialog(loadMapChooser);

    //Did the user pick or name a file to load?
    if (status == JFileChooser.APPROVE_OPTION) {
      //Set the desired file to the file being checked
      File selectedFile = loadMapChooser.getSelectedFile();

      //Does the desired file exist and the extension is rmap?
      if (selectedFile.exists() && getFileExtension(selectedFile).toLowerCase().equals("rmap")) {
        //Try to take the data from the rmap file and place it in the level array
        try {
          //Create a BufferReader to read the contents of the file
          BufferedReader br = new BufferedReader(new FileReader(selectedFile));

          String line = ""; //empty string to be replaced with each row of text in the file
          int rows = 0; //used to run load each line of text in the file
          //Read each line (row) of text from the file until there are no lines (rows) left
          while ((line = br.readLine()) != null) {
            int cols = 0; //used to put each value from the file in the proper "x" position in the array

            //Take all of the tile information from the file and place in its own wrapper  
            String[] values = line.split(",");

            //Loop through all the values in the file and place them in to their corresponding level array position
            for (String v : values) {
              level[rows][cols] = int(v); //cast string back to integer
              cols++;
            }

            //read next and take values from the next line (row)
            rows++;
          }

          //Close the reader
          br.close();
        }
        //If the rmap file trys to load in a unloadable rmap and the array does not allow the values, give feedback
        // to the user indicating that the load was not successful
        catch (ArrayIndexOutOfBoundsException e) {
          println("There was an error while loading this rmap file. Please load a usable rmap file");
        }
      }
      //The user tried to load an unusable file. Abort load, and give feedback to user
      else {
        println("Load incomplete. Please load a usable rmap file");
      }
    }
  }
  catch(IOException e) {
    e.printStackTrace();
  }
}//end loadMap

//Returns a string value for the extension of a given file
String getFileExtension(File file) {
  //split the file name into parts separated by periods
  String[] splitFileName = file.getName().split("\\.");

  //return the last value in the string array (should be the extension type)
  return (splitFileName.length > 0) ? splitFileName[splitFileName.length-1] : null; //return null incase the array somehow has a length of 0
}//end getFileExtension


/*
//Saves an image of the level with the given name
// - Not necessary to program. Have it for personal preference
void saveLevelImage(String name){
  int w = GAME_COLS*TILE_SIZE, h = GAME_ROWS*TILE_SIZE; //width and height of image -  should be the same rectangle as the game grid
   
  //create an image the same size of the game grid
  PImage level = createImage(w, h, RGB);
  
  loadPixels(); //load the windows pixels for access
  level.loadPixels(); //load the level image pixels for editing
  //loop through every pixel in the level image and make it the same as the windows pixels (make the image)
  for(int y = 0; y < h; y++){
    for(int x = 0; x < w; x++){
      int index = x + (y*w);
      level.pixels[index] = pixels[index];
    }
  }
  level.updatePixels(); //update the level image pixels
  
  //save the image to the sketch folder and give feedback that the img has been saved
  level.save(name);
  println("Level image has been saved to " + name);
}//end saveLevelImage
*/
 