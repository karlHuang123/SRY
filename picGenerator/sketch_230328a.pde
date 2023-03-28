PImage img;
void setup(){
  size(500, 500);
  background(255);
  img = loadImage("appleThree.jpeg");
  img.resize(width, height);
}

void draw(){
  background(255);
  fill(0);
  noStroke();
  float ratio = float(height)/float(width);
  float tilesX = map(mouseX, 0, width, 10, 100);
  float tilesY = ratio * tilesX;
  float tilesXSize = width/tilesX;
  float tilesYSize = height/tilesY;
  for (int y = 0; y < img.height; y+=tilesYSize) {
    for (int x = 0; x < img.width; x+=tilesXSize) {
      color c = img.get(x, y);
      float b = map(brightness(c), 0, 255, 1, 0);
      pushMatrix();
      translate(x, y);
      rect(0, 0, b*tilesXSize, b*tilesYSize);
      popMatrix();
    }
  }
}