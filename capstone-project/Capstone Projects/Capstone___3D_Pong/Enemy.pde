class Enemy{
  PVector location;
  PVector velocity;
  float magnet;
  
  Enemy(){
    location = new PVector(width/2, height/2);
    magnet = 8;
  }
  
  void follow(){
    //Enemy moves towards ball at the speed chosen on player contact
    velocity = new PVector(b.location.x-location.x,b.location.y-location.y);
    if (velocity.mag() > magnet) velocity.setMag(magnet);
    location.add(velocity);
  }
  
  void mid(){
    //Enemy returns to middle slowly
    velocity = new PVector(300-location.x,300-location.y);
    if (velocity.mag() > magnet) velocity.setMag(magnet);
    location.add(velocity);
  }
  
  void display(){
    noStroke();
    fill(#0D20BF, 200);
    pushMatrix();
    translate(0,0,-600);
    rect(location.x,location.y,80,80,10);
    popMatrix();
    
  }
  
  void wasd(){
    //If in multplayer, movement is instead determined by WASD keys
    if (is_w) location.y -= 5;
    if (is_s) location.y += 5;
    if (is_a) location.x -= 5;
    if (is_d) location.x += 5;
  }
}