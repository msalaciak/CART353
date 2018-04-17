//sample player class


import ddf.minim.*;
import ddf.minim.ugens.*;

 


class SamplePlayer {
  //variables for the samplePlayer
  private Sampler sample;
  private int stepid;
  private boolean isPlaying = false;

 

 

 
  
  

//string sampleFile takes a file name from the file array in main

  SamplePlayer(int step, String sampleFile) {
     
     //this is all the needed stuff to make the samples play
    //out   = minim.getLineOut();
    sample = new Sampler(sampleFile,1,minim);
    this.stepid =step;
    
    sample.patch(sum);
       //sample.patch(out);
    }
  
 

 
 
 
 

  
  //play sample
  void playSample(){
    sample.trigger();
    isPlaying = !isPlaying;
    //sample.patch(delayEffect()).patch(out);
    //sample.patch(sum);

  }
  
  
  //sample mute
  void mute(){
    sample.stop();
 
  
}

boolean playingSample () {
return isPlaying;
}


Sampler getSampler() {
  return sample;

}






}
