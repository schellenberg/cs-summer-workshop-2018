class Platform {
  
  //class variables
  PVector location, size;
  int x, y, xx, yy;

  //class constructor
  Platform(int x_, int y_, int xx_, int yy_) {
    x = x_;
    y = y_;
    xx = xx_;
    yy = yy_;
    location = new PVector(x, y);
    size = new PVector(xx, yy);
  }

  //class functions
  void display() {
    fill(#006622);
    rect(location.x, location.y, size.x, size.y);
  }

  void checkPlatforms() {                                                                
    if (v.location.x + 15 >= location.x && v.location.x - 15 <= (location.x + size.x)) {  
      if ((v.location.y + 50) - location.y < 51) {
        if (abs(v.location.y + 50 - location.y) < platformDistance){
          v.floor = int(location.y) -50;
          platformDistance = abs(v.location.y + 50 - location.y);
        }
      }
    }
  }
}