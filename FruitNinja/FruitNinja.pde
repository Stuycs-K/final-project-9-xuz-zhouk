Button startButton, pauseButton;
PImage backgroundImg;
boolean paused;
Fruit earth;
ArrayList<Fruit> fruitBox;
ArrayList<String> fruitTypes;
void draw() {
  if (!paused) {
    gameMenu();
    for (int i = 0; i < fruitBox.size(); i++) {
      fruitBox.get(i).move();
      //THIS CODE AUTO DELETES FRUIT BELOW A CERTAIN THRESHOLD
      if (fruitBox.get(i).getY() >= height + 300) {
        fruitBox.remove(i);
      }
      else{
        fruitBox.get(i).display();
      }      
    }
  }
}

void setup() {
  size(960, 720);
  backgroundImg = loadImage("menuBackground.png");
  background(backgroundImg);

  //fruitBox initialize
  fruitBox = new ArrayList<Fruit>();
  
  //fruitTypes initialize;
  fruitTypes = new ArrayList<String>();
  fruitTypes.add("watermelon.png");
  fruitTypes.add("banana.png");
  fruitTypes.add("pear.png");
  fruitTypes.add("pomegranate.png");
  fruitTypes.add("orange.png");
  fruitTypes.add("pineapple.png");
  fruitTypes.add("coconut.png");
  
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
    int randomWidth;
    int randomMagnitude;
    int randomDirection;
    randomWidth = (int)(Math.random() * (width-0+1) + 0);
    randomMagnitude = (int)(Math.random() * (8-5+1) + 1);
    randomDirection = (int)Math.floor(Math.random() * (1 - 0 + 1) + 0);
    if (randomDirection == 0) {
      randomDirection = -1;
    }
    //Fruit testFruit = new Fruit(randomWidth, height, randomMagnitude * randomDirection, -7, 0.05, randomDirection, 100);
    String whichFruit = fruitTypes.get((int)Math.floor(Math.random() * (fruitTypes.size() - 1 - 0 + 1) + 0));
    PImage fruitSprite = loadImage(whichFruit);
    Fruit testFruit = new Fruit(randomWidth, height, randomMagnitude * randomDirection, -7, 0.05, randomDirection, fruitSprite);
    fruitBox.add(testFruit.copyOf());
  }
}

void mouseDragged() {
  for (int i = 0; i < fruitBox.size(); i++) {
    Fruit curr = fruitBox.get(i);
    if (dist(curr.getX(), curr.getY(), mouseX, mouseY) < curr.getRadius()) {
      System.out.println("Cut!" + curr.getX());
    }
  }
}
