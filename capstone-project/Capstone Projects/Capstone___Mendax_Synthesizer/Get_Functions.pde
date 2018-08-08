// Functions for resolving control values into mroe complicated information
Wavetable getLfoWave() {
  if (int(lfoWave.value) == 0) return Waves.SINE;
  else if (int(lfoWave.value) == 1) return Waves.TRIANGLE;
  else if (int(lfoWave.value) == 2) return Waves.SAW;
  else if (int(lfoWave.value) == 3) return Waves.SQUARE;
  else if (int(lfoWave.value) == 4) return Waves.QUARTERPULSE;
  else return Waves.SINE;
}

Wavetable getOsc1Wave() {
  if (int(osc1Wave.value) == 0) return Waves.SINE;
  else if (int(osc1Wave.value) == 1) return Waves.TRIANGLE;
  else if (int(osc1Wave.value) == 2) return Waves.SAW;
  else if (int(osc1Wave.value) == 3) return Waves.SQUARE;
  else if (int(osc1Wave.value) == 4) return Waves.QUARTERPULSE;
  else return Waves.SINE;
}

Wavetable getOsc2Wave() {
  if (int(osc2Wave.value) == 0) return Waves.SINE;
  else if (int(osc2Wave.value) == 1) return Waves.TRIANGLE;
  else if (int(osc2Wave.value) == 2) return Waves.SAW;
  else if (int(osc2Wave.value) == 3) return Waves.SQUARE;
  else if (int(osc2Wave.value) == 4) return Waves.QUARTERPULSE;
  else return Waves.SINE;
}

Wavetable getOsc3Wave() {
  if (int(osc3Wave.value) == 0) return Waves.SINE;
  else if (int(osc3Wave.value) == 1) return Waves.TRIANGLE;
  else if (int(osc3Wave.value) == 2) return Waves.SAW;
  else if (int(osc3Wave.value) == 3) return Waves.SQUARE;
  else if (int(osc3Wave.value) == 4) return Waves.QUARTERPULSE;
  else return Waves.SINE;
}

MoogFilter.Type getFilterType() {
  if (int(filterType.value) == 0) return MoogFilter.Type.LP;
  else if (int(filterType.value) == 1) return MoogFilter.Type.BP;
  else if (int(filterType.value) == 2) return MoogFilter.Type.HP;
  else return MoogFilter.Type.LP;
}