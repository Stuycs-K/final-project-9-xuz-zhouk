public class Button {
  int bwidth,bheight;
  color buttonColor,messageColor;
  String message;
  
  public Button (int bwidth, int bheight, color buttonColor, color messageColor, String txt) {
    this.bwidth = bwidth;
    this.bheight = bheight;
    this.buttonColor = buttonColor;
    this.messageColor = messageColor;
    message = txt;
  }
  
  void display(int x, int y) {
    rectMode(CENTER);
    fill(buttonColor);
    rect(x,y,bwidth,bheight);
    fill(messageColor);
    text(message,x+bwidth/4-2,y+bheight/4,bwidth,bheight);
    noFill();
  }
  
  void mousePressed() {
    
  }
}
