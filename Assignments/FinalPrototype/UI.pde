

class UI {
String sliderName;
float positionX;
float positionY;
float effectsValue;

  
  
UI(String name,float x, float y){
  this.positionX = x;
  this.positionY = y;
  this.sliderName = name;
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

float getValue(){
  effectsValue =cp5.getController(sliderName).getValue();
  return effectsValue;

}
}
