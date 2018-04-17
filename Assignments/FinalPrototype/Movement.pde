import ddf.minim.analysis.*;
import ddf.minim.*;





class Movement{
float moveLine =37;
int counter = 0;


  Movement(){
 
 
  }


void display()
{
         
     
     
  // draw the waveforms
if(beat ==0) moveLine= 37;  
if(beat ==1) moveLine = 87;
if(beat ==2) moveLine = 124;
if(beat ==3) moveLine = 161;
if(beat ==4) moveLine = 198;
if(beat ==5) moveLine = 235;
if(beat ==6) moveLine = 272;
if(beat ==7) moveLine = 309;
if(beat ==8) moveLine =346;
if(beat ==9) moveLine = 383;
if(beat ==10)moveLine = 420;
if(beat ==11)moveLine =457;
if(beat ==12)moveLine = 494;
if(beat ==13)moveLine= 531;
if(beat ==14)moveLine =568;
if(beat ==15)moveLine =590;






  

  for( int i = 0; i < out.bufferSize() - 1; i++ )
  {
    // find the x position of each buffer value
    float x1  =  map( i, 0, out.bufferSize(), 0, width );
    float x2  =  map( i+1, 0, out.bufferSize(), 0, width );
    
    // draw a line from one buffer position to the next for both channels
    line( x1, moveLine - out.mix.get(i)*50, x2, moveLine - out.mix.get(i+1)*50);
    stroke(255);
   
  }  
  
  
}





}
