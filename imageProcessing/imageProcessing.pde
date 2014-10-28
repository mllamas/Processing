
void setup() {
  size(625, 381);
  PImage img = loadImage("AllDenominations.jpg");
  image(img, 0, 0);
  loadPixels();
  int pixel = pixels[0];
  
  
  println("pixel="+pixel);
  println("red="+red(pixel)+" green="+green(pixel)+" blue="+blue(pixel);
  messUpColors();
  updatePixels();
//  save("AllDenominationsBW.jpg");
}
