/*this is the code not working, the samples trigger not exactly at the "1" and tend to
retrigger at random beats, my guess is because the booleans set up to trigger
sounds requires it to be one the 1's beat (array 0) and if you notice the 
print out of the beat int, it doesnt go sequentially like in does in visualmusic3




*/


import ddf.minim.*;
import ddf.minim.ugens.*;

//declaring variables, objects, arraylists and arrays

 Minim minim;
 AudioOutput out;
 SamplePlayer samples;
 Shapes shapes;
 Tick tick;
 int beat = 0;
 int bpm = 60;
 ArrayList<Shapes> shapeList;
 ArrayList<SamplePlayer> sampleList;

 String [] files = new String [6];{
   files [0]= "drums1.mp3";
   files [1] = "drums3.mp3";
   files [2]= "drums4.mp3";
   files [3]= "pad2.mp3";
   files [4]= "pad3.mp3";
   files [5]= "bass2.mp3";
 }
 boolean[] sample1Row = new boolean[16];
 boolean[] sample2Row = new boolean[16];
 boolean[] sample3Row = new boolean[16];
 boolean[] sample4Row = new boolean[16];
 boolean[] sample5Row = new boolean[16];
 boolean[] sample6Row = new boolean[16];
 


void setup() {
  size(800,600);
    //set up shapes array list
    shapes= new Shapes();
    sampleList = new ArrayList<SamplePlayer>();
    shapeList = shapes.getArrayList(6);
  //set up minim and minim output
    minim = new Minim(this);
    out   = minim.getLineOut();
    
    //create arraylist for sampleplayer
    for (int i = 0; i<shapeList.size();i++) {
      float x=0;
      float y=0;
       Shapes s1 = shapeList.get(i);
       x=s1.x;
       y=s1.y;
       String fileName = files[i];
       SamplePlayer samples = new SamplePlayer(x,y,i,fileName);
       sampleList.add(samples);
    }
    
       beat = 0;
       out.setTempo( bpm);
       out.playNote( 0, 0.25f, new Tick() );
    
 
}

void draw() {
  background(169,169,169);
   //draw the shapes, and apply the move force
   for (int i = 0; i<shapeList.size();i++) {
          PVector move = new PVector(0.1,0.1);
          Shapes s1 = shapeList.get(i);
          int step=sampleList.get(i).stepid;
          s1.applyForce(move);
          
          //used to calculate distance
          //if the shape shares the same x and y as the samplePlayer object, 
          //it triggers the sample
          float d = dist(s1.x,s1.y,mouseX,mouseY);
          
          if((d<100 )&&step==0)
            sample1Row[0] = true;
             if((d<100  )&&step==1)
            sample2Row[0] = true;
             if((d<100 )&&step==2)
            sample3Row[0] = true;
              if((d<100  )&&step==3)
            sample4Row[0] = true;
             if((d<100)&&step==4)
            sample5Row[0] = true;
             if((d<100 )&&step==5)
            sample6Row[0] = true;
            
             if((d<100  && keyPressed == true)&&step==0)
            sample1Row[0] = false;
             if((d<100  && keyPressed == true)&&step==1)
            sample2Row[0] = false;
             if((d<100  && keyPressed == true)&&step==2)
            sample3Row[0] = false;
            if((d<100  && keyPressed == true)&&step==3)
            sample4Row[0] = false;
             if((d<100  && keyPressed == true)&&step==4)
            sample5Row[0] = false;
             if((d<100  && keyPressed == true)&&step==5)
            sample6Row[0] = false;
            
            if(d<300 && keyPressed ==true){
              sample1Row[0] = false;
              sample2Row[0] = false;
              sample3Row[0] = false;
              sample4Row[0] = false;
              sample5Row[0] = false;
              sample6Row[0] = false;
            }
           
            
          //println(step);
         
            s1.update();
          s1.checkEdges();
          s1.display();
          }
          
           
   
 
        
   fill(0); 
   println(beat);
 
}
