// Yuan Liu-120220505

SawOsc osc => LPF lpf => ADSR env1 => NRev rev=> dac;
TriOsc osc2 => lpf;

0.5 => osc.gain;
0.3 => osc2.gain;
220 => lpf.freq;
0.2 => rev.mix;
0.5::second => dur beat;
(4::ms, beat, 0, 4::ms) => env1.set;
60 => int offset;
int position;

//overload functions to create note
fun int createNote(int a, int b){  
        a + b => int c;
        return c;
       }
      
fun int createNote(int a){       
          return a + 4;       
          }      
 
//overload functions to create position 
 fun int createPosition(int a, int b){  
     Math.random2(a,b) => int n;
     a + b*n => int c;
     return c;
 }
 
 fun int createPosition(int a){ 
     Math.random2(a,a+4)  => int n;    
     return a*n;       
 }  
 
 //call the function, assign to int
 createNote(5,2) => int note1;
 createNote(2) => int note2;  
 createPosition(1,2) => int position1;
 createPosition(3) => int position2;
 
 //sound loop
 while(true){
     
     Math.random2(0,1) => int j;
    if (j ==0){
       
        Std.mtof(note1+offset + position1-7) => osc.freq;  
        1 => env1.keyOn;   
        beat/4=> now;
        Std.mtof(note1+offset + position-5) => osc.freq;   
        1 => env1.keyOn;
        beat/4 => now;   
        Std.mtof(note1+offset + position1-7) => osc.freq;   
        1 => env1.keyOn;
        beat/4 => now;    
        Std.mtof(note1+offset + position-4) => osc.freq;  
        1 => env1.keyOn;
        beat/2 => now;
        Std.mtof(note1+offset + position2-7) => osc.freq;  
        1 => env1.keyOn;
        beat/4 => now;  
        Std.mtof(note1+offset + position-2) => osc.freq;   
        1 => env1.keyOn;
        beat/2 => now;
    
} else { 
        
        Std.mtof(note2+offset) => osc.freq;  
        1 => env1.keyOn;   
        beat/4=> now;
        Std.mtof(note2+offset+5) => osc.freq;   
        1 => env1.keyOn;
        beat/4 => now;   
        Std.mtof(note2+offset+2) => osc.freq;   
        1 => env1.keyOn;
        beat/4 => now;    
        Std.mtof(note2+offset+6) => osc.freq;  
        1 => env1.keyOn;
        beat/2 => now;
        Std.mtof(note2+offset+4) => osc.freq;  
        1 => env1.keyOn;
        beat/4 => now;  
        Std.mtof(note2+offset+1) => osc.freq;   
        1 => env1.keyOn;
        beat/2 => now;        
  }       

}
