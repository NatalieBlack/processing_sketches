

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

// to make an Instrument we must define a class
// that implements the Instrument interface.
class SineInstrument implements Instrument
{
  Oscil wave;
  Line  ampEnv;
  ADSR adsr;
  
  SineInstrument( float frequency )
  {
    // make a sine wave oscillator
    // the amplitude is zero because 
    // we are going to patch a Line to it anyway
      wave   = new Oscil( frequency, 0, Waves.SINE );
    ampEnv = new Line();
    adsr = new ADSR( 1, 0.1, 0.1, 0.1, 0.1,0,0 );
    ampEnv.patch( wave.amplitude ).patch(adsr);
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

void setup()
{
  size(512, 200, P3D);
  
  minim = new Minim(this);
  
  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();
  
  // when providing an Instrument, we always specify start time and duration

  
  // we can use the Frequency class to create frequencies from pitch names
  //out.playNote( 2.0, 2.9, new SineInstrument( Frequency.ofPitch( "C3" ).asHz() ) );
  //out.playNote( 3.0, 1.9, new SineInstrument( Frequency.ofPitch( "Db3" ).asHz() ) );
  //out.playNote( 4.0, 0.9, new SineInstrument( Frequency.ofPitch( "D3" ).asHz() ) );
}
void keyPressed(){
  switch( key )
  {
    case 'j': 
  out.playNote( 0, 5, new SineInstrument( Frequency.ofPitch( "C3" ).asHz() ) );

  stroke(255);
      break;
     
    case 'k':
  out.playNote( 0, 5, new SineInstrument( Frequency.ofPitch( "Db3" ).asHz() ) );
  stroke(0);
      break;
  }
}
void draw()
{
  background(150);

  
  // draw the waveforms
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    line( i, 50 + out.left.get(i)*50, i+1, 50 + out.left.get(i+1)*50 );
    line( i, 150 + out.right.get(i)*50, i+1, 150 + out.right.get(i+1)*50 );
    fill(out.getVolume());
    ellipse(100,100, out.left.get(i)*100, out.right.get(i)*100);
  }
}
