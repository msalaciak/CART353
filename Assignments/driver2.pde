//Assignment 3 - Rando Video for CART 353
//Written by Matthew Salaciak 29644490
//The purpose of this program is to explore techniques of randomness applied to video processing.
//By using Perlin Noise and The Gaussian distribution, I can introduce a different kind of randomness
//into my video processing program. 
//creating the Graph class to use the cube grid layout with perlin noise applied to it 
// is inspired from Daniel shiffman'S youtube tutorials on using perlin noise to create endless landscape
//i also apply the gaussian class to the rotation of the cube grid layout to have a more visual effect of how this distribution looks like


//importing processing video library and variable and object declaration    

import processing.video.*;


Gaussian rand1,rand2,rand3;
Graph grid;
Capture video;
color c;
float r;
float g;
float b;
int loc;
int loc2;
int loc3;
boolean swap = true;



//setting up to capture live video from the webcam
void setup() {
  size(640,480,P3D);
video = new Capture(this,640,480,30);
video.start();

grid = new Graph(640,480);



}
// function to read from the camera
void captureEvent(Capture video) {  
   
  video.read();
  

}

void draw() {
  

  
  loadPixels();
  video.loadPixels();  
  
  //loading pixel information and calculating it as a 1D array.
  for (int x = 0; x < video.width; x++) {    
    for (int y = 0; y < video.height; y++) {      
      
      loc = x + y * video.width;   
      //these two location variables are variants of the original location variable
      //purpose of this is to use this different values as inputs for my gaussian class
      loc2 = x + y * video.width/100;
      loc3 = x + y * video.height/200;
      
      //creating gaussian objects
      //i originally declared the objects outside the for loop and used a setter to change loc value
      //I know this is inefficient but using the setter method created a different effect i wasn't into.
   
    rand1 = new Gaussian(loc);
    rand2 = new Gaussian(loc2);
    rand3 = new Gaussian(loc2);
   
       //calling the function freakOut from the gaussian class
       //this function takes the loc value passed from the gaussian objects and passes it to the freakOut function
       //this function than subjects it to a gaussian distribution and some logic i wrote to change to the distrubiton
       //this value is than returned and inserted into the pixel array location that will alter the color information
       //i have to use the constrain function to keep the random values from going out of bound
       // because of the nature of the bell curve, it would rarely go out of bounds but it did happen a few times so i figured
       //better to constrain it within bounds.
       
       r = red(video.pixels[constrain(0,int(rand3.freakOut()),loc)]);
      
       g = green(video.pixels[(constrain(0,int(rand2.freakOut()),loc))]);
    
       b = blue(video.pixels[loc]);
       
       //altering the r value by multipling it by a perlin noise function
       r*=noise(1,200);
       
       
       
      
      // Constrain red and green values to make sure they are within 0-255 color range      
      r = constrain(r, 0, 255); 
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
    
      // assigning these values to a color object      
      color c = color(r, g, b);  
      
     
      // this is a little extra randomness i added to change the pixel locations assignment of color.
      // if the random value is less than 10, it assigns the color value to the correct pixel location
      //if its higher than then it is assigned a randomized pixel location using perlin noise and the 2 other variants of location
      
      if(int(random(0,15))<10){
      pixels[loc] = c;
      
      
      
      }  
        else  {
          pixels[int(noise(loc2,loc3,loc))] = c;
          
          
          
      } 
 
}
  }
  // update pixes and display the grid from the graph object
  updatePixels();
  
 grid.display(r,g,b);
  
 
  
  


}