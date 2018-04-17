/*
This class is the Effects class. It uses Minim's delay and flanger object and methods
I adapted this code based off Minim examples of using effects within an instrument class, but in my example I am using it to just create the delay/flanger,
and then have getters to return the delay/flanger objects so I can patch them into Minim's gain,summer and output classes.
This way I can assign the effects to anywhere down the output line, and in my case its going to the master outs so every sample passes through it when active
I also wanted this class to evoke an Recorder object, by the way minim is setup, this needs to be done on the main file along with the Output object setup



*/

//import minim libaries
import ddf.minim.*;
import ddf.minim.ugens.*;




class RecordEffects  {
  
  //created Delay and Flanger objects, I made these private because when calling them without the getters, I was getting this strange effect that would double the effect
  //which would distort the output
  
  private Delay   myDelay;
  private Flanger flange;
  //this is the float that I used originally when I had the user set the feedback and delay rates for the flanger and delay
  //in the end since I set it so it works perfectly with 60/120 bpm samples, i did not have a use for this anymore
  //i kept it because eventually when I develop this more there will be more control over the effects
  float effectsValue;

  
  //Record effecots constructor which also creates delay and flanger objects
  RecordEffects(float value) {
     
    this.effectsValue = value;
     myDelay = new Delay(0.25 , 0.7, true, true );
     flange = new Flanger( 0.25, 0.2f,0.25, 0.5f, 0.2f, 1f);
  }
  
  //this is the setter to set delay time...this will be a feature function when I furthur this project over the summer
  void setDelayTime (float x) {
     myDelay.setDelTime(x);
  
  }
  
    //this is the setter to set delayfeedback time...this will be a feature function when I furthur this project over the summer
  void setFeedBack() {
   myDelay.setDelAmp( 3);
  
  }
  
  ///this is the delay object getter that returns the delay object, so I can patch it into Minim's summer/gain and output.
  Delay getMyDelay() {
    return myDelay;
  
  }
  ///this is the flanger object getter that returns the flanger object, so I can patch it into Minim's summer/gain and output.
 Flanger getMyFlanger() {
  return flange;

 }


}
