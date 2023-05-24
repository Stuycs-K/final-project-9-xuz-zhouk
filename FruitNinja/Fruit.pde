public class Fruit {
  PVector position, velocity, acceleration;
  float radius;
  float rotationSpeed;
  int rotationDirection;
  color c;
  String type;
  float rotationAngle;
  float g = -0.05;
  PImage img;
   
  public Fruit(float xCoor, float yCoor, float xSpeed, float ySpeed, float rotationSpeed, int rotationDirection, float radius) {
    position = new PVector(xCoor, yCoor);
    velocity = new PVector(xSpeed, ySpeed);
    acceleration = new PVector(0,g);
    this.radius = radius;
    c = color(random(255), random(255), random(255));
    type = "circle";
    rotationAngle = 0;
    this.rotationDirection = rotationDirection;
    this.rotationSpeed = rotationSpeed;
  }
  
  public Fruit(float xCoor, float yCoor, float xSpeed, float ySpeed, float rotationSpeed, int rotationDirection, PImage img) {
    position = new PVector(xCoor, yCoor);
    velocity = new PVector(xSpeed, ySpeed);
    acceleration = new PVector(0,g);
    type = "image";
    rotationAngle = 0;
    this.rotationDirection = rotationDirection;
    this.rotationSpeed = rotationSpeed;
    this.img = img;
    if (img.width >= img.height) {
      radius = img.width;
    }
    else {
      radius = img.height;
    }
  }

  void move() {
    //apply acceleration to velocity
    //apply velocity to position
    velocity.sub(acceleration);
    position.add(velocity);
    acceleration.set(0,g);

    //bounce
    bounce();
  }

  void display() {
    if (type.equals("circle")) {
      update();
      pushMatrix();
      translate(position.x, position.y);    
      rotate(rotationAngle * rotationDirection);
      fill(c);
      ellipse(0,0,radius,radius/2);
      noFill();
      popMatrix();
    }
    if (type.equals("image")) {
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
  
  Fruit copyOf() {
    if (type.equals("circle")) {
      return new Fruit(position.x,position.y,velocity.x,velocity.y,rotationSpeed,rotationDirection,radius);
    }
    if (type.equals("image")) {
      return new Fruit(position.x,position.y,velocity.x,velocity.y,rotationSpeed,rotationDirection,img);
    }
    return null;
  }
  
  float getY() {
    return position.y;
  }

  void bounce() {
    //bounce if hit left or right walls
    if (position.x < radius)
      velocity.x = abs(velocity.x);
    if (position.x > width-radius)
      velocity.x=-1*abs(velocity.x);
  }
  
  // update the cube
  // all we're doing is rotating each axis
  void update() {
    rotationAngle += rotationSpeed;
  }
}
