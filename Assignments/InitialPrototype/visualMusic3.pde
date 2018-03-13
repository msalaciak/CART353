import ddf.minim.*;
import ddf.minim.ugens.*;
Minim minim;
AudioOutput out;

 Shapes shapes;
 ArrayList<Shapes> shapeList;
 SamplePlayer [] samples = new SamplePlayer[6];
 boolean[] sample1Row = new boolean[16];
 boolean[] sample2Row = new boolean[16];
 boolean[] sample3Row = new boolean[16];
 boolean[] sample4Row = new boolean[16];
 boolean[] sample5Row = new boolean[16];
 boolean[] sample6Row = new boolean[16];
 int bpm =60;
 int beat;
 Sampler sounds1;
 Sampler sounds2;
 Sampler sounds3;
 Sampler sounds4;
 Sampler sounds5;
 Sampler sounds6;

 
 // at the end of its noteOff method. 
class Tick implements Instrument
{
  void noteOn( float dur )
  {
    if ( sample1Row[beat] ) sounds1.trigger();
    if ( sample2Row[beat] ) sounds2.trigger();
    if ( sample3Row[beat] ) sounds3.trigger();
    if ( sample4Row[beat] ) sounds4.trigger();
    if ( sample5Row[beat] ) sounds5.trigger();
    if ( sample6Row[beat] ) sounds6.trigger();
  }
  
  void noteOff()
  {
    // next beat
    beat = (beat+1)%16;
    // set the new tempo
    out.setTempo( bpm );
    // play this again right now, with a sixteenth note duration
    out.playNote( 0, 0.25f, this );
  }
}


  

void setup() {
  size(800,600);
    
    shapes= new Shapes();
 
    shapeList = shapes.getArrayList(6);
  
    minim = new Minim(this);
    out   = minim.getLineOut();
 
    
    for (int i = 0; i<shapeList.size();i++) {
      float x=0;
      float y=0;
       Shapes s1 = shapeList.get(i);
       x=s1.x;
       y=s1.y;
       samples[i] = new SamplePlayer(x,y,i);
       
    }
    
    sounds1 = new Sampler("drums1.mp3",1,minim);
    sounds2 = new Sampler("drums3.mp3",1,minim);
    sounds3 = new Sampler("drums4.mp3",1,minim);
    sounds4 = new Sampler("pad2.mp3",1,minim);
    sounds5 = new Sampler("pad3.mp3",1,minim);
    sounds6 = new Sampler("bass2.mp3",1,minim);
    
    sounds1.patch(out);
    sounds2.patch(out);
    sounds3.patch(out);
    sounds4.patch(out);
    sounds5.patch(out);
    sounds6.patch(out);
    
    
    
           beat = 0;
           out.setTempo( bpm );
           out.playNote( 0, 0.25f, new Tick() );
          
    
  
  
}

void draw() {
  background(169,169,169);
   
   for (int i = 0; i<shapeList.size();i++) {
          PVector move = new PVector(0.1,0.1);
          Shapes s1 = shapeList.get(i);
          int step=samples[i].stepid;
          s1.applyForce(move);
          
          
          
          
          
          
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