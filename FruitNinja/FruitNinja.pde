<<<<<<< HEAD
Button startButton;
void draw() {
  if (startButton.isClicked()) {
    startButtonPressed();
  } 
}
=======
int numLives, score;
>>>>>>> b81e200ff325422e45fc2d92fb59e48c91dbe637

void setup() {
  size(600,600);
  background(150,75,0);
  startMenu();
  numLives = 3;
  score = 0;
}

void startMenu() {
  color b1 = color(0,0,0);
  color b2 = color(255,255,255);
<<<<<<< HEAD
  startButton = new Button(width/2,height/2,50,50,b1,b2,"START");
  startButton.display();
}

void startButtonPressed() {
  background(0,0,0);
=======
  
  
>>>>>>> b81e200ff325422e45fc2d92fb59e48c91dbe637
}

void draw() {
  displayLives();
  displayScore();
}

void displayLives() {
  textSize(15);
  text("Lives: " + numLives, 10, 30);
}

void displayScore() {
  textSize(30);
  text(""+score, width/2, 50);
}
