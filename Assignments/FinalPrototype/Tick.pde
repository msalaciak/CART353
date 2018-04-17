/*
This class is the Tick class, this is where the sequencer is clocked from and chooses when to trigger a sample.
This implements the instrument class from minim. This code is inspired and adapted from Minim's drum machine example.
This works by calling a method from the Instrument class called NoteOn, float dur comes from the function playNote which is set to 0.25f.
This object is also created in the from the minim Instrument class and called from the minim output class.



*/

class Tick implements Instrument
{
    
     //This method sadly can not be set to a for loop because of how it is designed within Minim. Instead I have to have this ugly amount of if statements :(
     //How it works is that it gets a SamplesRows object from the sampleRowList arraylist, it checks if its set to true or false
     //if true it, it gets the SamplePlayer object from the samplePlist arrayList and calls the playSample method
  void noteOn( float dur )
  {
    if ( sampleRowList.get(0).getSampleRow()) sampleList.get(0).playSample();
    if ( sampleRowList.get(1).getSampleRow() ) sampleList.get(1).playSample();
    if ( sampleRowList.get(2).getSampleRow() ) sampleList.get(2).playSample();
    if ( sampleRowList.get(3).getSampleRow()) sampleList.get(3).playSample();
    if ( sampleRowList.get(4).getSampleRow()) sampleList.get(4).playSample();
    if ( sampleRowList.get(5).getSampleRow() ) sampleList.get(5).playSample();
    if ( sampleRowList.get(6).getSampleRow() ) sampleList.get(6).playSample();
    if ( sampleRowList.get(7).getSampleRow() ) sampleList.get(7).playSample();
    if ( sampleRowList.get(8).getSampleRow() ) sampleList.get(8).playSample();
    if ( sampleRowList.get(9).getSampleRow() ) sampleList.get(9).playSample();
    if ( sampleRowList.get(10).getSampleRow() ) sampleList.get(10).playSample();
    if ( sampleRowList.get(11).getSampleRow() ) sampleList.get(11).playSample();
    if ( sampleRowList.get(12).getSampleRow() ) sampleList.get(12).playSample();
    if ( sampleRowList.get(13).getSampleRow() ) sampleList.get(13).playSample();
    if ( sampleRowList.get(14).getSampleRow() ) sampleList.get(14).playSample();
    if ( sampleRowList.get(15).getSampleRow() ) sampleList.get(15).playSample();

   


    
  }
  
  //this is the noteOff method, this is completely adapted from the minim drum machine example
  //it works by calculating the next beat, so it steps from 0-15 ( or 1-16 in terms of a bar) according to the bpm which is set to 60 in this program, but works for 120bpm
 // or any multiple of 60, it can work for any bpm but since my samples are created to be played at 60bpm or multiples of 60.
  void noteOff()
  {
    // calculates next beat
    
    beat = (beat+1)%16;
    // set the new tempo to correct for the next beat
    out.setTempo(bpm);
    // plays the sample at this beat and bpm
    out.playNote( 0, 0.25f, this );
  }
  

  
}
