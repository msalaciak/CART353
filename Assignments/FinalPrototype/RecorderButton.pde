/*
This class is the record button using controlP5
Originally I wanted this to be within UI which contains the sliders for the delay and flanger effect, but the way controlP5 works I can't use cp5.addButton and cp5.addSlider
within the same class, since we don't import controlP5 libraries in a class, we create a controlP5 object in the main.
this code was inspired by controlP5 examples which showcase how to create buttons and sliders



*/


class RecorderButton {
  //variables that contain the button name, and x&y positions
  String buttonName;
  float positionX;
  float positionY;
 


  //Recorder Button constructor that takes string name, float x&y as parameters
  RecorderButton(String name,float x, float y){
    this.positionX = x;
    this.positionY = y;
    this.buttonName = name;
    //these are functions provided by the controlP5 library in order to create a button with all its various properties such as color, position, size, name, etc...
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
  
