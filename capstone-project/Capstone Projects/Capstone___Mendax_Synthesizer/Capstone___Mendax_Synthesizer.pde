// 6/14/18
// MendaxSynth, a softsynth
// Library Needed: The MidiBus
// A synth with a rather unique composition

// For midi input
import themidibus.*;
import javax.sound.midi.MidiMessage;

// For sound generation
import ddf.minim.*;
import ddf.minim.ugens.*;

// Class definitions
MidiBus bus;

Minim minim;
AudioOutput out;

ControlPanel panel;

Synthesizer[] synthesizers1 = new Synthesizer[128];
Synthesizer[] synthesizers2 = new Synthesizer[128];
Synthesizer[] synthesizers3 = new Synthesizer[128];

// Definition of the various control classes
Toggle lfoToggle, osc2Toggle, osc3Toggle;
Dial lfoFrequency, osc1Frequency, osc2Frequency, osc3Frequency, filterFrequency, filterResonance;
Selector lfoWave, osc1Wave, osc2Wave, osc3Wave, filterType;
Slider maxAmp, attTime, decTime, susLvl, relTime;

// Variable definitions
ArrayList<Control> controls = new ArrayList<Control>();

PImage waveWindow, waveforms;
PFont font;

// Ensures only one control can be changed at once
boolean changing;

void setup() {

  size(1000, 600, FX2D);
  rectMode(CORNERS);

  // Class initializations
  bus = new MidiBus(this);
  bus.addInput(0);

  minim = new Minim(this);
  out = minim.getLineOut();

  panel = new ControlPanel();

  // Control initializations
  controlInitialization();

  // Variable initializations
  waveWindow = loadImage("waveformWindow.png");
  waveforms = loadImage("waveforms.png");
  font = createFont("Calibri", 32);
}

void draw() {

  // Draws waveformvisualizer
  waveVisualizer();

  // Allows for viewing waveform visualizer through panel
  image(waveWindow, 495, 0);

  // Draws the rest of the control panel
  panel.display();

  // Draws envelope visualizer
  envelopeVisualizer();

  for (Control c : controls) {
    c.display();
  }
}

void controlInitialization() {

  lfoToggle = new Toggle(920, 520, 40);
  osc2Toggle = new Toggle(420, 480, 40);
  osc3Toggle = new Toggle(420, 540, 40);

  lfoFrequency = new Dial(580, 520, 40, 0, -24, 24);
  osc1Frequency = new Dial(90, 420, 40, 0, -24, 24);
  osc2Frequency = new Dial(90, 480, 40, 0, -24, 24);
  osc3Frequency = new Dial(90, 540, 40, 0, -24, 24);
  filterFrequency = new Dial(580, 320, 80, 0, -50, 50);
  filterResonance = new Dial(755, 320, 80, 0, -50, 50);

  lfoWave = new Selector(760, 520, 120, 20, 5);
  osc1Wave = new Selector(260, 420, 120, 20, 5);
  osc2Wave = new Selector(260, 480, 120, 20, 5);
  osc3Wave = new Selector(260, 540, 120, 20, 5);
  filterType = new Selector(915, 300, 80, 20, 3);

  maxAmp = new Slider(50, 170, 20, 80, "V");
  attTime = new Slider(130, 120, 20, 80, "A");
  decTime = new Slider(230, 120, 20, 80, "D");
  susLvl = new Slider(130, 220, 20, 80, "S");
  relTime = new Slider(230, 220, 20, 80, "R");

  controls.add(lfoToggle);
  controls.add(osc2Toggle);
  controls.add(osc3Toggle);

  controls.add(lfoFrequency);
  controls.add(osc1Frequency);
  controls.add(osc2Frequency);
  controls.add(osc3Frequency);
  controls.add(filterFrequency);
  controls.add(filterResonance);

  controls.add(lfoWave);
  controls.add(osc1Wave);
  controls.add(osc2Wave);
  controls.add(osc3Wave);
  controls.add(filterType);

  controls.add(maxAmp);
  controls.add(attTime);
  controls.add(decTime);
  controls.add(susLvl);
  controls.add(relTime);
}

void waveVisualizer() {  
  noStroke();
  fill(#191919);
  rect(490, 10, 990, 160);
  stroke(255);
  for ( int i = 0; i < out.bufferSize() - 1; i++ ) {
    float x1  =  map( i, 0, out.bufferSize(), 500, 990 );
    float x2  =  map( i+1, 0, out.bufferSize(), 500, 990 );
    line( x1, 50 + out.left.get(i)*100, x2, 50 + out.left.get(i+1)*100);
    line( x1, 120 + out.right.get(i)*100, x2, 120 + out.right.get(i+1)*100);
  }
}

void envelopeVisualizer() {
  strokeWeight(3);
  line(280, 160, map(attTime.value, 0, 80, 280, 330), map(maxAmp.value, 0, 80, 160, 100));
  line(map(attTime.value, 0, 80, 280, 330), map(maxAmp.value, 0, 80, 160, 100), map(decTime.value, 0, 80, 330, 380), map(susLvl.value, 0, 80, 160, 100));
  line(map(decTime.value, 0, 80, 330, 380), map(susLvl.value, 0, 80, 160, 100), 430, map(susLvl.value, 0, 80, 160, 100));
  line(430, map(susLvl.value, 0, 80, 160, 100), map(relTime.value, 0, 80, 430, 480), 160);
}

void mousePressed() {
  for (Control c : controls) {
    c.controlClicked();
  }
}

void mouseDragged() {
  for (Control c : controls) {
    c.controlDragged();
  }
}

void mouseReleased() {
  for (Control c : controls) {
    c.adjusting = false;
  }
  changing = false;
}