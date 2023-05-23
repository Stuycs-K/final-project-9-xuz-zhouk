public class Button {
  int bwidth,bheight;
  int xcoord,ycoord;
  color buttonColor,messageColor;
  String message;
  int textSize;
  
  public Button (int xcoord, int ycoord, int bwidth, int bheight, color buttonColor, color messageColor, String txt, int textSize) {
    this.xcoord = xcoord;
    this.ycoord = ycoord;
    this.bwidth = bwidth;
    this.bheight = bheight;
    this.buttonColor = buttonColor;
    this.messageColor = messageColor;
    message = txt;
    this.textSize = textSize;
  }
  
  void display() {
    rectMode(CENTER);
    fill(buttonColor);
    rect(xcoord,ycoord,bwidth,bheight);
    fill(messageColor);
    textSize(textSize);
    text(message,xcoord,ycoord,bwidth,bheight);
    noFill();
  }
  
  String getText() {
    return message;
  }
  
  boolean update(int x, int y) {
    boolean b2 = x >= xcoord - bwidth/2 && x <= xcoord + bwidth/2;
    boolean b3 = y >= ycoord - bheight/2 && y <= ycoord + bheight/2;
    return b2 && b3;
  }

}
