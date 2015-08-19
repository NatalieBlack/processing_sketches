import ddf.minim.*;
import ddf.minim.ugens.*;
float px1,px2,py, ax1,lx1,ly1,lx2,ly2,ay;
int WINDOWSIZE;
int k, ki, t, ty;
Minim minim;

AudioOutput out;
AInstrument awave;
BInstrument bwave;

class AInstrument implements Instrument
{
  Oscil wave;
  Line  ampEnv;
  
  AInstrument( float frequency )
  {
    // make a sine wave oscillator
    // the amplitude is zero because 
    // we are going to patch a Line to it anyway
    wave   = new Oscil( frequency, 0, Waves.QUARTERPULSE );
    ampEnv = new Line();
    ampEnv.patch( wave.amplitude );
  }
  
  // this is called by the sequencer when this instrument
  // should start making sound. the duration is expressed in seconds.
  void noteOn( float duration )
  {
    // start the amplitude envelope
    ampEnv.activate( duration, 0.5f, 0 );
    // attach the oscil to the output so it makes sound
    wave.patch( out );
  }
  
  // this is called by the sequencer when the instrument should
  // stop making sound
  void noteOff()
  {
    wave.unpatch( out );
  }
}
class BInstrument implements Instrument
{
  Oscil wave;
  Line  ampEnv;
  
  BInstrument( float frequency )
  {
    // make a sine wave oscillator
    // the amplitude is zero because 
    // we are going to patch a Line to it anyway
    wave   = new Oscil( frequency, 1, Waves.SINE );
    ampEnv = new Line();
    ampEnv.patch( wave.amplitude );
  }
  
  // this is called by the sequencer when this instrument
  // should start making sound. the duration is expressed in seconds.
  void noteOn( float duration )
  {
    // start the amplitude envelope
    ampEnv.activate( duration, 0.5f, 0 );
    // attach the oscil to the output so it makes sound
    wave.patch( out );
  }
  
  // this is called by the sequencer when the instrument should
  // stop making sound
  void noteOff()
  {
    wave.unpatch( out );
  }
}
void setup(){
    minim = new Minim(this);
  awave = new AInstrument(Frequency.ofPitch( "C3" ).asHz() );
  bwave = new BInstrument( Frequency.ofPitch( "C2" ).asHz() );


  out = minim.getLineOut();

  WINDOWSIZE = 200;
  size(WINDOWSIZE, WINDOWSIZE);
  px1 = 82;
  px2 = 114;
  py = 68;
  ax1 = 85;
  lx1 = 0;
  ly1 = 0;
  lx2 = 0;
  ly2 = 0;
  ay = 125;
  rectMode(CENTER);
  k = 0;
  ki = 0;
  t = 1;
  ty = 1;
}

void draw(){
  fill(color(0,150,250,75));
  background(230);
  
  //body
  rect(100,100,20,100);
  
  fill(color(0,150,250));

  //head
  ellipse(100,70,60,60);
  
  //eyes
  ellipse(83,70,20,25); 
  ellipse(115,70,24,27); 
  
  if(ki++ % 7 == 0){
    k++;
    ax1 = t * map(k%20, 0, 19, -20, 20);

    ay = ty * map(k%20, 0, 19, -28, 30);
    if(k%10 == 9) {
      ty = ty * -1;
      

      if(k%20 == 19){
        t = t * -1;
        out.playNote( 0, 1.0, awave);      
      } else {
        
        out.playNote( 0, 1.0, bwave);
      }
    }
  }
  //arms
  line(90,105,85+ax1,125+ay);
  line(110,105,115+ax1,125+ay);
  
  if(int(random(200)) == 1) {
    //out.playNote( 0, 1, "C3" );
    lx1 = t * map(k%20, 0, 19, -5, 5);
  }
   if(int(random(200)) == 2) {
    //out.playNote( 0, 1, "D3" );
    lx2 = t * map(k%20, 0, 19, -5, 5);
  }
  //legs
  line(90,150,90+lx1,160);
  line(110,150,110+lx2,160);
 
  //pupils
  px1 = map(int(mouseX), 0, WINDOWSIZE, 78, 90);
  px2 = map(int(mouseX), 0, WINDOWSIZE, 108, 124);
  py = map(int(mouseY), 0, WINDOWSIZE, 60, 80);

  ellipse(px1,py, 2, 2);
  ellipse(px2,py, 2, 2);
}
