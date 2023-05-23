Button startButton;
void draw() {
  if (startButton.isClicked()) {
    startButtonPressed();
  } 
}

void setup() {
  size(800,800);
  background(150,75,0);
  startMenu();
}

void startMenu() {
  color b1 = color(0,0,0);
  color b2 = color(255,255,255);
  startButton = new Button(400,400,50,50,b1,b2,"START");
  startButton.display();
}

void startButtonPressed() {
  background(0,0,0);
}
