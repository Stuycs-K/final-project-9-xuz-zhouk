import java.util.*;
Button startButton, pauseButton, backButton;
PImage backgroundImg;
boolean paused;
ArrayList<Fruit> fruitBox;
ArrayList<String> fruitTypes;
ArrayList<ArrayList<String>> slicedFruitTypes;
int countdown;
ArrayList<Life> lifeBox;
Combo currentCombo = null;
int comboCounter = 0;
int lifeBoxIndex = 0;
int score;
int scoreIncrease = 0;
int scoreCounter = 0;
PFont font;
int boundary;

void draw() {
  //the game only runs when its not in a paused state
  if (!paused) {
    gameMenu();
    displayScore();
    if (scoreIncrease > 0) {
      scoreCounter++;
    }
    if (scoreCounter >= 20) {
      scoreIncrease = 0;
      scoreCounter = 0;
    }
    //move and display all fruits, light up "misses" when fruit is dropped
    for (int i = 0; i < fruitBox.size(); i++) {
      fruitBox.get(i).move();
      //THIS CODE AUTO DELETES FRUIT BELOW A CERTAIN THRESHOLD
      if (fruitBox.get(i).getY() >= height + 100) {
        Fruit f = fruitBox.remove(i);
        
        //fills in a life box when the fruit is not a bomb and its not sliced
        if (!(f.isBomb() || f.sliced())) {
          if (lifeBoxIndex < lifeBox.size()) {
            lifeBox.get(lifeBoxIndex).setLife(true);
            lifeBoxIndex++;
          }
        }
      } else {
        fruitBox.get(i).display();
      }
    }
    //display the live boxes
    for (int i = 0; i < lifeBox.size(); i++) {
      lifeBox.get(i).display();
    }
    //displays current combo, if applicable
    if (currentCombo != null) {
      currentCombo.display();
      if (currentCombo.getDisplay() >= 25) {
        currentCombo = null;
      }
    }
    if (frameCount % 50 == 0) {
      comboCounter = 0;
    }
  }
  //timer feature utitlized in spawnItem
  if (countdown > 0) {
    countdown--;
  }
  spawnItem();
  //ends game when user runs out of lives
  int numLives = 3;
  for (Life life : lifeBox) {
    if (life.filled()) {
      numLives--;
    }
  }
  if (numLives == 0) {
    endMenu();
  }
  setDifficulty();
}

void setup() {
  //initialize screen, score, font, countdown
  size(960, 720);
  frameRate(60);
  countdown = 0;
  backgroundImg = loadImage("menuBackground.png");
  background(backgroundImg);
  score = 0;
  font = createFont("go3v2.ttf", 128);
  boundary = 60;

  //fruitBox initialize
  fruitBox = new ArrayList<Fruit>();

  //fruitTypes initialize
  fruitTypes = new ArrayList<String>();
  fruitTypes.add("bomb.png");
  fruitTypes.add("watermelon.png");
  fruitTypes.add("banana.png");
  fruitTypes.add("pear.png");
  fruitTypes.add("pomegranate.png");
  fruitTypes.add("orange.png");
  fruitTypes.add("pineapple.png");
  fruitTypes.add("coconut.png");

  //slicedFruitTypes initialize
  slicedFruitTypes = new ArrayList<ArrayList<String>>();
  slicedFruitTypes.add(new ArrayList<String>(List.of("watermelonTop.png", "watermelonBottom.png")));
  slicedFruitTypes.add(new ArrayList<String>(List.of("bananaTop.png", "bananaBottom.png")));
  slicedFruitTypes.add(new ArrayList<String>(List.of("pearTop.png", "pearBottom.png")));
  slicedFruitTypes.add(new ArrayList<String>(List.of("pomegranateTop.png", "pomegranateBottom.png")));
  slicedFruitTypes.add(new ArrayList<String>(List.of("orangeTop.png", "orangeBottom.png")));
  slicedFruitTypes.add(new ArrayList<String>(List.of("pineappleTop.png", "pineappleBottom.png")));
  slicedFruitTypes.add(new ArrayList<String>(List.of("coconutTop.png", "coconutBottom.png")));


  //lifeBox initialize
  lifeBox = new ArrayList<Life>();
  Life l1 = new Life(710, 50);
  Life l2 = new Life(810, 50);
  Life l3 = new Life(910, 50);
  lifeBox.add(l1);
  lifeBox.add(l2);
  lifeBox.add(l3);

  //BUTTONS
  PImage buttonImg = loadImage("pauseButton.png");
  pauseButton = new Button(60, 675, buttonImg, color(0, 0, 0), "PAUSE", 1);
  pauseButton.resize(100);

  buttonImg = loadImage("playButton.png");
  startButton = new Button(width/2, height/2, buttonImg, color(0, 0, 0), "START", 1);
  startButton.resize(200);

  buttonImg = loadImage("backButton.png");
  backButton = new Button(width/2, height/2+200, buttonImg, color(0, 0, 0), "BACK", 1);
  backButton.resize(100);
  
  //opens start menu
  startMenu();
}

void spawnItem() {
  //continuously spawns fruits when game is not paused, with progressive difficulty
  if (countdown == 0 && !paused) {
    countdown+=boundary;
    int randomWidth;
    int randomMagnitude;
    int randomDirection;
    randomWidth = (int)(Math.random() * (width-0+1) + 0);
    randomMagnitude = (int)(Math.random() * (8-5+1) + 1);
    randomDirection = (int)Math.floor(Math.random() * (1 - 0 + 1) + 0);
    if (randomDirection == 0) {
      randomDirection = -1;
    }
    int rand = (int)Math.floor(Math.random() * (fruitTypes.size() - 1 - 0 + 1) + 0);
    String whichFruit = fruitTypes.get(rand);
    PImage fruitSprite = loadImage(whichFruit);
    Fruit testFruit = new Fruit(randomWidth, height, randomMagnitude * randomDirection, -7, 0.05, randomDirection, fruitSprite);
    if (rand == 0) {
      testFruit.makeBomb();
    }
    testFruit.setIndex(rand);
    fruitBox.add(testFruit);
  }
}

void setDifficulty() {
  //every 5 seconds, the spwan speed of fruits slightly increase
  if (frameCount % 300 == 0) {
    boundary -= 5;
  }
  if (boundary < 20) {
    boundary = 20;
  }
}

void startMenu() {
  //start menu interface
  background(backgroundImg);
  startButton.display();
  paused = true;
}

void gameMenu() {
  //game screen
  background(backgroundImg);
  pauseButton.display();
  paused = false;
}

void pauseMenu() {
  //goes back to start menu when paused
  gameMenu();
  paused = true;
}

void endMenu() {
  //end game screen
  background(backgroundImg);
  paused = true;
  textFont(font);
  fill(255, 0, 0);
  text("GAME OVER", 150, 100);
  noFill();
  fill(255, 165, 0);
  text("Final Score: ", 120, 200);
  text(""+score, width/2-25, 300);
  noFill();
  backButton.display();
}

//temporary implementation of spawnItem for testing
/*
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
    int rand = (int)Math.floor(Math.random() * (fruitTypes.size() - 1 - 0 + 1) + 0);
    String whichFruit = fruitTypes.get(rand);
    PImage fruitSprite = loadImage(whichFruit);
    Fruit testFruit = new Fruit(randomWidth, height, randomMagnitude * randomDirection, -7, 0.05, randomDirection, fruitSprite);
    if (rand == 0) {
      testFruit.makeBomb();
    }
    fruitBox.add(testFruit);
  }
}
*/

void mousePressed() {
  //performs a specific action depends on which button is pressed
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
  if (backButton.update(mouseX, mouseY)) {
    if (backButton.getText().equals("BACK")) {
      System.out.println("back button pressed!");
      backButton.hide();
      score = 0;
      fruitBox.clear();
      for (Life life : lifeBox) {
        life.setLife(false);
      }
      lifeBoxIndex = 0;
      boundary = 60;
      startMenu();
    }
  }
}

void mouseDragged() {
  for (int i = 0; i < fruitBox.size(); i++) {
    Fruit curr = fruitBox.get(i);
    //Slicing detection
    if (dist(curr.getX(), curr.getY(), mouseX, mouseY) < curr.getRadius()
      && dist(mouseX, mouseY, pmouseX, pmouseY) > curr.getRadius()/48
      ) {
      if (curr.isBomb()) { 
        System.out.println("Oh no!");
        endMenu();  //ends game when bomb is sliced
      } else {
        if (!(curr.sliced())) {
          float xCoor = curr.getX();
          float yCoor = curr.getY();
          int direction = curr.getDirection();
          int index = curr.getIndex();
          fruitBox.remove(curr);
          String fruitTop = slicedFruitTypes.get(index-1).get(0);
          String fruitBottom = slicedFruitTypes.get(index-1).get(1);
          
          //slicing fruit produces two new images of sliced fruit: top and bottom
          PImage topSprite = loadImage(fruitTop);
          PImage bottomSprite = loadImage(fruitBottom);
          Fruit fruit1 = new Fruit(xCoor, yCoor, 5, 0, 0.05, direction, topSprite);
          Fruit fruit2 = new Fruit(xCoor, yCoor, -5, 0, 0.05, -direction, bottomSprite);
          fruit1.setSliced();
          fruit2.setSliced();
          fruitBox.add(fruit1);
          fruitBox.add(fruit2);
          
          //increases combo 
          comboCounter++;
          if (comboCounter >=10) {
            currentCombo = new Combo(5);
            score = score + 10 * comboCounter;
            scoreIncrease = 10 * comboCounter;
          } else {
            if (comboCounter >=5) {
              currentCombo = new Combo(3);
              score = score + 3 * comboCounter;
              scoreIncrease = 3 * comboCounter;
            } else {
              if (comboCounter == 3 || comboCounter == 4) {
                currentCombo = new Combo(2);
                score = score + 2 * comboCounter;
                scoreIncrease = 2 * comboCounter;
              } else {
                score++;
                scoreIncrease = 1;
              }
            }
          }
        }
      }
    }
  }
}

void displayScore() {
  //displays the current score
  textFont(font);
  fill(255, 165, 0);
  if (scoreIncrease != 0) {
    text(""+score + " +" + scoreIncrease, 50, 100);
  } else {
    text(""+score, 50, 100);
  }
  noFill();
}
