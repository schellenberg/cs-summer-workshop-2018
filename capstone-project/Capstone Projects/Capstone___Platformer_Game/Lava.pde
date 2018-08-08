class Lava {
  //class variables
  int x, xx;

  //class constructor
  Lava(int x_, int xx_) {
    x =x_;
    xx =xx_;
  }
  
  //class functions
  void display() {
    fill(#ff0000);
    rect(x, 800, xx, 100);
  }
  void checkLava() {
    //loop through the array of lava spots
    if (v.location.x >= x && v.location.x <= x + xx) {    //if Victor is above lava
      if  (v.location.y + 1 > 750) {                      //if Victor is low enough to be touching the lava
        v.location.set(100, 750);                         //return victor to the start 
        l.deaths += 1;                                    //kill Victor
      }
    }
  }
}