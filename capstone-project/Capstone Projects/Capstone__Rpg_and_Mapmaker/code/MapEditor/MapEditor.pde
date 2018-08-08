/*
  * Computer Science 30 Final Project - Rayce Zelda RPG Map Editor
  * 
  *
  * This program is an interactive map editor used to create maps for the main game.
  * The main portion of the screen is a game grid displaying the map currently being created.
  * The user can pick from a number of tiles available in the user interface (UI) located 
  * at the bottom of the window and press anywhere on the map grid to place the selected
  * tile. Once the user is done creating their map, they can proceed to pressing the
  * save button located along the top row of the UI to save their map. A simple
  * file browser dialog will open up in the default directory for maps/levels and the user can
  * the map as a .RMAP file where they please. The user can also load previously made .RMAP
  * files by pressing the load button located beside the save button in the top row of the UI.
  * Once pressing load, a similar open file dialog will open up where the user can click a valid
  * .RMAP file to open. Doing so will load the map in to the game grid for further editing.
*/

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.File;
import java.io.IOException;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileFilter;
import javax.swing.filechooser.FileNameExtensionFilter;

//Constants for grid/tile size
int TILE_SIZE = 32, GAME_COLS = 20, GAME_ROWS = 12, UI_ROWS = 3;

PImage[] tiles = new PImage[23]; //holds the tile images
PImage saveMapImg, loadMapImg; //hold the save map and load map images

int[][] level = new int[GAME_ROWS][GAME_COLS]; //holds the tile arrangement of the level
int selectedTile = 0; //tracks which tile should be placed
int gridLocX = 0, gridLocY = 0; //tracks which tile the mouse clicked in


//Function to define window size that depends on variables - Runs once
void settings(){
  //Make screen size based on how many columns and rows given and the tile size
  size(TILE_SIZE*GAME_COLS, TILE_SIZE*(GAME_ROWS+UI_ROWS)); //640px x 480px
}//end settings

//Initialization function - Runs once
void setup() {
  imageMode(CORNER); //images are drawn from upperleft corner
  rectMode(CORNER); //rectangles are drawn from upperleft corner
  
  loadImages(); //load images in to memory
  
  //initialize map to all sand tiles
  for(int y = 0; y < GAME_ROWS; y++){
    for(int x = 0; x < GAME_COLS; x++){
      level[y][x] = 0;
    }
  }
}//end setup

//Function that draws the contents on to the scene - Runs multiple times a second
void draw() {
  background(255);
  checkMousePressed();
  
  drawUI();
  drawMap();
  drawGameGrid();
}//end draw

/*
//Function calls once when a keypress event is detected
void keyPressed(){
  //if the S key is pressed, save a picture of the level
  if(key == 's') {
    saveLevelImage("rayce-game_level.png");
  }
}
*/