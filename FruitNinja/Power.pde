public class Power extends Fruit {
  String type;
  public Power(float xCoor, float yCoor, float xSpeed, float ySpeed, float rotationSpeed, int rotationDirection, PImage img, String type) {
    super(xCoor,yCoor,xSpeed,ySpeed,rotationSpeed,rotationDirection,img);
    this.type = type;
  }
  String whatAmI() {
    return "power";
  }
  String getType() {
    return type;
  }
}
