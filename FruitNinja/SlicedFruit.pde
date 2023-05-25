public class SlicedFruit extends Fruit {
  
  public SlicedFruit(float xCoor, float yCoor, float xSpeed, float ySpeed, float rotationSpeed, int rotationDirection, float radius) {
     super(xCoor,yCoor,xSpeed,ySpeed,rotationSpeed,rotationDirection,radius); 
  }
  
  public SlicedFruit(float xCoor, float yCoor, float xSpeed, float ySpeed, float rotationSpeed, int rotationDirection, PImage img) {
     super(xCoor,yCoor,xSpeed,ySpeed,rotationSpeed,rotationDirection,img); 
  }
  
  void display() {
    if (getType().equals("circle")) {
      update();
      pushMatrix();
      translate(position.x, position.y);    
      rotate(rotationAngle * rotationDirection);
      fill(c);
      ellipse(0,0,radius,radius/2);
      noFill();
      popMatrix();
    }
    if (getType().equals("image")) {
      update();
      pushMatrix();
      translate(position.x, position.y);    
      rotate(rotationAngle * rotationDirection);
      fill(c);
      image(img,-img.width/2,-img.height/2);
      noFill();
      popMatrix();
    }
  }
}
