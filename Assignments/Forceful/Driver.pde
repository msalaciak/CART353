//Assignment 4 - Forceful for CART 353
//Written by Matthew Salaciak 29644490
//The purpose of this program is to explore using PVectors and applications of Newtons laws of motion
//I decided to make a simple 2d game. It's winter and the player is a hungry squirrel
//Acorns are given random masses and placement around the park, the squirrel wants to eat all of them.
//As the player approaches the acorns, they somehow come to live and start rotating around you
//As you eat them, you gain weight based on their mass, this also influences how they rotate around you and what acorns you can eat
//so start small, eat well!
//the fatter you get the harder it is to get them!
//Also be sure to watch out for ice patches all over the park...they can really throw you off
//The ice image I made myself, the squirrel is from Michelle Morgan, the Acorn from Daniel Llamas Soto both via The noun project




//variable, array, array list, PImage and object declaration 
Mover mover;
ArrayList<Objects> nuts;
Friction [] slips = new Friction [5];
int count =0 ;
PImage acorn;
PImage squirrel;
float massCounter;
PImage ice;



void setup() {
  
  //loading images to use for the acorn, ice and squirrel
  //setting up the arraylist for the nuts
  //calling the constructor for the mover object
  acorn = loadImage("acorn.png");
  squirrel = loadImage("Squirrel.png");
  ice = loadImage("ice.png");
  nuts = new ArrayList<Objects>();
  mover = new Mover(45,760,random(50,500),squirrel);
  
  size(800,600);
  
  //this code was inspired by Daniel Shiffman's tutorial on how to draw non overlapping random circles for p5
  //I created a array list that can hold objects
  //everything is nested within the while loop which will run 20 times thus creating 20 nut objects
  //a boolean called overlap is used to determine if we add the object to our arraylist or not
  //I create an initial object b that has random mass and position
  //inside the for loop i create another object called otherB which gets its information from the arraylist
  //i use the dist function to compare the new created B (outside the for loop) to the other b which is created from objects inside the arraylist
  //if the distance is less than the two radius (which i call mass in this case) i set the boolean overlap to be true and break
  // if overlap is true it doesn't add it to the array list, if overlap is false it is added to the arraylist
  
  while(nuts.size()<20) {
   Objects  b = new Objects(random(40,90),random(50,width-100),random(50,height-100),acorn);  
   boolean overlap = false;
   
     for (int j = 0; j< nuts.size(); j++) { 
       Objects otherB = nuts.get(j);
       float d = dist(b.getX(),b.getY(),otherB.getX(),otherB.getY());
       
       if(d < b.getMass() + otherB.getMass()){
        overlap = true;
        break;
       } 
     }
     
    if (!overlap) {
      nuts.add(b);
    }
    
   }
  
  //hard code the array that contains my friction objects. At first I wanted to randomize location and the friction coefficient
  //but I realized I didn't think that would add much to the experience.
     slips[0] = new Friction(100,200,300,100,1000,ice);
     slips[1] = new Friction(400,400,200,100,1000,ice);
     slips[2] = new Friction(400,200,100,200,1000,ice);
     slips[3] = new Friction(600,400,100,400,1000,ice);
     slips[4] = new Friction(0,0,100,300,1000,ice);
    
   
}

void draw() {
  background(255);
        //for loop to display,update and checkEdges of the acorn nuts objects
       
        for (int i = 0; i<nuts.size();i++) {
          
          Objects b = nuts.get(i);
          b.update();
          b.checkEdges();
          b.display();
        }



      
      //this is a for loop that checks to see if the acorn nuts are near the squirrel
      //i create another object called Bdist, i assign each object to an object in the arraylist
      //i then use my method from the mover class called checkDistance so I can get the distance from the squirrel to the acorn nut objects
      //if the distance is less than 200, they start to be attracted to the squirrel and move around.
      //if the distance is less than 10, it means the squirrel is about to eat the acorn and it will be then removed from the arraylist
      
      for (int i=0; i<nuts.size();i++){
        
       Objects bDist = nuts.get(i);
       
       float d = mover.checkDistance(bDist);

       if(d<200){
        if(nuts.get(i).getMass()< mover.mass){
          PVector attract = mover.attract(nuts.get(i));
          nuts.get(i).applyForce(attract);
          nuts.get(i).checkEdges();
          if(d<10){
            nuts.remove(i);
            float moverMass= mover.mass;
            massCounter = moverMass +5;
            mover.setMass(massCounter);
           }
        }
     }
   }
  //once the array list is = 0 the game is done!
     if(nuts.size()==0){
       gameOver();
     }
     
     //for loop to display the ice patches
       for (int i=0; i<slips.length;i++){
          
         slips[i].display();
   
   //if one of the ice patches contains the squirrel mover object, it applies the iceSlip force
         if (slips[i].contains(mover)){
         PVector iceSlip = slips[i].ice(mover);
        
         mover.applyForce(iceSlip);
          
       }
       

       
  }

//update, display, checkEdges of the mover and also show the score!
mover.update();
mover.checkEdges();
mover.display();
score();


fill(0);

}

//method to print the score and show the squirrel's weight
void score() {
  
  int score = nuts.size();
  float fed = mover.mass;
  
  stroke(0);
  fill(0);
  textSize(12);
  text(("Acorn's Left: " + score),10,565);
  text(("Squirrely's Weight: " + fed/10 + "lb"),10,585);
  
 
}

void gameOver() {
  
  //game over text and a little squirrel advice
  stroke(0);
  fill(0);
  textSize(14);
  text("GAME OVER", width/3, height/3);
  text("Squirrely's advice: save an acorn for a rainy day", 150, 500);


}