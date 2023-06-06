public class Stain {
  float xCoor, yCoor;
  int lifespan;
  PImage img;
  int rotationAngle;
  int fruitIndex;

  public Stain (float xCoor, float yCoor, int fruitIndex) {
    this.xCoor = xCoor;
    this.yCoor = yCoor;
    img = loadImage("stain.png");
    lifespan = 100;
    rotationAngle = (int)Math.floor(Math.random() *(361));
    this.fruitIndex = fruitIndex;
  }

  void display() {
    modify();
    //image(img,xCoor - img.width/2,yCoor - img.height/2);

    pushMatrix();
    translate(xCoor, yCoor);
    rotate(rotationAngle);
    colorIn();
    image(img, -img.width/2, -img.height/2);
    noTint();
    popMatrix();

    lifespan--;
  }

  int getDuration() {
    return lifespan;
  }

  private void modify() {
    for (int i = 0; i < img.width; i++) {
      for (int j = 0; j < img.height; j++) {
        if (alpha(img.get(i, j)) >= 0) {
          img.set(i, j, color(red(img.get(i, j)), blue(img.get(i, j)), green(img.get(i, j)), alpha(img.get(i, j)) - 2));
        }
      }
    }
  }
  
  private void colorIn() {
    if (fruitIndex == 1 || fruitIndex == 4) {
      //red is the default
    }
    if (fruitIndex == 2 || fruitIndex == 6) {
      tint(255, 255, 102);
    }
    if (fruitIndex == 3) {
      tint(204, 255, 102);
    }
    if (fruitIndex == 5) {
      tint(255, 153, 51);
    }
    if (fruitIndex == 7) {
      tint(255,255,255);
    }
  }
}
