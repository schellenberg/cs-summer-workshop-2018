// MIDI input function
void midiMessage(MidiMessage midiMessage) {

  // MidiBus can occasionally throw null pointers when initializing
  try {

    char status;
    int note = 0;
    int vel = 0;  
    byte[] message = midiMessage.getMessage();

    status = hex(message[0]).charAt(0);
    if (message.length > 1) note = message[1];
    if (message.length > 2) vel = message[2];

    if (status == '9') {

      synthesizers1[note] = new Synthesizer(map(lfoFrequency.value, -24, 24, 1, 20), norm(vel, 0, 127), getLfoWave(), lfoToggle.toggled, 
        Frequency.ofMidiNote(note + osc1Frequency.value), norm(vel, 0, 127), getOsc1Wave(), 
        Frequency.ofMidiNote(map(filterFrequency.value, -50, 50, 0, 127)), norm(filterResonance.value, -50, 50), getFilterType(), 
        norm(maxAmp.value, 0, 80), map(attTime.value, 0, 80, 0.01, 1), map(decTime.value, 0, 80, 0.01, 1), norm(susLvl.value, 0, 80), map(relTime.value, 0, 80, 0.01, 1));
      synthesizers1[note].noteOn();

      if (osc2Toggle.toggled) {
        synthesizers2[note] = new Synthesizer(map(lfoFrequency.value, -24, 24, 1, 20), norm(vel, 0, 127), getLfoWave(), lfoToggle.toggled, 
          Frequency.ofMidiNote(note + osc2Frequency.value), norm(vel, 0, 127), getOsc2Wave(), 
          Frequency.ofMidiNote(map(filterFrequency.value, -50, 50, 0, 127)), norm(filterResonance.value, -50, 50), getFilterType(), 
          norm(maxAmp.value, 0, 80), map(attTime.value, 0, 80, 0.01, 1), map(decTime.value, 0, 80, 0.01, 1), norm(susLvl.value, 0, 80), map(relTime.value, 0, 80, 0.01, 1));
        synthesizers2[note].noteOn();
      }

      if (osc3Toggle.toggled) {
        synthesizers3[note] = new Synthesizer(map(lfoFrequency.value, -24, 24, 1, 20), norm(vel, 0, 127), getLfoWave(), lfoToggle.toggled, 
          Frequency.ofMidiNote(note + osc3Frequency.value), norm(vel, 0, 127), getOsc3Wave(), 
          Frequency.ofMidiNote(map(filterFrequency.value, -50, 50, 0, 127)), norm(filterResonance.value, -50, 50), getFilterType(), 
          norm(maxAmp.value, 0, 80), map(attTime.value, 0, 80, 0.01, 1), map(decTime.value, 0, 80, 0.01, 1), norm(susLvl.value, 0, 80), map(relTime.value, 0, 80, 0.01, 1));
        synthesizers3[note].noteOn();
      }
    } else if (status == '8') {
      synthesizers1[note].noteOff();

      if (osc2Toggle.toggled) {
        synthesizers2[note].noteOff();
      } else {
        for (int i = 0; i < synthesizers2.length; i++) {
          if (synthesizers2[i] instanceof Synthesizer && synthesizers2[i].playing) {
            synthesizers2[i].noteOff();
          }
        }
      }
      if (osc3Toggle.toggled) {
        synthesizers3[note].noteOff();
      } else {
        for (int i = 0; i < synthesizers3.length; i++) {
          if (synthesizers3[i] instanceof Synthesizer && synthesizers3[i].playing) {
            synthesizers3[i].noteOff();
          }
        }
      }
    }
  }
  
  // If there's an exception, skip over the erring midi message
  catch (NullPointerException e){
  }
}