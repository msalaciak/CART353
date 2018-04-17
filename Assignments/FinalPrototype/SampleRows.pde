/*
This class is the boolean arrays that control the tick funciton of minim
This was inspired and adapted by the drum machine example provided by minim
It creates a boolean array with a length of 16 (same amount as the number of steps in a one loop bar)
When one of the booleans in an array is set to true, it then uses the tick class and the playSample method from the SamplePlayer class to trigger that sample on that 
particular array, which results in playing a sample on a 16 step loop.


*/

class SampleRows{
  
  //variable to create the sampleRow boolean array
  boolean[] sampleRow = new boolean[16];
  
  //default constructor so we can call methods
  SampleRows(){

  }
  
  //returns the boolean samplle away at the position of beat, which goes between 0-15 and is stepped by the 60/120 bpm sequencer generated by the Tick class
  boolean  getSampleRow(){
  return sampleRow[beat];
  }

  //this method takes a boolean called playing, this boolean is then set to the first location of the sampleRow array so that the samples will be triggered on the first step/beat
  void setSampleRow(boolean playing){
    sampleRow[0]=playing;


  }
  

}