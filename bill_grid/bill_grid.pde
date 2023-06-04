PImage img; 
import gifAnimation.*;

class GIF {
  GifMaker gif;
  GIF(PApplet app, String filename) {
    gif = new GifMaker(app, filename, 100);
    gif.setRepeat(0); // 0 means endless loop
  }

  void addFrame(int delay_in_frames) {
    gif.setDelay(delay_in_frames);
    gif.addFrame();
  }

  void save() {
    gif.finish();
    println("Done!");
  }
};


void setup() {
  size(800, 800);
  frameRate(5);
  ellipseMode(CORNER);
  img = loadImage("ella.jpg");
  img.resize(900,900);
}

void draw(){
  //background(0);
  image(img, 0,0);
  fill(#f1f1f1);
  noStroke();
  
  float tilesX = 3;
  float tilesY = 3;
  
  float tileW = width / tilesX; // weight of the sketch
  float tileH = height / tilesY;  
  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {
      push();
      translate(x * tileW, y * tileH);
      int selector = int(random(3));
      
      if (selector == 0) {
        rect(0, 0, tileW, tileH);
      } else if (selector == 1){
        ellipse(0,0, tileW, tileH);
      } else if (selector == 2) {
        fill(#69FFE5);
        ellipse(0,0,tileW, tileH);
      }
      pop();      
    }
  }
}
