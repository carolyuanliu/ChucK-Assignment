// Yuan Liu-120220505

 
    ChordProvider s; // get the chord from public class ChordProvider
    SqrOsc osc => LPF lpf => ADSR env1 => dac;
    SqrOsc osc2 => lpf;
    
    0.4 => osc.gain;
    0.1 => osc2.gain;
    440 => lpf.freq;//set the low pass filter frequency
    0.5::second => dur beat;
    (1::ms, beat/4, 0, 1::ms) => env1.set;
    36 => int offset;
    int position;
   
    
  while(true){ 
        beat/4 => dur sixteenth;
        for (3 => int i; i > 0; i -2 => i ){
        Std.mtof(s.chord[i]+offset + s.position) => osc.freq;
        Std.mtof(s.chord[i]+offset + s.position-24) => osc2.freq;   
        1 => env1.keyOn;
        sixteenth*3 => now;
        1 => env1.keyOn;
        sixteenth*3 => now;
        1 => env1.keyOn;
        sixteenth*2 => now;
    } 
     for (0 => int j; j< 4; j + 2 =>j ){
        Std.mtof(s.chord[j]+offset + s.position) => osc.freq;
        Std.mtof(s.chord[j]+offset + s.position-24) => osc2.freq;   
        1 => env1.keyOn;
        sixteenth*3 => now;
        1 => env1.keyOn;
        sixteenth*3 => now;
        1 => env1.keyOn;
        sixteenth*2 => now;
    } 

  }
              