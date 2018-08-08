// Vertical slider
class Slider extends Control {

  float change = 0;
  float value;
  String label;

  Slider(float xLoc_, float yLoc_, float xSize_, float ySize_, String label_) {

    xLoc = xLoc_;
    yLoc = yLoc_;
    xSize = xSize_;
    ySize = ySize_;
    label = label_;
  }

  void controlDragged() {
    if (!changing && mouseX > xLoc - xSize/2 && mouseX < xLoc + xSize/2 || adjusting) {
      if (!changing && mouseY > yLoc - ySize/2 && mouseY < yLoc + ySize/2 || adjusting) {
        adjusting = true;
        changing = true;

        change += pmouseY - mouseY;
        if (change < 0) change = 0;
        else if (change > ySize*2) change = ySize*2;
        
        value = int(change/2);

        if (value < 0) value = 0;
        else if (value > ySize) value = ySize;
        
        println(value);
      }
    }
  }

  void display() {
    strokeWeight(2);
    fill(0);
    rectMode(CENTER);
    rect(xLoc, yLoc, 5, ySize);
    pushMatrix();
    translate(xLoc, yLoc + ySize/2);
    rect(0, int(value)*-1, 30, xSize);
    fill(255);
    textSize(16);
    text(label, 0, int(value - 4)*-1);
    popMatrix();
    rectMode(CORNERS);
  }
}