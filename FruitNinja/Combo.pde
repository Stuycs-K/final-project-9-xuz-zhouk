public class Combo {
  int xCoor, yCoor;
  String msg;
  int mult;
  color msgColor;
  PFont font;
  int displayCounter;
  String comboType;
  int textSize;
  
  //combo constructor
  public Combo (int mult) {
    this.mult = mult;
    font = createFont("go3v2.ttf", 64);
    xCoor = width/2 + 25;
    yCoor = 150;
    msg = "x" + mult + " MULTIPLIER!";
    if (mult == 2) {
      msgColor = color(176,141,87);
    }
    if (mult == 3) {
      msgColor = color(192,192,192); 
    }
    if (mult == 5) {
      msgColor = color(207,181,59);
    }
    displayCounter = 0;
    comboType = "combo";
    textSize = 64;
  }
  
  public Combo (int xCoor, int yCoor, String msg, color msgColor) {
    mult = 0;
    font = createFont("go3v2.ttf", 64);
    this.xCoor = xCoor;
    this.yCoor = yCoor;
    this.msg = msg;
    this.msgColor = msgColor;
    displayCounter = 0;
    comboType = "message";
    textSize = 100;
  }
  
  //displays the combo count
  void display() {
    textFont(font);
    textSize(textSize);
    fill(msgColor);
    text(msg, xCoor, yCoor);
    noFill();
    displayCounter++;
  }
  
  int getDisplay() {
    return displayCounter;
  }
}
