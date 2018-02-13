//Assignment 3 - Rando Video for CART 353
//Written by Matthew Salaciak 29644490
//This class is created and inspired by Daniel shiffman'S youtube tutorials on using perlin noise to create endless landscape
//I wanted to create a shape that modulates its size and rotation based on perlin noise randomness



class Graph {
  
  //variable declarations
  Gaussian rand = new Gaussian(1);
  int cols, rows,w,h;
  int cell =50;
  float t=20;
  
//constructor
Graph(int w, int h){
  this.w = w;
  this.h = h;
  cols = w/cell;
  rows = h/cell;
  
}

// this function displays the graph and takes the values rgb from the pixel array and passes it to the stroke function
void display(float r, float g, float b) {
  
  //this is used to keep adding 0.01 to our t variable to change the perlin noise distribution
  t = t + 0.01;
  // pNoise2,3 is the value created by this t variable, the perlin noise function, and adding more values to the t variable
  float pNoise2= noise(t+0.7,t+0.2,t);
  float pNoise3 = noise(t+0.1,t+0.5,t+0.7);
  
 translate(w/2,h/2);
 //using the freakOut method from the gaussian class to randomize the rotation of the grid
 rotateX(PI/rand.freakOut()*5);
 rotateY(PI/pNoise3*5);
  for (int x = 0; x< cols; x++){
    for (int y = 0; y< rows; y++) {
      
      //i take the r,g,b values that were passed to the graph object from the pixel array and apply it to the stroke
      //i inverted it so it will be an opposite color of what is being shown behind the grid.
      //i also use the random function to change the alpha of the grid.
      stroke(255-r,255-g,255-b,random(40,int(pNoise3)));
      noFill();
      
      box(x*cell, x*cell, y*cell*(pNoise2));
      
    }

  }

}







}