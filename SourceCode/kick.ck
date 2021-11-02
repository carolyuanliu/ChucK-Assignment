
//Yuan Liu - 120220505

SndBuf kick => dac;

SndBuf cHat => dac;


me.dir() + "files/kick.wav" => string kickFileName;

me.dir() + "files/c-hat.wav" => string cHatFileName;

kickFileName => kick.read;
cHatFileName => cHat.read;


fun void SilenceAllBuffers(){
    kick.samples() => kick.pos;
    cHat.samples() => cHat.pos;

    
}

SilenceAllBuffers();

0.5::second => dur beat;
fun void Drum(int select, dur duration){
    if(select == 0){
        0 => kick.pos;
        0 => cHat.pos;          
    }
        
    duration => now;
    SilenceAllBuffers();
}

while(true){         
        Drum(0, beat);       
}  





