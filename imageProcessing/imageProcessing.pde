
void setup() {
  size(259, 194);
  PImage img = loadImage("dog.jpeg");
  image(img, 0, 0);
  loadPixels();


  reverseBrightness();
  updatePixels();
  //  save("AllDenominationsBW.jpg");
}

void messUpColors() {
  int i = 0;
  for (int pxl : pixels) {
    pixels[i++] = pxl * 3;
  }
}

void swapRedandBlue() {
  int i = 0;
  for (int pxl : pixels) {
    float r = red(pxl);
    float b = blue(pxl);
    int newColor = color(b, green(pxl), r);
    pixels[i++] = newColor;
  }
}

void reverseBrightness() {
  int i = 0;
  for (int pxl : pixels) {
    float r = red(pxl);
    float b = blue(pxl);
    float g = green(pxl);
    int newColor = color(255 - r, 255 - g, 255 - b);
    pixels[i++] = newColor;
  }
}
