import processing.video.*;

int numPixelsWide, numPixelsHigh;
int blockSize = 8;
Movie mov;
color movColors[];

void setup() {
  size(640, 425);
  noStroke();
  mov = new Movie(this, "mario.mp4");
  mov.loop();
  numPixelsWide = width / blockSize;
  numPixelsHigh = height / blockSize;
  println(numPixelsWide);
  movColors = new color[numPixelsWide * numPixelsHigh];
}

// Display values from movie
void draw() {
  scale(0.9);
  if (mov.available() == true) {
    mov.read();
    mov.loadPixels();
    int count =0 ;
    for (int j = 0; j < numPixelsHigh; j++) {
      for (int i = 0; i < numPixelsWide; i++) {
        movColors[count] = mov.get(i*blockSize, j*blockSize);
        count++;
      }
    }
  }

  background(0);
  for (int j = 0; j < numPixelsHigh; j++) {
    for (int i = 0; i < numPixelsWide; i++) {
      fill(movColors[j*numPixelsWide + i]);
     ellipse(i*blockSize, j*blockSize, blockSize, blockSize);
    }
  }

}