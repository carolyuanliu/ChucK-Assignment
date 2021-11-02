 //Yuan Liu-120220505
    ChordProvider s;
    2::second => dur beat;
    60 => int offset;
  
    fun void PlayNote(int note, int position, dur duration){
        SinOsc lfo => SawOsc osc => LPF lpf => ADSR env1 => dac.left;
        env1 => Delay delay => dac.right;
        duration => delay.max;
        duration / 4 => delay.delay;
        delay => delay;
        1 => delay.gain;    
        3 => lfo.gain;
        6 => lfo.freq;
        2 => osc.sync;
        0.01 => osc.gain;
        500 => lpf.freq;
        Std.mtof(note + offset + position) => osc.freq;
        (1::ms, duration*2, 0, 1::ms) => env1.set;
        1 => env1.keyOn;
        duration => now;
        
        }
        
        while(true){
            for(0 => int i; i < s.chord.cap(); i++){
                spork ~ PlayNote(s.chord[i], s.position, beat);
                }
            
            beat => now;
                   
            }