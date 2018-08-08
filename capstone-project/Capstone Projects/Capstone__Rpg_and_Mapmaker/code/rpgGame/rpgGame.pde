/*
  * Computer Science 30 Final Project - Zelda RPG Game
  * 
  *
  * This program is an interactive grid based game prototype inspired by The Legend of Zelda series.
  * The user controls the player, Link, and can move around the map using the arrowkeys.
  * Moving to the edge of the screen will move Link in to the corresponding part of the level.
  * Link can walk on sand and cement tiles but can not walk on/through trees, rocks, or water.
  * Pressing the spacebar allows Link to attack with his sword, harming the blob enemy that spawns in on every map.
  * If Link attacks the blob enemy enough times, the blob will die, but will respawn to a random location when Link
  * enters a new map. If Link collides with the blob without attacking, link will lose some health and be pushed backwards. 
  * Remaining health is shown in the top right corner of the screen. When Link's health gets to zero, the game is over  
  * and the user will lose access to controls for the player and be prompted to play again by pressing the enter key.
  *
  * CONTROLS:
  *   - Up Arrow: Move the player upwards
  *   - Down Arrow: Move the player downwards
  *   - Left Arrow: Move the player left
  *   - Right Arrow: Move the player right
  *   - Spacebar: Attack with the player's sword
  *   - Enter: Start a new game (only when the game is over)
*/

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.File;
import java.io.IOException;

int TILE_SIZE = 32, GAME_COLS = 20, GAME_ROWS = 12; //Constants for grid/tile size

Game game; //used to make a game

//Function to define window size that depends on variables - Runs once
void settings() {
  //Make screen size based on how many columns and rows given and the tile size
  size(TILE_SIZE*GAME_COLS, TILE_SIZE*GAME_ROWS); //640px x 480px
}//end settings

//Initialization function - Runs once
void setup() {
  imageMode(CORNER); //images are drawn from upperleft corner
  rectMode(CORNER); //rectangles are drawn from upperleft corner

  //Make a new game
  game = new Game();
}//end setup

//Function that draws the contents on to the scene - Runs multiple times a second
void draw() {
  //Run the game
  game.run();
}//end draw

//Function gets called once every time a keypress event is detected
void keyPressed() {
  game.checkKeysPressed();
}//end keyPressed

//Function gets called once every time a keyrelease event is detected
void keyReleased() {
  game.checkKeysReleased();
}//end keyPressed