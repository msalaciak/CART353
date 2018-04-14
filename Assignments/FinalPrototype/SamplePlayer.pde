//sample player class

import processing.sound.*;
import ddf.minim.*;
import ddf.minim.ugens.*;
 


class SamplePlayer {
  //variables for the samplePlayer
  
  private Sampler sample;
  private int stepid;
  private String file;

 

 
  
  
  float x,y;
//takes an x,y float from the shape
//i realize since i assign this values in the setup of the main,
//once the shapes start moving these x and y no longer make sense
//need to sort this out but its okay for debugging!
//string sampleFile takes a file name from the file array in main
  SamplePlayer(float x, float y,int step, String sampleFile) {
     
     //this is all the needed stuff to make the samples play
    out   = minim.getLineOut();
    sample = new Sampler(sampleFile,1,minim);
    this.x = x;
    this.y = y;
    this.stepid =step;
    sample.patch(out);

    
 

    
    
  }
  
//  int getBpm () {
  
//  return this.bpm;
//}
  

  
  //play sample
  void playSample(){
    sample.trigger();
   
    
  
  }
  
  
  //sample mute
  void mute(){
    sample.stop();
 
  
}







}
