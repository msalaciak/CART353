//this is the class called objects, It was named so poorly because at first I didn't know what this objects will be
//its code is also based on what we've seen in class and from Daniel Shiffman's tutorials

class Objects {
  
 //declaration of variables
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float x,y;
  PImage acorn;
  
  //objects default constructor used to make a shallow copy
  Objects() {
    mass = 0;
    position = new PVector(0, 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

//objects constructor
  Objects(float m, float x, float y, PImage acorn) {
    mass = m;
    this.x =x;
    this.y =y;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    this.acorn = acorn;
  }
  
  //using setters and getters to set x,y and get x,y, and mass. 
  //I wanted to write this just to keep up with Java and see how it works in processing
  //I switch between setters and getters and just accessing the variable without just to explore it althought it is inconsistent
  
  void setX(float x){
  this.x = x;
  }
  
  void setY(float y){
    this.y = y;
  
  }
  
  float getX() {
  return this.x;
}

float getY() {
  return this.y;
}
  
  float getMass(){
    return this.mass;
  }


//apply force method as we have seen in class examples
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

//update method that applies velocity and acceleration when it gets the attractor force applied to it.
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

//display method 
  void display() {
     
  
     imageMode(CENTER);
    image(acorn,position.x, position.y, mass,mass);
  }
  
  //checkEdges method as we have seen in class and from Shiffman's tutorials
  //only slight modification I made is that when the acorn hits and edge, it continues and comes out the opposite side, adds a bit more chaos to the game
  void checkEdges() {

    if (position.x > width) {
      position.x = 0;
    } else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      position.y =0;
      
    }else if(position.y <0){
    position.y=height;
  }

  }
}