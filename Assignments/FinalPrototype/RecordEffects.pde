import ddf.minim.*;
import ddf.minim.ugens.*;




class RecordEffects  {
  
  private Delay   myDelay;
  
  private Flanger flange;
  float effectsValue;

  
  RecordEffects(float value) {
    this.effectsValue = value;
    
     myDelay = new Delay(0.25 , 0.7, true, true );
     
     
      flange = new Flanger( 0.25, 0.2f,0.25, 0.5f, 0.2f, 1f);
    
   
      
  
  }
  
  void setDelayTime (float x) {
     myDelay.setDelTime(x);
  
  }
  
  void setFeedBack() {
   myDelay.setDelAmp( 3);
  
  }
  
  Delay getMyDelay() {
    return myDelay;
  
  }

Flanger getMyFlanger() {
  return flange;

}


}
