public class Fruit {
  PVector position, velocity, acceleration;
  float radius;
  float mass;
  float rotationSpeed;
  int rotationDirection;
  color c;
  String type;
  float rotationAngle;
   
  public Fruit(float xCoor, float yCoor, float xSpeed, float ySpeed, float rotationSpeed, int rotationDirection, float radius, float mass) {
    position = new PVector(xCoor, yCoor);
    velocity = new PVector(xSpeed, ySpeed);
    acceleration = new PVector(0,3);
    this.mass = mass;
    this.radius = radius;
    c = color(random(255), random(255), random(255));
    type = "circle";
    rotationAngle = 0;
    this.rotationDirection = rotationDirection;
    this.rotationSpeed = rotationSpeed;
  }

  void move() {
    bounce();
    //apply acceleration to velocity
    //apply velocity to position
    velocity.sub(acceleration);
    position.add(velocity);
    acceleration.set(0,0);

    //bounce
    bounce();
  }

  void display() {
    if (type.equals("circle")) {
      update();
      pushMatrix();
      translate(position.x,position.y);
      pushMatrix();
      translate(position.x, position.y);
      rotate(rotationAngle * rotationDirection);
      fill(c);
      ellipse(position.x,position.y,radius,radius/2);
      noFill();
      popMatrix();
      popMatrix();
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
    if (position.y < radius)
      velocity.y = abs(velocity.y);
    if (position.y > height-radius)
      velocity.y=-1*abs(velocity.y);
  }
  
  /**
   *Calculate the force between this orb and the other orb.
   *Return a PVector with the correct magnitude and direction
   */
  PVector attractTo(Fruit other) {
    //calculate the distance from this fruit to other fruit
    float distance = this.position.dist(other.position);
    
    //calculate the magnitude of the force g using the formula g = G*M1*M2/dist^2
    double mag = (20 * this.mass * other.mass) / (distance * distance);
    
    //calculate the direction of the force
    PVector force = PVector.sub(other.position, this.position);

    //normalize the force
    force.normalize();
    //now you have a unit vector, and a magnitude.
    //Make your force vector have the correct magnitude before returning it.
    force.setMag((float) mag);

    //DO NOT CHANGE THIS
    return force;
  }

  /*Apply a force to the current fruit by changing the acceleration.*/
  void applyForce(PVector f) {
    //knowing that f = ma, you can rearrange the formula to see how you want to manipulate acceleration:
    //a = f / m

    //add  force/mass to the acceleration to apply the force.
    f.setMag(f.mag()/mass);
    acceleration.sub(f);
  }
  
  // update the cube
  // all we're doing is rotating each axis
  void update() {
    rotationAngle += rotationSpeed;
  }
}
