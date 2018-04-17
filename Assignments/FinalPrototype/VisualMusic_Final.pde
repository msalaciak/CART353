/*
Visual Sample Player --
Written by Matthew Salaciak 29644490

The purpose of this program is to have a visual non-linear interface to jam with samples.
Each square object represents a sample. 
The types of samples are grouped by color, each color group has squares of different shades to indicate that they are unique samples but within the same group.
By clicking on a square, you trigger a sample.
Samples will trigger at the start of the bar represented when the moving line is at the top of the window
Triggered Samples stop changing position and begin to move to the beat
To stop a sample and mute a sample, put your mouse over the square object and press any key, it will start moving again and stop moving to the beat
There is 2 effects to add to the main out if desired.
If you are really loving the jam, hit record and it will save it to the project filepath.
All samples were created, recorded and programmed by myself at my studio

USER WARNING: All samples may be in sync with each other but they may not work musically...part of the fun of exploring the shapes and jamming :)

controlP5 error warning in console is explained with the controlP5 void method on the main file, no effect on program.


*/

//import Minim, ControlP5 and Java.IO libraries 
import ddf.minim.*;
import ddf.minim.ugens.*;
import java.io.FilenameFilter;
import controlP5.*;
import java.io.*;




//declaring variables, objects, arraylists and arrays

//Minim objects
 Minim minim;
 AudioOutput out;
 Gain gainDelay;
 Gain gainFlanger;
 AudioRecorder recorder;
 Summer sum = new Summer();
 Summer sum1 = new Summer();

 // SamplePlayer, Shape, Effects, Sequencer line and Tick objects
 SamplePlayer samples;
 Shapes shapes;
 Tick tick;
 RecordEffects effects1;
 Movement move;
 
//ControlP5 object and Interface Objects
 ControlP5 cp5;
 UI delaySlider;
 UI flangerSlider;
 RecorderButton button;
 
 //Sample trigger boolean array
 SampleRows sampleRowArray;


 //Tick variables 
 int count =0;
 int beat = 0;
 int bpm = 60;

//floats to shift colors and storing old mass of shape
 float shiftColor=0;
 float oldMass ;
 
 //String's for recording file, and UI interfaces
 String fileName = "Recording--1.wav";
 String delaySliderName = "Delay Mix";
 String flangerSliderName = "Flanger Mix";
 String buttonName = "Record";
 
//Arraylist's of shapes, samplePlayers and SampleRows
 ArrayList<Shapes> shapeList;
 ArrayList<SamplePlayer> sampleList;
 ArrayList<SampleRows> sampleRowList;


//File object and String Array for files
 File folder;
 String [] files;
 

void setup() {
  cursor(CROSS);
  size(1024,768);
 
  
  
     
    //This method takes all the files in the data folder
    //Grabs all the .wav samples
    File folder = new java.io.File(dataPath(""));
    
     //This calls the a filter to make sure that only .wav files are added to the files folder
    files = folder.list(FILTER);
   
   //set up  arrayLists for samplePlayers, Shapes and SampleRows and creates a shapes object with default constructor
    shapes= new Shapes();
    
    sampleList = new ArrayList<SamplePlayer>();
    shapeList = new ArrayList<Shapes>();
    sampleRowList = new ArrayList<SampleRows>();
    
    //Calls Shapes Method getArrayList, which creates an array of shapes that do not overlap ** furthur explained in Shapes class
    shapeList = shapes.getArrayList(files.length);
    
    


   //set up of UI for delay and flanger slider
   //set up of Record Button
   //set up of Movement object, which is the line that shows the sequence is moving between 1-16 steps on beat.
    move = new Movement();
    cp5 = new ControlP5(this);
    delaySlider = new UI(delaySliderName,100,720);
    flangerSlider = new UI(flangerSliderName,450,720);
    button = new RecorderButton(buttonName,825,720);
    
   
    
    
 
  //set up minim and minim output, minim gain ojbect to control the level of delay/flanger effect
  //Set up of recordEffects object to create delay and flanger effect
    minim = new Minim(this);
    out   = minim.getLineOut();
    RecordEffects effects1 = new RecordEffects(.4);
    recorder = minim.createRecorder(out, fileName );
    gainDelay = new Gain(0.f);
    gainFlanger = new Gain(0.f);
   
    //Patches all the output sums from the effects into each of their own gains and the sum outputs of all the SamplePlayers into one output sum
    sum.patch(effects1.getMyDelay()).patch(gainDelay).patch(sum1);
    sum.patch(effects1.getMyFlanger()).patch(gainFlanger).patch(sum1);
    
    sum.patch(sum1).patch(out);
    
 
   
 

 
   //create arraylist for SamplePlayer and SampleRows
   //takes a fileName from the file array, creates a SamplePlayer object, adds it to the SamplePlayer arraylist
   //Creates a SampleRows object, and adds it to the SampleRows arraylist.
   //Set's color of each shape based on int i which is how many samples/shapes there are
   //it also increments shiftColor by .25 to be used in the lerpColor function in Shapes **furthur explained in Shapes Class
   //if shiftColor exceeds 1, it resets to 0 since lerpColor only accepts values between 0-1
   
    for (int i = 0; i<shapeList.size();i++) {
       shiftColor +=.25;
       if(shiftColor>1){
         shiftColor =0;
        }  
       String fileName = files[i];
       SamplePlayer samples = new SamplePlayer(i,fileName);
       sampleList.add(samples); 
       sampleRowArray = new SampleRows();
       sampleRowList.add(sampleRowArray);
       shapeList.get(i).setColor(i,shiftColor);
       
      
    }
    
    //set up beat and bpm variables, and out to clock the sequencer
    //This code was inspired by Minim's drum sequencer example by 
       beat = 0;
       out.setTempo( bpm);
       out.playNote( 0, 0.25f, new Tick() );
       
 
      

}

void draw() {


   background(169,169,169);
   
     
      //Code adapted from controlP5 examples based on reading slider information
      //gets the value from the slider by calling the getController() & getValue() methods from the UI class/controlP5 library
      //uses the setValue() funciton from minim's Gain class to set the gain value of delay and flanger
      gainDelay.setValue(cp5.getController(delaySliderName).getValue());
      gainFlanger.setValue(cp5.getController(flangerSliderName).getValue());
      

       //This for loop gets SampleRows, Shapes and SamplePlayer objects from their respective arraylists
       //two forces are created so shapes can move in somewhat opposite directions
       
     for (int i = 0; i<shapeList.size();i++) {
            PVector move1 = new PVector(-0.1,0.1);
            PVector move2 =new PVector(0.2,0.2);
            SampleRows sampleRow = sampleRowList.get(i);
            Shapes s1 = shapeList.get(i);
     
             //if beat is even it applies move1 force, if odd it applies move2 force
            if(i%2==0){
              s1.applyForce(move1);
              } else{
                s1.applyForce(move2);
                }
          
          //This method calculates the distance between the mouse and the position x&y of the shape s1 from the arrayList
          float d = dist(mouseX,mouseY,s1.position.x,s1.position.y);
          
          //this method saves the old mass from the shape s1 because when triggered the shape changes between old and new mass on beat to make it move in time
          //when the sample is no longer triggered, it reverts to its old mass
          oldMass = s1.getMass();
          
          //this method gets the SamplePlayer from the SamplePlayer arrayList and saves it to an object 
          SamplePlayer sp1 = sampleList.get(i);
          //this is the playShape method ** furthur explained in the Shapes class
          //it is passed the distance calculated between mouse x&y and x&y of shape1, it passes a SampleRow and SamplePlayer object and the oldMass
          s1.playShape(d,sp1,sampleRow, oldMass);
          
             
             
             
            //update, checkedges and display methods
            s1.update();
            s1.checkEdges();
            s1.display();
            

          }
          
          
          //display method for the Movement class which makes the sequencer line move.
      move.display();
      
     
    
      
    

   fill(0); 

}
    //needed method from controlP5 to communicate with buttons/sliders
    //this method was adapted from the controlP5 slider provided example
    //not having anything in this method is why there is that error warning in the console,
    //according to controlP5 forum posts it is okay to leave this blank so we can use the other functions based of controlEvent
    //work around is having it just print in console the name of the object being clicked but I found it confusing when i was using console to debug so I removed it
    public void controlEvent(ControlEvent theEvent) {
          
  
      }

   //record button method adapted from reading button information example provided by contorlP5
   //when clicked and count is  = 0, it begins to record, using the minim recorder object, and changes color of button to red
   //when the count is greater than 1 (which happens on next click) it changes the color back to grey and stops the recording and saves the file using the minim recorder object
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
          
          //load file and exclude anything thats not .wav
          //code was adapted from comp 249 lecture at concordia university
        static final FilenameFilter FILTER = new FilenameFilter() {
          static final String  EXT = ".wav";
         @ Override boolean accept(File path, String name) {
          name = name.toLowerCase();
          return name.endsWith(EXT);
         }
        };

          
 
