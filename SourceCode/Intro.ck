// Yuan Liu-120220505

TriOsc osc => ADSR env1 => NRev rev => dac;
TriOsc osc2 => ADSR env2 => rev => dac;

0.2 => rev.mix;
2::second => dur beat;
(beat/2, beat/2, 0, 2::ms) => env1.set;
(1::ms, beat/8, 0, 2::ms) => env2.set;

0.2 => osc.gain;
0.1 => osc2.gain;

[0,4,7,12] @=> int major[];//set the notes array
[0,3,7,12] @=> int minor[];//set the notes array

48=> int offset;
int position;


fun void playTwoBars(int position, int chord[]){
    
    for(3 => int i; i > -1; i--){
        Std.mtof(chord[0]+ offset + position) => osc.freq;
        1 => env1.keyOn;
        
    }
    for(3 => int j; j > -1; j--){
        Std.mtof(chord[j] + offset + position +12) => osc2.freq;
        1 => env2.keyOn;
        beat / 8 => now;
        }
    
}



while(true){
    playTwoBars(0, minor);
    playTwoBars(-4, major);
    playTwoBars(-2, major);
    playTwoBars(-5, major);
    
    playTwoBars(-7, minor);
    playTwoBars(-2, major);
    playTwoBars(3, major);
    playTwoBars(-5, major);
    
}