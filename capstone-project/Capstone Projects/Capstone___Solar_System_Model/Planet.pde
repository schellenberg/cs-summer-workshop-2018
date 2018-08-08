class Planet {
  //class variables
  ArrayList <Dot> trailDots = new ArrayList<Dot>();
 
  PVector velocity;
  PVector location;
  PVector rotation;
  PVector acceleration;
  float radius;
  float mass;
  float G = 0.4; // meters cubed / kilogram / second squared
  color c;
  float PtoSDist;
  boolean hasMoon;
  
  //Moon variables
  float MRadius = 1737/100; // km
  float MMass = 7.346; // kg
  color MCol = color(183, 183, 183);
  float MtoEDist = 384400/1000; // km
  PVector MLoc = new PVector(0, 0, 0);//0, 0, ELoc.z + MtoEDist);
  PVector MOrbitVel = new PVector(1.0, 0, 0); // km / sec
  PVector MRotation = new PVector(0, 0.1, 0); // km / sec
  Moon moon = new Moon(MRadius, MMass, MLoc, MOrbitVel, MRotation, MCol);
  
  //class constructor
  Planet(float rad_, float mass_, PVector loc_, PVector vel_, PVector rot_, float PtoSDist_, color c_, boolean hasMoon_){
    velocity = vel_;
    location = loc_;
    radius = rad_;
    mass = mass_;
    rotation = rot_;
    acceleration = new PVector(0, 0, 0);
    c = c_;
    PtoSDist = PtoSDist_;
    hasMoon = hasMoon_;
  }
  
  //class functions
  void display(){
    pushMatrix();
    translate(location.x, location.y, location.z);
    
    if (hasMoon){
      //While the moon is not perfectly orbiting the Earth, it is pretty good.
      moon.display();
        //apply the force of the earth on the moon
      PVector earthForce = earth.attract(moon, 33.0, 40.0);
      moon.applyForce(earthForce);
      moon.update();
      
      PVector sunForce = sun.attract(moon, 15.0, 35.0);
      moon.applyForce(sunForce);
      moon.update();
    }
    
    //rotate the spheres
    rotateY(radians(frameCount * rotation.y));
    rotateX(radians(frameCount * rotation.x));
    rotateZ(radians(frameCount * rotation.z));
    
    strokeWeight(0.3);
    stroke(0);
    fill(c); //fill with the planet's colour
    sphere(radius);
    
    trailDots.add(new Dot(new PVector(location.x, location.y, location.z), PtoSDist));
    
    popMatrix();
    
    //creates a trail of white dots behind the planet in it's path.
    for (int i = 0; i < trailDots.size(); i++){
      Dot d = trailDots.get(i);
      d.display();
      if (d.lifetime <= 0){
        trailDots.remove(i);
        i--;
      }
    }
  }
  
  //apply a force to the planet
  void applyForce(PVector force){
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  //add the acceleration to the velocity, then make the acceleration equal to 0
  void update(){ 
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  //using a force, attract one planet to another, using their relative masses
  PVector attract(Planet p, float minDist, float maxDist) {
    PVector force = PVector.sub(location, p.location);
    float distance = force.mag();
    //println(distance);
    distance = constrain(distance, minDist, maxDist);

    force.normalize();
    float strength = (G * mass * p.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
  //If the planet has a moon, use this code
  PVector attract(Moon m, float minDist, float maxDist) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    //println(distance);
    distance = constrain(distance, minDist, maxDist);

    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
}