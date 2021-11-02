// Yuan Liu-120220505

//subclass of SawOsc
private class SubSaw extends SawOsc{   
    SinOsc vib=> NRev rev => this;
    
    0.1 => this.gain;
    2 => this.sync;
    1 => vib.gain;
    0.5 => rev.mix;
    48 => int offset;
    fun void note(int number){
      Std.mtof(number + offset) => this.freq;      
    }   
}

[0,4,7,11] @=> int notes[];
SubSaw osc => NRev rev =>dac; 
0.1 =>osc.gain;
0.3 => rev.mix; 
while(true){
    for(0 => int i; i< notes.cap()-2; i++){
        notes[i] => osc.note;      
        0.1::second => now;                     
        notes[i+1] => osc.note;      
        0.1::second => now;  
        notes[i] => osc.note;      
        0.1::second => now;                             
        notes[i+2] => osc.note;      
        0.1::second => now;     
         notes[i] => osc.note;      
        0.1::second => now;   
    } 
}              
