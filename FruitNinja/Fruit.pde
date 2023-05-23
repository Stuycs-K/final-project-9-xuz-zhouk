public class Fruit {
  PVector position, velocity, acceleration;
  float radius;
  float mass;
  int rotationSpeed, rotationDirection;
  color c;
   
  public Fruit(float xCoor, float yCoor, float xSpeed, float ySpeed, int rotationSpeed, int rotationDirection, float radius, float mass) {
    position = new PVector(xCoor, yCoor);
    velocity = new PVector(xSpeed, ySpeed);
    acceleration = new PVector(0, -3);
    this.mass = mass;
    this.radius = radius;
    c = color(random(255), random(255), random(255));
    this.rotationSpeed = rotationSpeed;
    this.rotationDirection = rotationDirection;
  }

  void move() {
    //apply acceleration to velocity
    //apply velocity to position
    velocity.sub(acceleration);
    position.add(velocity);

    //bounce
    bounce();
    
    //rotate
    for (int i = 0; i < rotationSpeed; i++) {
      translate(position.x,position.y);
      rotate(rotationDirection * PI/3.0);
    }
  }

  void display() {
    fill(c);
    noStroke();
    rect(position.x, position.y, radius, radius);
  }

  public void bounce() {
    //bounce if the fruit hits left or right walls
    if (position.x < radius)
      velocity.x = abs(velocity.x);
    if (position.x > width-radius)
      velocity.x=-1*abs(velocity.x);
    if (position.y < radius)
      velocity.y = abs(velocity.y);
    if (position.y > height-radius)
      velocity.y=-1*abs(velocity.y);
  }
}
