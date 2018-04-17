class RecorderButton {
  
  String buttonName;
  float positionX;
  float positionY;
 


  
  RecorderButton(String name,float x, float y){
    this.positionX = x;
    this.positionY = y;
    this.buttonName = name;
     cp5.addButton(buttonName)
     .setValue(0)
     .setPosition(x,y)
     .setSize(75,19)
     .setColorBackground(color(111, 111, 111))
     .setColorActive(color(255,0,0)) 
     .setColorForeground(color(111, 111, 111)) 
      ;

      }
    



}
  
