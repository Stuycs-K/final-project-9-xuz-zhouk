Button startButton,pauseButton;
PImage backgroundImg;
void draw() {
 
}

void setup() {
  size(960,720);
  backgroundImg = loadImage("menuBackground.png");
  background(backgroundImg);
 
  //BUTTONS
  PImage buttonImg = loadImage("pauseButton.png");
  pauseButton = new Button(900,45,buttonImg,color(0,0,0),"PAUSE",1);
  pauseButton.resize(100);
  
  buttonImg = loadImage("playButton.png");
  startButton = new Button(width/2,height/2,buttonImg,color(0,0,0),"START",1);
  startButton.resize(200);
 
  startMenu();
}

void startMenu() {
  background(backgroundImg);
  startButton.display();
}

void gameMenu() {
  background(backgroundImg);
  pauseButton.display();
}

void pauseMenu() {
  gameMenu();
}

 void mousePressed() {
   if (startButton.update(mouseX,mouseY)) {
     if (startButton.getText().equals("START")) {
       System.out.println("start button pressed!");
       startButton.hide();
       gameMenu();
     }
   }
   if (pauseButton.update(mouseX,mouseY)) {
     if (pauseButton.getText().equals("PAUSE")) {
       System.out.println("pause button pressed!");
       pauseButton.hide();
       startMenu();
     }
   }
 }

 
