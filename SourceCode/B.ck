 // Yuan Liu-120220505

    Notes n; //get notes from public class Notes
    SawOsc osc => LPF lpf => ADSR env1 => NRev rev=> dac;
    SawOsc osc2 => lpf;
    
    0.4 => osc.gain;
    0.1 => osc2.gain;
    220 => lpf.freq;
    0.2 => rev.mix;
    0.5::second => dur beat;
    (4::ms, beat, 0, 4::ms) => env1.set;
    36 => int offset;
    int position;
   
    
  while(true){ 
        beat/4 => dur eighth;   
 
        Std.mtof(n.notes[3]+offset + n.position) => osc.freq;
        Std.mtof(n.notes[3]+offset + n.position-24) => osc2.freq;   
        1 => env1.keyOn;
        
        eighth*2=> now;
        Std.mtof(n.notes[0]+offset + n.position) => osc.freq;
        Std.mtof(n.notes[0]+offset + n.position-24) => osc2.freq;   
        1 => env1.keyOn;
        eighth*2 => now;
                 
        Std.mtof(n.notes[3]+offset + n.position) => osc.freq;
        Std.mtof(n.notes[3]+offset + n.position-24) => osc2.freq;   
        1 => env1.keyOn;
        eighth*2 => now;
        
        Std.mtof(n.notes[7]+offset + n.position) => osc.freq;
        Std.mtof(n.notes[7]+offset + n.position-24) => osc2.freq;   
        1 => env1.keyOn;
        eighth*2 => now;
    
    } 


              