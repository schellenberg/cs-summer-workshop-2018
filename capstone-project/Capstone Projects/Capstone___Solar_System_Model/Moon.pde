class Moon{
  //class variables
  ArrayList <Dot> trailDots = new ArrayList<Dot>();
  
  float radius;
  float mass;
  color c;
  float MtoEDist = 384400/1000; // km
  PVector location;
  PVector velocity;
  PVector rotation;
  PVector acceleration;
  
  Moon(float rad_, float mass_, PVector loc_, PVector vel_, PVector rot_, color c_){
    velocity = vel_;
    location = loc_;
    radius = rad_;
    mass = mass_;
    rotation = rot_;
    acceleration = new PVector(0, 0, 0);
    c = c_;
  }
  
  //class functions
  void display(){
    
    pushMatrix();
    translate(location.x, location.y, location.z);
    trailDots.add(new Dot(location, radius));
    //rotate the spheres
    rotateY(radians(frameCount * rotation.y));
    rotateX(radians(frameCount * rotation.x));
    rotateZ(radians(frameCount * rotation.z));
    
    strokeWeight(0.3);
    stroke(0);
    fill(c);
    sphere(radius);
    popMatrix();
    
    for (int i = 0; i < trailDots.size(); i++){
      Dot d = trailDots.get(i);
      d.display();
      if (d.lifetime <= 0){
        trailDots.remove(i);
        i--;
      }
    }
    
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void update(){ 
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
}