Button startButton,pauseButton;
PImage backgroundImg;
void draw() {
  
}

void setup() { 
  size(960,720);
  backgroundImg = loadImage("menuBackground.png");
  background(backgroundImg);
  startMenu();
}

void startMenu() {
  color b1 = color(0,0,0);
  color b2 = color(255,255,255);
  startButton = new Button(width/2,height/2,200,100,b1,b2,"START",73);
  startButton.display();
}

void gameMenu() {
  background(backgroundImg);
  color b1 = color(0,0,0);
  color b2 = color(255,255,255);
  pauseButton = new Button(900,45,100,50,b1,b2,"PAUSE",35);
  pauseButton.display();
}

void pauseMenu() {
  
}

 void mousePressed() {
   if (startButton.update(mouseX,mouseY)) {
     if (startButton.getText().equals("START")) {
       System.out.println("start button pressed!");
       gameMenu();
     }
   }
   if (pauseButton.update(mouseX,mouseY)) {
     if (pauseButton.getText().equals("PAUSE")) {
       System.out.println("pause button pressed!");
       pauseMenu();
     }
   }
 }
  
