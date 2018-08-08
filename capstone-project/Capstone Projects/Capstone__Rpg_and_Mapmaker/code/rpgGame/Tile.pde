//Class used to identify and control specific tiles/squares for the map
class Tile {

  //CLASS VARIABLES
  
  int id; //integer value to keep track of what kind of tile this is
  boolean walkable = true; //decides if a tile can be walked over or not by sprites


  //CLASS CONSTRUCTOR

  Tile(int id_) {
    id = id_;
  }//end Tile constructor


  //CLASS METHODS

  //setters
  void setId(int id_) {id = id_;}
  void setWalkable(boolean walkable_) {walkable = walkable_;}

  //getters
  int getId() {return id;}//end getId
  boolean isWalkable() {return walkable;}//end isWalkable
  
}//end Tile class