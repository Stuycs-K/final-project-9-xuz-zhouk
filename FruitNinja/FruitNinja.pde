Button startButton, pauseButton;
PImage backgroundImg;
boolean paused;
ArrayList<Fruit> fruitBox;
void draw() {
  if (!paused) {
    for (int i = 0; i < fruitBox.size(); i++) {
      fruitBox.get(i).move();
      gameMenu();
      fruitBox.get(i).display();
    }
  }
}

void setup() {
  size(960, 720);
  backgroundImg = loadImage("menuBackground.png");
  background(backgroundImg);

  //fruitBox intialize
  fruitBox = new ArrayList<Fruit>();

  //BUTTONS
  PImage buttonImg = loadImage("pauseButton.png");
  pauseButton = new Button(900, 45, buttonImg, color(0, 0, 0), "PAUSE", 1);
  pauseButton.resize(100);

  buttonImg = loadImage("playButton.png");
  startButton = new Button(width/2, height/2, buttonImg, color(0, 0, 0), "START", 1);
  startButton.resize(200);

  startMenu();
}

void startMenu() {
  background(backgroundImg);
  startButton.display();
  paused = true;
}

void gameMenu() {
  background(backgroundImg);
  pauseButton.display();
  paused = false;
  for (int i = 0; i < fruitBox.size(); i++) {
     fruitBox.get(i).display();
  }
}

void pauseMenu() {
  gameMenu();
  paused = true;
}

void mousePressed() {
  if (startButton.update(mouseX, mouseY)) {
    if (startButton.getText().equals("START")) {
      System.out.println("start button pressed!");
      startButton.hide();
      gameMenu();
    }
  }
  if (pauseButton.update(mouseX, mouseY)) {
    if (pauseButton.getText().equals("PAUSE")) {
      System.out.println("pause button pressed!");
      pauseButton.hide();
      startMenu();
    }
  }
}

void keyPressed() {
  if (!paused) {
    Fruit testFruit = new Fruit(width, height, -5, -20, 5, 0, 100, 10);
    fruitBox.add(testFruit.copyOf());
  }
}
