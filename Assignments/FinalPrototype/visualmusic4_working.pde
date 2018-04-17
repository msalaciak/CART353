/*
WORKING AS OF NOW
*/


import ddf.minim.*;
import ddf.minim.ugens.*;

import controlP5.*;




//declaring variables, objects, arraylists and arrays

 Minim minim;
 Movement move;
 AudioOutput out;
 SamplePlayer samples;
 Shapes shapes;
 Tick tick;
 Summer sum = new Summer();
 Summer sum1 = new Summer();
 Gain gainDelay;
 Gain gainFlanger;
 RecordEffects effects1;
 AudioRecorder recorder;

 ControlP5 cp5;
 UI delaySlider;
 UI flangerSlider;
 RecorderButton button;



 int count =0;
 int beat = 0;
 int bpm = 60;
 
 float oldMass ;
 String fileName = "Recording--1.wav";
 String delaySliderName = "Delay Mix";
 String flangerSliderName = "Flanger Mix";
 String buttonName = "Record";
 

 ArrayList<Shapes> shapeList;
 ArrayList<SamplePlayer> sampleList;

 String [] files = new String [6];{
   files [0]= "drums1.mp3";
   files [1] = "drums3.mp3";
   files [2]= "drums4.mp3";
   files [3]= "drums2.mp3";
   files [4]= "pad3.mp3";
   files [5]= "pad2.mp3";
   
 }
 boolean[] sample1Row = new boolean[16];
 boolean[] sample2Row = new boolean[16];
 boolean[] sample3Row = new boolean[16];
 boolean[] sample4Row = new boolean[16];
 boolean[] sample5Row = new boolean[16];
 boolean[] sample6Row = new boolean[16];


 

 


void setup() {
  cursor(CROSS);
  size(800,600);
    
   //set up shapes array list
    shapes= new Shapes();
    sampleList = new ArrayList<SamplePlayer>();
    shapeList = new ArrayList<Shapes>();
    
    shapeList = shapes.getArrayList(files.length);
    


   //set up sequencer movement & UI
    move = new Movement();
    cp5 = new ControlP5(this);
    delaySlider = new UI(delaySliderName,50,550);
    flangerSlider = new UI(flangerSliderName,350,550);
    button = new RecorderButton(buttonName,650,550);
    
   
    
    
 
  //set up minim and minim output
    minim = new Minim(this);
    out   = minim.getLineOut();
    RecordEffects effects1 = new RecordEffects(.4);
    recorder = minim.createRecorder(out, fileName );
    gainDelay = new Gain(0.f);
    gainFlanger = new Gain(0.f);
   
    sum.patch(effects1.getMyDelay()).patch(gainDelay).patch(sum1);
    sum.patch(effects1.getMyFlanger()).patch(gainFlanger).patch(sum1);
    
    sum.patch(sum1).patch(out);
    
   
    
   
 


   //create arraylist for sampleplayer
    for (int i = 0; i<shapeList.size();i++) {
       String fileName = files[i];
       SamplePlayer samples = new SamplePlayer(i,fileName);
       sampleList.add(samples); 
      
    }
    
    //set up beat and bpm variables, and out to clock the sequencer
       beat = 0;
       out.setTempo( bpm);
       out.playNote( 0, 0.25f, new Tick() );
       
 
      

}

void draw() {
  background(169,169,169);
      
      gainDelay.setValue(cp5.getController(delaySliderName).getValue());
      gainFlanger.setValue(cp5.getController(flangerSliderName).getValue());
      
      
     

   //draw the shapes, and apply the move force
   for (int i = 0; i<shapeList.size();i++) {
          PVector move = new PVector(-0.1,0.1);
          PVector move2 =new PVector(0.2,0.2);
          
            Shapes s1 = shapeList.get(i);
            int step = sampleList.get(i).stepid;
            s1.setColor(i);
             
          if(i%2==0){
            s1.applyForce(move);
          }
          else{
            s1.applyForce(move2);
          }
          
      //used to calculate distance
          //if the shape shares the same x and y as the samplePlayer object, 
          //it triggers the sample
          float d = dist(mouseX,mouseY,s1.position.x,s1.position.y);
          SamplePlayer sp1 = sampleList.get(i);
          oldMass = s1.getMass();
         

          if (s1.clicked) {
            PVector noMove = new PVector(0,0);
            s1.velocity = noMove;
            s1.acceleration = noMove;
            s1.setMass(s1.mass + s1.massMove());
   
          }
           
          if( d<s1.mass && mousePressed == true){
            s1.setIsClicked(true); 
            
           
            }
             if(s1.isClicked() && step == 0 ) {
              sample1Row[0] = true;
         }  
         if (d<s1.mass && keyPressed == true && step ==0) {
           s1.setIsClicked(false);
           sample1Row[0] = false;
           sp1.mute();
           s1.setMass(oldMass);
         }      
            
             if(s1.isClicked() && step == 1 ) {
              sample2Row[0] = true;
         }  
         if (d<s1.mass && keyPressed == true && step ==1) {
           s1.setIsClicked(false);
           sample2Row[0] = false;
           sp1.mute();
           s1.setMass(oldMass);
         }      
          if(s1.isClicked() && step == 2 ) {
              sample3Row[0] = true;
         }  if (d<s1.mass && keyPressed == true && step ==2) {
           s1.setIsClicked(false);
           sample3Row[0] = false;
           sp1.mute();
           s1.setMass(oldMass);
         }
               
          if(s1.isClicked() && step == 3 ) {
              sample4Row[0] = true;
         } if (d<s1.mass && keyPressed == true && step ==3) {
           s1.setIsClicked(false);
           sample4Row[0] = false;
           sp1.mute();
           s1.setMass(oldMass);
         }
     
          if(s1.isClicked() && step == 4 ) {
              sample5Row[0] = true;
         }if (d<s1.mass && keyPressed == true && step ==4) {
           s1.setIsClicked(false);
           sample5Row[0] = false;
           sp1.mute();
           s1.setMass(oldMass);
         }
        
          if(s1.isClicked() && step == 5 ) {
              sample6Row[0] = true;
         }if (d<s1.mass && keyPressed == true && step ==5) {
           s1.setIsClicked(false);
           sample6Row[0] = false;
           sp1.mute();
           s1.setMass(oldMass);
         }
            

         

            s1.update();
            s1.checkEdges();
            s1.display();

          }
          
      move.display();
      
     
    
      
    

   fill(0); 

}

    public void controlEvent(ControlEvent theEvent) {
          //println(theEvent.getController().getName());
  
      }

    // function colorA will receive changes from 
      // controller with name colorA
        public void Record() {
          
            if(count ==0){
              recorder.beginRecord();
              count +=1;
              cp5.get(buttonName).setColorBackground(color(255,0,0));
              cp5.get(buttonName).setColorForeground(color(255,0,0));
             } else if(count >0){
               cp5.get(buttonName).setColorBackground(color(111, 111, 111));
               cp5.get(buttonName).setColorForeground(color(111, 111, 111));
               recorder.save();
              println("Done saving.");
              }
          }
          
 
