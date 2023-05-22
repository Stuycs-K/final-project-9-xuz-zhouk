void setup() {
  size(800,800);
  background(150,75,0);
  startMenu();
}

void startMenu() {
  color b1 = color(0,0,0);
  color b2 = color(255,255,255);
  Button start = new Button(50,50,b1,b2,"START");
  start.display(400,400);
  
}
