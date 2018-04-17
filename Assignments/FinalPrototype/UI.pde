/*
This class is the UI using controlP5
As mentioned in the RecorderButton effect, I had to keep sliders and buttons in seperate classes because of how controlP5 works.
The sliders are created through methods from the controlP5 object, which is created as a global variable in the main file
it can't sadly create buttons and sliders within the same class!
this code was also inspired and adapted from controlP5 buttons and sliders examples/tutorial

*/

class UI {
    //variables that contain the slider name, value of the slider and x&y positions
  
  String sliderName;
  float positionX;
  float positionY;
  float effectsValue;
  
    
    //UI constructor that takes a string for name and float for x&y position
  UI(String name,float x, float y){
    this.positionX = x;
    this.positionY = y;
    this.sliderName = name;
    //controlP5 methods to create the sliders and set all itss various properties such as color, position, size, name, etc..
     cp5.addSlider(sliderName)
       .setPosition(x,y)
       .setSize(200,20)
       .setRange(-100,0)
       .setValue(-100)
       .setColorValue(color(1, 12, 100))
       .setColorBackground(color(111, 111, 111))
       .setColorForeground(color(238,238,238))
       .setColorActive(color(238,238,238))
       .setColorValueLabel(color(0,0,0))
      
       ;
      
  
  }
  
  //get value function that uses the controlP5 ojbects method getValue in order to return the float value of where the slider is
  //this is used to get the value to set the DB mix of the gain for each effect
  float getValue(){
    effectsValue =cp5.getController(sliderName).getValue();
    return effectsValue;
  
  }
}
