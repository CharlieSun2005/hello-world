import ddf.minim.*;

class SoundFX extends Minim {
  AudioPlayer pop = loadFile("Suction Cup Pull.wav");
  AudioPlayer eat = loadFile("Eat.wav");
  AudioPlayer freedom = loadFile("1-01 Freedom.mp3");

  SoundFX(PApplet applet) {
    super(applet);
  }


  void pop() {
    pop.rewind();
    pop.play();
  }
   void eat() {
    eat.rewind();
    eat.play();
  }
   void freedom() {
    if (!freedom.isPlaying()) {
      freedom.rewind();
      freedom.play();
    }
   }
}
