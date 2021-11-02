// Yuan Liu-120220505

//import public notes class 
Notes n; 
SawOsc osc => LPF lpf => ADSR env1 => NRev rev=> dac;
SawOsc osc2 => lpf;

0.4 => osc.gain;
0.2 => osc2.gain;
440 => lpf.freq;//set the low pass filter frequency
0.2 => rev.mix;
0.5::second => dur beat;
(4::ms, beat, 0, 4::ms) => env1.set;
60 => int offset;
int position;


while(true){
    
    for (0 => int i ; i <2; i++){     
    Std.mtof(n.notes[0]+offset + n.position) => osc.freq;  
    1 => env1.keyOn;   
    beat/4=> now;
    Std.mtof(n.notes[4]+offset + n.position) => osc.freq;   
    1 => env1.keyOn;
    beat/4 => now;   
    Std.mtof(n.notes[7]+offset + n.position) => osc.freq;   
    1 => env1.keyOn;
    beat/4 => now;    
    Std.mtof(n.notes[11]+offset +n.position) => osc.freq;  
    1 => env1.keyOn;
    beat/2 => now;
    Std.mtof(n.notes[7]+offset + n.position) => osc.freq;  
    1 => env1.keyOn;
    beat/4 => now;  
    Std.mtof(n.notes[4]+offset + n.position) => osc.freq;   
    1 => env1.keyOn;
    beat/2 => now;
    }
    
    for (0 => int i ; i <2; i++){     
        Std.mtof(n.notes[0]+offset + n.position-7) => osc.freq;  
        1 => env1.keyOn;   
        beat/4=> now;
        Std.mtof(n.notes[4]+offset + n.position-7) => osc.freq;   
        1 => env1.keyOn;
        beat/4 => now;   
        Std.mtof(n.notes[7]+offset + n.position-7) => osc.freq;   
        1 => env1.keyOn;
        beat/4 => now;    
        Std.mtof(n.notes[11]+offset + n.position-7) => osc.freq;  
        1 => env1.keyOn;
        beat/2 => now;
        Std.mtof(n.notes[7]+offset + n.position-7) => osc.freq;  
        1 => env1.keyOn;
        beat/4 => now;  
        Std.mtof(n.notes[4]+offset + n.position-7) => osc.freq;   
        1 => env1.keyOn;
        beat/2 => now;
    }

 
      
     for (0 => int i ; i <2; i++){     
         Std.mtof(n.notes[0]+offset) => osc.freq;  
         1 => env1.keyOn;   
         beat/4=> now;
         Std.mtof(n.notes[4]+offset) => osc.freq;   
         1 => env1.keyOn;
         beat/4 => now;   
         Std.mtof(n.notes[7]+offset) => osc.freq;   
         1 => env1.keyOn;
         beat/4 => now;    
         Std.mtof(n.notes[11]+offset) => osc.freq;  
         1 => env1.keyOn;
         beat/2 => now;
         Std.mtof(n.notes[7]+offset) => osc.freq;  
         1 => env1.keyOn;
         beat/4 => now;  
         Std.mtof(n.notes[4]+offset) => osc.freq;   
         1 => env1.keyOn;
         beat/2 => now;
     }
     
     for (0 => int i ; i <2; i++){     
         Std.mtof(n.notes[0]+offset -7) => osc.freq;  
         1 => env1.keyOn;   
         beat/4=> now;
         Std.mtof(n.notes[4]+offset-7) => osc.freq;   
         1 => env1.keyOn;
         beat/4 => now;   
         Std.mtof(n.notes[7]+offset-7) => osc.freq;   
         1 => env1.keyOn;
         beat/4 => now;    
         Std.mtof(n.notes[11]+offset-7) => osc.freq;  
         1 => env1.keyOn;
         beat/2 => now;
         Std.mtof(n.notes[7]+offset-7) => osc.freq;  
         1 => env1.keyOn;
         beat/4 => now;  
         Std.mtof(n.notes[4]+offset-7) => osc.freq;   
         1 => env1.keyOn;
         beat/2 => now;
     }
     

    
}
