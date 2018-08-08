// Superclass for all types of controls
class Control {
  
  float xLoc, yLoc, xSize, ySize;
  
  // Allows a control to be adjusted while holding down the mouse, but not hovering on the control
  boolean adjusting;
  
  
  // Default methods when no equivalent found in subclass
  void controlClicked() {
    if (mouseX > xLoc - xSize/2 && mouseX < xLoc + xSize/2) {
      if (mouseY > yLoc - ySize/2 && mouseY < yLoc + ySize/2) {
      }
    }
    println("No controlChange function found", this, millis());
  }

  void controlDragged() {
    if (mouseX > xLoc - xSize/2 && mouseX < xLoc + xSize/2) {
      if (mouseY > yLoc - ySize/2 && mouseY < yLoc + ySize/2) {
      }
    }
    println("No controlDragged function found", this, millis());
  }

  void display() {
    println("No display function found", this, millis());
  }
}