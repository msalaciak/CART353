//this is the mover class, some of the code was inspired by Daniel Shiffman's tutorial and in class examples



  class Mover {
  //declaration of variables

  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector mouse;
  float mass;
  float G;
  float x,y;
  PImage squirrel;
 
  //mover constructor
  Mover(float m,float x, float y, PImage squirrel ) {
    
    this.position = new PVector(x, y);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0,0);
    this.mass = m;
    G=1;
    this.squirrel= squirrel;
   
    
   
    
    
  }
  //setter for mass (I know it is not needed in processing when we don't set variable to private
  //but I wanted to try one class with setters and getters just to keep up with my basic old java!
  void setMass(float newMass){
    this.mass= newMass;
  
  }
  
  //atract method comes from Daniel Shiffman and in class examples, slightly modified to produce the results I wanted
  //the strength is related to the mass of the objects and the mover so I thought it was interesting to play with random masses of acorns
  //to make it more challenging for the player to grab them!
  PVector attract(Objects o) {

     PVector force = PVector.sub(position,o.position);   
    float d = force.mag();                              
    d = constrain(d,30.0,30.0);                          
    force.normalize();                                  
    float strength = (G * mass * o.mass) / (d * d);    
    force.mult(strength);     
 return force;
    
  }
  
  
  //Apply force method that we used in class but with an addition to velocity
  //the reason why i added velocity was because in the update method i use acceleration to be equaled to the mouse PVector
  //so my object can follow my mouse, and because acceleration = mouse, acceleration.add(f) was being overwritten
  //i thought adding it to velocity was an interesting hack because it produced results that i thought felt like slipping on ice
  //i don't think this is 100% physics approved
  void applyForce(PVector force) {
    
    
    PVector f = PVector.div(force, mass);
    
    velocity.add(f);
    acceleration.add(f);
    
}




//check distance method, that takes an object as its parameter and calculates the distant from the mover object
//returns this as a float
  
  float checkDistance(Objects o) {
    float d = PVector.dist(this.position,o.position);
    return d;
    
  }
  
 //update method uses a mouse follow code that comes from the processing website 
 //slightly modified to produce the results i wanted
 //as i mentioned in the apply force method, acceleration is being assigned the mouse vector, which overwrites the applyForce method
  void update() {

    mouse = new PVector(mouseX, mouseY);
   
    mouse.sub(position);
    mouse.setMag(2);
    acceleration = mouse;
    velocity.add(acceleration);
    position.add(velocity);
    velocity.limit(1);
    acceleration.mult(0);
    
   
    
    

    
  }
  
  
  
//check edges method which is inspired by in class examples and Daniel Shiffman's tutorials
  void checkEdges() {

    if (position.x > width) {
      position.x = width;
    } else if (position.x < 0) {
      position.x = 0;
    }

    if (position.y > height) {
      position.y = height;
    } else if (position.y < 0) {
      position.y = 0;
    }
  }
  
  //display function that produces our squirrel friend!

  void display() {
     
   
    imageMode(CENTER);
    image(squirrel,position.x, position.y, mass*2,mass*2);
    
  }

}