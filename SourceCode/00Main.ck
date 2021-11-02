// Yuan Liu-120220505

// BPM class
private class BPM{
   
     dur quarterNote, eighthNote, sextupletNote, bar;
    fun void tempo(float beat){
        60.0/beat => float SPB;
        SPB::second => quarterNote;
        quarterNote/2 => eighthNote;
        eighthNote/3 => sextupletNote;
        quarterNote*4 => bar;
    }     
}
//set thetempo
BPM bpm;
120 => bpm.tempo;

//import the public class  Notes
Notes notes;

//load the files
me.dir() + "drum.ck" => string drum;
me.dir() + "kick.ck" => string kick;
me.dir() + "ChordProvider.ck" => string chord;
me.dir() + "ClassA.ck" => string A;
me.dir() + "ClassB.ck" => string bass;
me.dir() + "B.ck" => string bass2;
me.dir() + "Intro.ck" => string Intro;
me.dir() + "Melody.ck" => string melo;
me.dir() + "randomClass.ck" => string random;
me.dir() + "subTri.ck" => string subTri;
me.dir() + "SubSaw.ck" => string subSaw;
me.dir() + "OverLoadFun.ck" => string overLoad;

//add and remove shreds
Machine.add(kick) => int stopKick;
bpm.bar => now;
Machine.add(Intro) => int stopIntro;
4*bpm.bar => now;
Machine.add(subTri) => int stopTri;
4*bpm.bar => now;
Machine.add(A) => int stopA;
Machine.add(drum) => int stopDrum;
4*bpm.bar => now;
Machine.add(bass2) => int stopBass2;
4*bpm.bar => now;
Machine.add(bass) => int stopBass;
4*bpm.bar => now;
Machine.remove(stopTri);
4*bpm.bar => now;
Machine.add(random) => int stopRandom;
16*bpm.bar => now;
Machine.remove(stopA);
4*bpm.bar => now;
Machine.remove(stopRandom);
4*bpm.bar => now;
Machine.remove(stopIntro);
Machine.add(random) => stopRandom;
4*bpm.bar => now;
Machine.remove(stopBass);
Machine.remove(stopBass2);
4*bpm.bar => now;
Machine.remove(stopDrum);
Machine.remove(stopRandom);
2*bpm.bar => now;
Machine.add(melo) => int stopMelo;
4*bpm.bar => now;
Machine.add(subSaw) => int stopSaw;
4*bpm.bar => now;
Machine.remove(stopSaw);
8*bpm.bar => now;
Machine.add(random) => stopRandom;
8*bpm.bar => now;
Machine.add(overLoad) =>int stopOver;
4*bpm.bar => now;
Machine.add(bass) => stopBass;
4*bpm.bar => now;
Machine.remove(stopOver);
16*bpm.bar => now;
Machine.remove(stopKick);
8*bpm.bar => now;
Machine.remove(stopRandom);
4*bpm.bar => now;
Machine.remove(stopMelo);



       