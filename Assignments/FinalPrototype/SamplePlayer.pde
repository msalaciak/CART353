/*
This class is the SamplePlayer class, the most important class :)
This class uses the Sampler minim ugens class/object in order to play the loaded samples
It was inspired and adapted fromthe drum machine minim example.
This class creates the Sampler object, contains in a SamplePlayer object


*/
  //import minim libaries
  import ddf.minim.*;
  import ddf.minim.ugens.*;

  class SamplePlayer {
    //variables for the samplePlayer
    private Sampler sample;
    private int stepID;
    private boolean isPlaying = false;
  
  //string sampleFile takes a file name from the file array in main, int step takes a int variable from the for loop in the main when it creates each SamplePlayer object
  
    SamplePlayer(int step, String sampleFile) {
       
     //creates a Sampler minim ugens object
      sample = new Sampler(sampleFile,1,minim);
      this.stepID =step;
      //patches the Sampler to the summer minim object
      sample.patch(sum);
      
      }
    
  
    //play sample, uses the trigger method from the Sampler minim object's class
    //changes boolean isPlaying to opposite whatever state the boolean is in
    void playSample(){
      sample.trigger();
      isPlaying = !isPlaying;
      
  
    }
    
    
    //sample mute, uses the mute method from the minim library
    void mute(){
      sample.stop();
   
    
  }
  
  //boolean to keep if sample is being trigger, useful for debugging if needed
  boolean playingSample () {
  return isPlaying;
  }
  
  //getter that returns SamplePlayer object, useful for debugging if needed
  Sampler getSampler() {
    return sample;
  
  }
  //returns the stepID which is the unique ID of each SamplePlayer
  int getStepID() {
    return stepID;
  
  }
  
  
  
  
  
  
  }
