class Portal {

  //class variables
  PImage portalSprite;
  PVector location;
  int position;

  //class constructor
  Portal() {//set the location of our portal.
    portalSprite = loadImage("P.PNG");
    location = new PVector(1525, 700);
    position = 0;
  }

  //class functions
  void display() {//draw our portal.
    image(portalSprite, location.x, location.y);
  }

  void detect() {
    //we need to detect if Victor is overlapping with the platform. it's not perfect, since they're odd shapes.
    if (dist(v.location.x, v.location.y, location.x, location.y) < 100) {
      platformlist.clear();
      lavalist.clear();
      l.level += 1;               //change the current level
      v.location.set(100, 750);   //move Victor back to the start
      c.location.set(300, 750);
      l.fillArray(l.level);       //fill the array again, with whatever level we're now on.
      
    }
  }
  void movePortal(){
    if(position == 0)location.y = 700;
    if(position == 1)location.y = 500;
    if(position == 2)location.y = 375;
    if(position == 3)location.y = 115;
  }
}