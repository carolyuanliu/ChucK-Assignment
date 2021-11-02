// Yuan Liu-120220505


SndBuf kick => Dyno dyno => Gain gain => Dyno limiter=> dac;
SndBuf snare => dyno;
SndBuf cHat => dyno;
SndBuf oHat => dyno;

//set the attributes
30 => dyno.ratio;
-1 => dyno.op;
-1 => gain.op;
0.7 =>limiter.thresh;
0.02 => dyno.thresh;

//add drum samples
me.dir() + "files/kick.wav" => string kickFileName;
me.dir() + "files/snare.wav" => string snareFileName;
me.dir() + "files/c-hat.wav" => string cHatFileName;
me.dir() + "files/o-hat.wav" => string oHatFileName;

kickFileName => kick.read;
snareFileName => snare.read;
cHatFileName => cHat.read;
oHatFileName => oHat.read;

fun void SilenceAllBuffers(){
    kick.samples() => kick.pos;
    snare.samples() => snare.pos;
    cHat.samples() => cHat.pos;
    oHat.samples() => oHat.pos;
    
}

SilenceAllBuffers();

0.5::second => dur beat;
fun void Drum(int select, dur duration){
    if(select == 0){
        0 => kick.pos;
        0 => cHat.pos;          
    }
    if(select == 1){
        0 => oHat.pos; 
    }   
    if(select == 2){
        0 => snare.pos; 
    }   
    if(select == 3){
        0 => cHat.pos; 
    }   
    
    duration => now;
    SilenceAllBuffers();
}

for(0 => int i; i<8; i++){     
    Drum(3, beat);      
}  
while(true){    
    for (0 => int i; i<8; i++)  {
        Drum(3, beat); 
        Drum(2, beat); 
        Drum(0, beat); 
        Drum(2, beat); 
    }    
}  





