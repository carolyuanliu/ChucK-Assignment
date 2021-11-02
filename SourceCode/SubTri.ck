
// create a subclass of TriOsc
private class SubTri extends TriOsc{   
    SqrOsc vib=> NRev rev => this;
    0.5 => this.gain;
    2 => this.sync;
    6 => vib.gain;
    0.1 => rev.mix;
    36 => int offset;
    fun void note(int number){
        Std.mtof(number + offset) => this.freq;      
        }   
    }
[0,3,7,11] @=> int notes[];
    
 SubTri osc => dac; 
 while(true){
     for(0 => int i; i< notes.cap()-2; i++){
          notes[i] => osc.note;      
          0.25::second => now;                     
          notes[i+1] => osc.note;      
          0.25::second => now;  
          notes[i] => osc.note;      
          0.25::second => now;                             
          notes[i+2] => osc.note;      
          0.25::second => now;     
      } 
         }              
         

 