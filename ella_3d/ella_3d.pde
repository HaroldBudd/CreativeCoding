color bg = #f1f1f1;
color fg = 0;

PImage img;
int tilesX = 100;
int tilesY = 100;

void setup() {
  size(600,600, P3D);
  img = loadImage("ella.jpg");
  img.resize(tilesX, tilesY);
}

void draw() {
  background(bg);
  fill(fg);
  noStroke();

  float tileW = width / tilesX;
  float tileH = height / tilesY;
  rectMode(CENTER);

  push();
  translate(width/2, height/2);
  scale(0.8);
  float rotation = map(sin(radians(frameCount * 2)), 1, -1, -45, 45);
  rotateY(radians(rotation));

  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {

      // the color of the pixel
      color c = img.get(x, y);

      // the brightness of the pixel
      float b = brightness(c);

      // the scalar for the tiles
      // the brightness, mapped to a range between 1 and 0
      float s = map(b, 0, 255, 1, 0);

      // position z
      // the brightness, mapped to a range between -1 and 1
      float z = map(b, 0, 255, -1, 1);

      // magnitude of the tiles on the z-axis
      float mag = 200;

      push();
      translate(x * tileW - width/2, y * tileH - height/2, z * mag);
      ellipse(0, 0, tileW * s * 1.5, tileH * s * 1.5);
      pop();
    }
  }

  pop();
}
