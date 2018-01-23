//Assignment 2 - image remix for CART 353
//Written by Matthew Salaciak 29644490
//The purpose of this program is to explore designing our own image filters by manipulating the pixel array
// The program works by creating two Image objects that call 3 methods, pixelX, pixelY and freakOut
//pixelX and pixelY are controlled by the mouse x/y axis and freakOut is engaged by pressing the trackpad (or mouse)
//if you wish to save the remixed image, pressing any key on the keyboard will save it as remix.jpg in the project folder

//creating two image objects
Image img1;
Image img2;

//setting up the image objects and the canvas size
void setup() {
  size(300,300);
  img1 = new Image("pic1.jpg");
  img2 = new Image("pic2.jpg");
  
 
  
  

}

void draw() {
  
  //img2 object is calling pixelx, img1 object is calling pixelY, img1 object also calls freakOut.
  img2.pixelX();
  img1.pixelY();
 img1.freakOut();
 
 //if any key is pressed it will save the current image as remix.jpg in the project folder
 if(keyPressed == true){
 save("remix.jpg");
 }
  
  
  
  
  
 

}