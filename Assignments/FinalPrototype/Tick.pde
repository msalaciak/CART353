
/*i wish i can comment you something interesting here but i don't understand this part
at all, i know that the if statements and boolean arrays work in a way that
if the beat (between 0-16) is changed to true, it triggers it on that beat
in my case i try to always do it on the 0 array which is the first beat.

*/

class Tick implements Instrument
{
    
     
  void noteOn( float dur )
  {
    if ( sample1Row[beat] ) sampleList.get(0).playSample();
    if ( sample2Row[beat] ) sampleList.get(1).playSample();
    if ( sample3Row[beat] ) sampleList.get(2).playSample();
    if ( sample4Row[beat] ) sampleList.get(3).playSample();
    if ( sample5Row[beat] ) sampleList.get(4).playSample();
    if ( sample6Row[beat] ) sampleList.get(5).playSample();
  }
  
  void noteOff()
  {
    // next beat
    
    beat = (beat+1)%16;
    // set the new tempo
    out.setTempo(bpm);
    // play this again right now, with a sixteenth note duration
    out.playNote( 0, 0.25f, this );
  }
  

  
}
