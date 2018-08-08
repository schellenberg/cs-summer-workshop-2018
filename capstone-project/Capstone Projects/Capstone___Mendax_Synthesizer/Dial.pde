// Adjustable dial
class Dial extends Control {

  float change = 0;
  float value, valueMin, valueMax;

  Dial(float xLoc_, float yLoc_, float size, float value_, float valueMin_, float valueMax_) {

    xLoc = xLoc_;
    yLoc = yLoc_;
    xSize = size;
    ySize = size;
    value = value_;
    valueMin = valueMin_;
    valueMax = valueMax_;
  }

  void controlDragged() {
    if (!changing && (mouseX > xLoc - xSize/2 && mouseX < xLoc + xSize/2) || adjusting) {
      if (!changing && (mouseY > yLoc - ySize/2 && mouseY < yLoc + ySize/2) || adjusting) {

        adjusting = true;
        changing = true;

        // Increment value every 20 pixels moved by the mouse
        change += pmouseY - mouseY;
        if (change < valueMin*10) change = valueMin*10;
        else if (change > valueMax*10) change = valueMax*10;
        
        value = int(change/10);

        if (value > valueMax) value = valueMax;
        else if (value < valueMin) value = valueMin;
      }
    }
  }

  void display() {
    fill(0);
    stroke(255);
    strokeWeight(2);
    pushMatrix();
    translate(xLoc, yLoc);
    rotate(radians(180));
    rotate(radians(value*(270/(abs(valueMin) + abs(valueMax)))));
    ellipse(0, 0, xSize, ySize);
    line(0, 0, 0, 0 + ySize/2 - 2);
    popMatrix();

    // Draws tick marks around dial
    for (float i = valueMin; i <= valueMax; i++) {
      strokeWeight(1);
      pushMatrix();
      translate(xLoc, yLoc);
      rotate(radians(180));
      rotate(radians(i*(270/(abs(valueMin) + abs(valueMax)))));
      line(0, 0 + ySize/2 + 5, 0, 0 + ySize/2 + 10);
      popMatrix();
    }
  }
}