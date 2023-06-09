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
Combo powerUp = null;
int comboCounter = 0;
int lifeBoxIndex = 0;
int score;
int scoreIncrease = 0;
int scoreCounter = 0;
PFont font;
int boundary;
ArrayList<Stain> stainBox;
int highScore;
int retries;
int mode;
int timer;
final int ARCADE = 0;
final int ZEN = 1;

/*
  background(backgroundImg);
 int randomDirection = (int)Math.floor(Math.random() * (1 - 0 + 1) + 0);
 PImage fruitSprite = loadImage("watermelon.png");
 Fruit testFruit = new Fruit(width/2-50, height/2, 0.05, randomDirection, fruitSprite);
 testFruit.display();
 */

void draw() {
  //the game only runs when its not in a paused state
  if (mode == ARCADE) {
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
      //display the stain box
      for (int i = 0; i < stainBox.size(); i++) {
        if (stainBox.get(i).getDuration() <= 0) {
          stainBox.remove(i);
          i--;
        } else {
          stainBox.get(i).display();
        }
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
      if (retries > 0) {
        textSize(32);
        fill(255, 165, 0);
        text("Retries: " + retries, width-200, height-100);
        noFill();
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
  } else if (mode == ZEN) {
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
      //display the stain box
      for (int i = 0; i < stainBox.size(); i++) {
        if (stainBox.get(i).getDuration() <= 0) {
          stainBox.remove(i);
          i--;
        } else {
          stainBox.get(i).display();
        }
      }
      //move and display all fruits, light up "misses" when fruit is dropped
      for (int i = 0; i < fruitBox.size(); i++) {
        fruitBox.get(i).move();
        //THIS CODE AUTO DELETES FRUIT BELOW A CERTAIN THRESHOLD
        if (fruitBox.get(i).getY() >= height + 100) {
          fruitBox.remove(i);
        } else {
          fruitBox.get(i).display();
        }
      }
      //displays current combo, if applicable
      if (currentCombo != null) {
        currentCombo.display();
        if (currentCombo.getDisplay() >= 25) {
          currentCombo = null;
        }
      }
      //displays power up message
      if (powerUp != null) {
        powerUp.display();
        if (powerUp.getDisplay() >= 100) {
          powerUp = null;
        }
      }

      if (frameCount % 50 == 0) {
        comboCounter = 0;
      }
      if (retries > 0) {
        textSize(32);
        fill(255, 165, 0);
        text("Retries: " + retries, width-200, height-100);
        noFill();
      }
      //timer feature utitlized in spawnItem
      if (countdown > 0) {
        countdown--;
      }
      spawnItem();
      //ends game when user runs out of lives
      /*
    int numLives = 3;
       for (Life life : lifeBox) {
       if (life.filled()) {
       numLives--;
       }
       }
       if (numLives == 0) {
       endMenu();
       }
       */
      if (timer == 0) {
        endMenu();
      }
      if (!paused) {
        textSize(128);
        fill(255);
        text(""+timer, width/2, 100);
        noFill();
        if (frameCount%60 == 0) {
          timer--;
        }
      }
      setDifficulty();
    }
  } else {
    background(backgroundImg);
    fill(255, 165, 0);
    textFont(font);
    textSize(32);
    text("ARCADE", width/2-200, height/2-100);
    text("ZEN", width/2+115, height/2-100);
    textSize(48);
    text("Choose your desired mode below:", 100, height/2-200);
    noFill();
    for (Fruit fruit : fruitBox) {
      fruit.display();
    }
  }
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
  highScore = 0;
  retries = 0;
  paused = true;
  mode = 2;
  timer = 60;

  //fruitBox initialize
  fruitBox = new ArrayList<Fruit>();

  PImage fruitSprite = loadImage("watermelon.png");
  PImage fruitSprite2 = loadImage("pomegranate.png");
  Fruit testFruit = new Fruit(width/2-150, height/2, 0.05, 1, fruitSprite, 0);
  Fruit testFruit2 = new Fruit(width/2+150, height/2, 0.05, 1, fruitSprite2, 1);
  fruitBox.add(testFruit);
  fruitBox.add(testFruit2);

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

  //stainBox initialize
  stainBox = new ArrayList<Stain>();

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
}

void spawnItem() {
  //continuously spawns fruits when game is not paused, with progressive difficulty
  if (mode == ARCADE && countdown == 0 && !paused) {
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
  } else if (mode == ZEN && countdown == 0 && !paused) {
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
    int rand = (int) (Math.random() * (fruitTypes.size() - 1)) + 1;
    String whichFruit = fruitTypes.get(rand);
    PImage fruitSprite = loadImage(whichFruit);
    Fruit testFruit = new Fruit(randomWidth, height, randomMagnitude * randomDirection, -7, 0.05, randomDirection, fruitSprite);
    testFruit.setIndex(rand);
    fruitBox.add(testFruit);

    double random = Math.random();
    if (random < 0.05) {
      PImage frenzyPic = loadImage("frenzy.png");
      Power frenzy = new Power(randomWidth, height, randomMagnitude * randomDirection, -7, 0.05, 1, frenzyPic, "frenzy");
      fruitBox.add(frenzy);
    } else if (random < 0.025) {
      PImage bonusPic = loadImage("bonus.png");
      Power bonus = new Power(randomWidth, height, randomMagnitude * randomDirection, -7, 0.05, 1, bonusPic, "bonus");
      fruitBox.add(bonus);
    }
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
  textSize(128);
  fill(255, 0, 0);
  text("GAME OVER", 150, 100);
  noFill();
  fill(255, 165, 0);
  text("Final Score: ", 120, 200);
  text(""+score, width/2-25, 300);
  noFill();
  stainBox = new ArrayList<Stain>();
  currentCombo = null;
  if (score > highScore) {
    highScore = score;
  }
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

//stain testing
/*
void keyPressed() {
 stainBox.add(new Stain(width/2,height/2,1));
 }
 */

//powerUp testing
void keyPressed() {
  if (mode == ZEN) {
    //frenzy powerup

    PImage frenzyPic = loadImage("frenzy.png");
    Power frenzy = new Power(width/2, height/2, 0, 0, 0.05, 1, frenzyPic, "frenzy");
    fruitBox.add(frenzy);

    //bonus powerup
    /*
    PImage bonusPic = loadImage("bonus.png");
     Power bonus = new Power(width/2, height/2, 0, 0, 0.05, 1, bonusPic, "bonus");
     fruitBox.add(bonus);
     */
  }
}

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
      retries++;
      timer = 60;
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
        background(backgroundImg);
        endMenu();  //ends game when bomb is sliced
      } else {
        if (mode == 2) {
          mode = curr.getMode();
          curr.setSliced();
          fruitBox.clear();
          System.out.println(mode);
          paused = false;
          break;
        } else {
          if (!(curr.sliced())) {
            float xCoor = curr.getX();
            float yCoor = curr.getY();
            int direction = curr.getDirection();
            int index = curr.getIndex();
            fruitBox.remove(curr);
            String fruitTop = "";
            String fruitBottom = "";
            String identity = curr.whatAmI();
            if (identity.equals("power")) {
              if (curr.getType().equals("frenzy")) {
                fruitTop = "frenzyTop.png";
                fruitBottom = "frenzyBottom.png";
              }
              if (curr.getType().equals("bonus")) {
                fruitTop = "bonusTop.png";
                fruitBottom = "bonusBottom.png";
              }
              usePowerUp(curr.getType());
            } else {
              fruitTop = slicedFruitTypes.get(index-1).get(0);
              fruitBottom = slicedFruitTypes.get(index-1).get(1);
            }

            //slicing fruit produces two new images of sliced fruit: top and bottom
            PImage topSprite = loadImage(fruitTop);
            PImage bottomSprite = loadImage(fruitBottom);
            Fruit fruit1 = new Fruit(xCoor, yCoor, 5, 0, 0.05, direction, topSprite);
            Fruit fruit2 = new Fruit(xCoor, yCoor, -5, 0, 0.05, -direction, bottomSprite);
            fruit1.setSliced();
            fruit2.setSliced();
            fruitBox.add(fruit1);
            fruitBox.add(fruit2);
            if (curr.whatAmI().equals("fruit")) {
              stainBox.add(new Stain(xCoor, yCoor, index));
            }

            //increases combo
            if (identity.equals("fruit")) {
              comboCounter++;
            }
            if (comboCounter >=10) {
              currentCombo = new Combo(5);
              scoreIncrease = 5 * comboCounter;
            } else {
              if (comboCounter >=5) {
                currentCombo = new Combo(3);
                scoreIncrease = 3 * comboCounter;
              } else {
                if (comboCounter == 3 || comboCounter == 4) {
                  currentCombo = new Combo(2);
                  scoreIncrease = 2 * comboCounter;
                } else {
                  scoreIncrease = 1;
                }
              }
            }
            score = score + scoreIncrease;
          }
        }
      }
    }
    //slicing cursor effect
    if (!paused || mode == 2) {
      stroke(255);
      strokeWeight(10);
      line(pmouseX, pmouseY, mouseX, mouseY);
      noStroke();
    }
  }
}

void displayScore() {
  //displays the current score
  textFont(font);
  textSize(128);
  fill(255, 165, 0);
  if (scoreIncrease != 0) {
    text(""+score + " +" + scoreIncrease, 50, 100);
  } else {
    text(""+score, 50, 100);
  }
  noFill();
  if (retries > 0) {
    fill(255, 165, 0);
    textSize(64);
    text("BEST: " + highScore, 50, 175);
    noFill();
  }
}

void usePowerUp (String identity) {
  if (identity.equals("frenzy")) {
    Combo msg = new Combo(width/2 - 450, 200, "FRENZY!", color(252, 53, 53));
    powerUp = msg;
    for (int i = 0; i < 10; i++) {
      int randomWidth;
      int randomMagnitude;
      int randomDirection;
      randomWidth = (int)(Math.random() * (width-0+1) + 0);
      randomMagnitude = (int)(Math.random() * (8-5+1) + 1);
      randomDirection = (int)Math.floor(Math.random() * (1 - 0 + 1) + 0);
      if (randomDirection == 0) {
        randomDirection = -1;
      }
      int rand = (int) (Math.random() * (fruitTypes.size() - 1)) + 1;
      String whichFruit = fruitTypes.get(rand);
      PImage fruitSprite = loadImage(whichFruit);
      Fruit testFruit = new Fruit(randomWidth, height, randomMagnitude * randomDirection, -7, 0.05, randomDirection, fruitSprite);
      testFruit.setIndex(rand);
      fruitBox.add(testFruit);
    }
  }
  if (identity.equals("bonus")) {
    Combo msg = new Combo(width/2 - 450, 200, "DOUBLED SCORE!", color(50, 217, 250));
    powerUp = msg;
    score = score * 2;
  }
}
