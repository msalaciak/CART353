//Assignment 2 - Image Class for CART 353
//Written by Matthew Salaciak 29644490
//this is class called image which creates an object of an image type
//the image class has 3 methods, pixelX, pixelY, and freakOut
 
 
 class Image {
     //Initializing variables 
      PImage img;
      String imageFile;
 
      
//Image constructor with String as a parameter to load image file location
 Image(String imageFile) 
     {
        img = loadImage(imageFile);
        
     }

      
// method to display image useful for testing if image is successfully loaded
  void display() 
   {
        
        background(0);
        image(img,0,0);
   }
   
   //pixelX method uses the pixel array to manipulate the colors by multiplying the r,g,b values by the location of mouseX
   // I used the int randomLoc to try and randomize the order of pixels and I used the int loc to count the pixels in a regular fashion.
   //the float r g b is then constrained and converted to the data type color.
   
   void pixelX()
   {
     loadPixels();
     img.loadPixels();
    
    for(int y = 0; y<img.width; y++) {
      for (int x = 0; x<img.height; x++) {
        int loc = x + y  * width;
        int randomLoc = int (random(0,x + y  * height));
        float r = red (img.pixels[loc]);
        float g = green(pixels[randomLoc]);
        float b = blue (pixels[loc]);
        
        // adjustBright function is an idea from example 15-8 of Learning Processing 2nd edition
        float adjustBright = map(mouseX,1,width,1,3);
        r *= adjustBright;
        g *=adjustBright;
        b *= adjustBright;
        
        r = constrain(r,4,211);
        g = constrain(g,32,255);
        b = constrain(b,4,232);
        
        color c = color(r,g,b);
        pixels[loc] = c;
        
      }
    }
     updatePixels();
     
   }
   
   
   //
   
   //PixelY is essentially similar to pixelX but no randomLoc variable and mouseY mapping has different parameters (more intense) than mouseX
   void pixelY()
   {
     loadPixels();
     
      
    for(int y = 0; y<width; y++) {
      for (int x = 0; x<img.height; x++) {
        int loc = x + y  * height;
        float r = red (pixels[loc]);
        float g = green(img.pixels[loc]);
        float b = blue (pixels[loc]);
         // adjustBright function is an idea from example 15-8 of Learning Processing 2nd edition
        float adjustBright = map(mouseY,0,height,0,10);
       r *= adjustBright;
        g *=adjustBright;
        b *= adjustBright;
        
        r = constrain(r,4,211);
        g = constrain(g,5,215);
        b = constrain(b,34,215);
        
        color c = color(r,g,b);
  pixels[loc] = c; 
      
        
      }
    }
     updatePixels();
     
   }
   //Freak out is a method that uses the randomLoc variable only. 
   //The idea behind this is I thought it would be interesting to process random locations of the array during its iteration 
   // then assign these random locations to color
   // what engages this function is if a key is pressed it sets the boolean freakOut to true, and if thats true it will enter the for loop.
   //I would like to learn how to be able to press the key and engage the function without holding it down, this is something I want to explore.
   
   void freakOut(){
    loadPixels();
    boolean freakOut = false;
     
     if(mousePressed == true)
     freakOut = true;
     

     
     if(freakOut)
     {
      
    for(int x = 0; x<img.width; x++) {
      for (int y = 0; y<img.height; y++) {
        int randomLoc = int (random(0,x + y  * height));
        float r = red (pixels[randomLoc]);
        float g = green(pixels[randomLoc]);
        float b = blue (pixels[randomLoc]);
        
        r = constrain(r,0,255);
        g = constrain(g,0,255);
        b = constrain(b,0,255);
    
       
       
        
        color c = color(r,b);
        pixels[randomLoc]=c;
  
      }
  
    }   
    updatePixels();
       
   }
   
   }
   
   
   
   
 }
      
   
 