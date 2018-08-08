// Toggle switch
class Toggle extends Control {

  boolean toggled;

  Toggle(float xLoc_, float yLoc_, float size) {

    xLoc = xLoc_;
    yLoc = yLoc_;
    xSize = size;
    ySize = size;
  }

  // Toggles on/off if clicked
  void controlClicked() {
    if (mouseX > xLoc - xSize/2 && mouseX < xLoc + xSize/2) {
      if (mouseY > yLoc - ySize/2 && mouseY < yLoc + ySize/2) {
        toggled = !toggled;
      }
    }
  }

  void display() {
    if (toggled) {
      stroke(255);
      strokeWeight(2);
      fill(#004BC9);
      ellipse(xLoc, yLoc, xSize, ySize);
    } else {
      stroke(255);
      strokeWeight(2);
      fill(0, 0);
      ellipse(xLoc, yLoc, xSize, ySize);
    }
  }
}