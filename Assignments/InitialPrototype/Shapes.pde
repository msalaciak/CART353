
 

class Shapes{
  
 //declaration of variables
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float x,y;
  int randomColor;
  ArrayList<Shapes> shapes;
  int stepid =0;

   



 
  
  //objects default constructor used to make a shallow copy
  Shapes() {
    mass = 0;
    position = new PVector(0, 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    randomColor = 2;
  }
  

//objects constructor
  Shapes(float m, float x, float y,int randomColor, int step) {
    mass = m;
    this.x =x;
    this.y =y;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    this.randomColor = randomColor;
    this.stepid =step;

  
   
   
  
   
    
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
  
 // void setFile(String file){
 //   this.file = file;
 //SamplePlayer.sample.setFile(file); 
 // }
  
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
    
    acceleration=(force);
  }

//update method that applies velocity and acceleration when it gets the attractor force applied to it.
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    velocity.limit(1);
  }


//random arraylist of shapes that don't overlap

public ArrayList<Shapes> getArrayList(int i){
  shapes = new ArrayList<Shapes>();
  
  while(shapes.size()<i) {
    int randomColor = (int)(random(1,5));
    int randomStep = (int)(random(1,4));   
   
    
    
      
   Shapes  s1 = new Shapes(random(40,90),random(50,width-100),random(50,height-100),randomColor,randomStep);  
    
   boolean overlap = false;
   //s1.setFile(file);
   
     for (int j = 0; j< shapes.size(); j++) { 
       
       Shapes otherS = shapes.get(j);
       float d = dist(s1.getX(),s1.getY(),otherS.getX(),otherS.getY());
       
       if(d < s1.getMass() + otherS.getMass()){
        overlap = true;
        break;
       } 
     }
     
    if (!overlap) {
      shapes.add(s1);
      
      
    }
    
   }
  
  return shapes;
}


//display method 
  void display() {
    
   
    rect(position.x, position.y, mass,mass);
     noStroke();
     int c;
  
  switch(randomColor) {
  case 1: 
   c = color(130,20,255);
   fill(c);
   break;
    
  case 2: 
  c = color(20,255,162);
  fill(c);
   break;
    
    
  case 3:
  c = color(99,235,235);
  fill(c);
   break;
}


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

  
  
  