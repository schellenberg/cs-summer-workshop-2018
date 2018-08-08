// Selector switch
class Selector extends Control {

  float value = 0;
  float change = 0;
  int values;

  Selector(float xLoc_, float yLoc_, float xSize_, float ySize_, int values_) {

    xLoc = xLoc_;
    yLoc = yLoc_;
    xSize = xSize_;
    ySize = ySize_;
    values = values_;
  }

  void controlDragged() {
    if (!changing && (mouseX > xLoc - xSize/2 && mouseX < xLoc + xSize/2) || adjusting) {
      if (!changing && (mouseY > yLoc - ySize/2 && mouseY < yLoc + ySize/2) || adjusting) {
        adjusting = true;
        changing = true;
        
        change += pmouseX - mouseX;
        if (change < 0) change = 0;
        else if (change > values*25) change = values*25;
        
        value = int(change/25);
        
        if (value > values - 1) value = values - 1;
        else if (value < 0) value = 0;
      }
    }
  }

  void display() {
    strokeWeight(2);
    rectMode(CENTER);
    rect(xLoc, yLoc, xSize, ySize, 10);
    rectMode(CORNERS);
    pushMatrix();
    translate(xLoc + xSize/2 - ySize/2 - (xSize/(values))*int(value) + ((values-1) - map(int(value), 0, values-1, 0, 8)), yLoc);
    ellipse(0, 0, ySize, ySize);
    popMatrix();
  }
}