// Main sound generation class
class Synthesizer {

  // Synthesis component initialization
  Oscil lfo;
  Oscil vco;
  MoogFilter filter;
  ADSR adsr;
  
  // Used to identify instances of synthesizer that are playing when they shouldn't be
  boolean playing = false;

  Synthesizer(float lfoFrequency, float lfoAmplitude, Wavetable lfoWave, boolean lfoToggled, 
    Frequency vcoFrequency, float vcoAmplitude, Wavetable vcoWave, 
    Frequency filterFrequency, float filterResonance, MoogFilter.Type filterType, 
    float maxAmp, float attTime, float decTime, float susLvl, float relTime)
  {
    lfo = new Oscil(lfoFrequency, lfoAmplitude, lfoWave);
    vco = new Oscil(vcoFrequency, vcoAmplitude, vcoWave);
    filter = new MoogFilter(filterFrequency.asHz(), filterResonance, filterType);
    adsr = new ADSR(maxAmp, attTime, decTime, susLvl, relTime);
    
    
    // Prevents memory leak where garbage collection doesn't pick up discarded instances of synthesizer by ensuring they are isolated from the rest of the program
    adsr.unpatchAfterRelease(out);

    // Connects synthesis sequence
    if (lfoToggled) lfo.patch(vco).patch(filter).patch(adsr);
    else vco.patch(filter).patch(adsr);
  }
  
  void noteOn() {
    adsr.patch(out);
    adsr.noteOn();
    playing = true;
  }
  
  void noteOff() {
    adsr.noteOff();
  }
}