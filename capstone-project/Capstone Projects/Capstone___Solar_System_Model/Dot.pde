class Dot{
  //class variables
  PVector loc;
  float lifetime;
  color c = color(255);
  
  //class constructor
  Dot(PVector loc_, float r){
    loc = loc_;
    lifetime = (r);
  }
  
  //class functions
  void display(){
    strokeWeight(4);
    stroke(map(c, 255, 0, 0, lifetime));
    point(loc.x, loc.y, loc.z);
    lifetime--;
  }
}