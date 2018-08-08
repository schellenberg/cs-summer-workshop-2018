class Paddle {
  PVector location; 
  
  Paddle() {
    location = new PVector(width/2, height/2);
    //location = new PVector(275,275);
  }

  void follow() {
    //If in singleplayer, paddle just follows mouse 
    if (mouseX != 0 && mouseY != 0) {
      location.x = mouseX;
      location.y = mouseY;
    }
  }

  void display() {
    noStroke();
    fill(237, 38, 38, 200);
    pushMatrix();
    rect(location.x,location.y,80,80,10);
    popMatrix();  
  }
  
  void arrows(){
    //If in multiplayer moves based on Arrow keys
    if (is_Up) location.y -= 5;
    if (is_Down) location.y += 5;
    if (is_Right) location.x += 5;
    if (is_Left) location.x -= 5;
  }
}