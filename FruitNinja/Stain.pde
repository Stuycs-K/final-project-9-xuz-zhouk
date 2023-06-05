public class Stain {
  float xCoor, yCoor;
  int lifespan;
  PImage img;
  int rotationAngle;

  public Stain (float xCoor, float yCoor) {
    this.xCoor = xCoor;
    this.yCoor = yCoor;
    img = loadImage("stain.png");
    lifespan = 100;
    float n = 0.111;
    rotationAngle = (int)Math.floor(Math.random() *(361));
  }

  void display() {
    modify();
    //image(img,xCoor - img.width/2,yCoor - img.height/2);
    
    pushMatrix();
    translate(xCoor, yCoor);
    rotate(rotationAngle);
    image(img, -img.width/2, -img.height/2);
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
}
