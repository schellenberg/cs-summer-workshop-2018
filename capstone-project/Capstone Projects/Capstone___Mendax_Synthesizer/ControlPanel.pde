// Class to manage the main interface; the control panel
class ControlPanel {

  ControlPanel() {
  }

  void display() {

    // Draws the background of the control panel
    fill(#7F7F7F);
    noStroke();
    rect(0, 0, 500, height);
    rect(500, 161, width, height);

    fill(#191919);
    rect(10, 10, 490, 280, 10);
    rect(10, 290, 490, 590, 10);
    rect(500, 170, 990, 375, 10);
    rect(500, 385, 990, 590, 10);

    stroke(255);
    rect(280, 70, 480, 190, 10);

    // Draws the text of the control panel
    fill(255);
    textAlign(CENTER);
    textFont(font);
    text("OSCILLATOR BANK", 250, 330);
    text("ENVELOPE GENERATOR", 250, 50);
    text("VOLTAGE-CONTROLLED FILTER", 745, 210);
    text("LOW-FREQUENCY OSCILLATOR", 745, 425);

    textSize(18);
    text("FREQUENCY", 95, 370);
    text("WAVEFORM", 260, 370);
    text("TOGGLE", 420, 370);

    text("ENVELOPE VISUALIZER", 380, 240);

    text("FREQUENCY", 580, 250);
    text("RESONANCE", 755, 250);
    text("FILTER TYPE", 915, 250);

    text("FREQUENCY", 585, 465);
    text("WAVEFORM", 760, 465);
    text("TOGGLE", 920, 465);

    textSize(16);
    text("LP", 945, 280);
    text("BP", 915, 280);
    text("HP", 885, 280);

    // Draws the waveform indicators
    image(waveforms, 200, 380);
    image(waveforms, 700, 480);
  }
}