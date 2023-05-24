public class Fruit {
  PVector position, velocity, acceleration;
  float radius;
  float mass;
  double rotationSpeed;
  int rotationDirection;
  color c;
   
  public Fruit(float xCoor, float yCoor, float xSpeed, float ySpeed, double rotationSpeed, int rotationDirection, float radius, float mass) {
    position = new PVector(xCoor, yCoor);
    velocity = new PVector(xSpeed, ySpeed);
    acceleration = new PVector(0, -9.8);
    this.mass = mass;
    this.radius = radius;
    c = color(random(255), random(255), random(255));
  }

  void move() {
    //apply acceleration to velocity
    //apply velocity to position
    velocity.add(acceleration);
    position.add(velocity);

    //bounce
    bounce();
  }

  void display() {
    
  }

  public void bounce() {
    //bounce if hit left or right walls
    if (position.x < radius)
      velocity.x = abs(velocity.x);
    if (position.x > width-radius)
      velocity.x=-1*abs(velocity.x);
  }
}
