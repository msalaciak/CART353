import processing.sound.*;
import ddf.minim.*;
import ddf.minim.ugens.*;



class SamplePlayer {
  
   int stepid;
  Sampler sample;
  

  
  float x,y;

  SamplePlayer(float x, float y,int step) {
  
    //this.sample = sample;
    this.x = x;
    this.y = y;
    this.stepid =step;

    
    
  }
  
  void playLoop(){
    
    sample.trigger();
    
    
    
  }
  
  void playSample(){
    sample.trigger();
   
    
  
  }
  
  
  
  void mute(){
    sample.stop();
 
  
}







}