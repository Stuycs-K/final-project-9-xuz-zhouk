public class Fruit {
  PVector position, velocity, acceleration;
  float radius;
  float mass;
  double rotationSpeed;
  int rotationDirection;
  color c;
  String type;
   
  public Fruit(float xCoor, float yCoor, float xSpeed, float ySpeed, double rotationSpeed, int rotationDirection, float radius, float mass) {
    position = new PVector(xCoor, yCoor);
    velocity = new PVector(xSpeed, ySpeed);
    acceleration = new PVector(0,0.3);
    this.mass = mass;
    this.radius = radius;
    c = color(random(255), random(255), random(255));
    type = "circle";
  }

  void move() {
    //apply acceleration to velocity
    //apply velocity to position
    velocity.add(acceleration);
    position.add(velocity);

    //bounce
    bounce();
    
    //spin
    spin();
  }

  void display() {
    if (type.equals("circle")) {
      fill(c);
      ellipse(position.x,position.y,radius,radius/2);
      noFill();
    }
  }
  
  Fruit copyOf() {
    return new Fruit(position.x,position.y,velocity.x,velocity.y,rotationSpeed,rotationDirection,radius,mass);
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
  
  void spin() {
    
  }
}
