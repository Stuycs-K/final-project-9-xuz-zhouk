public class Button {
  int bwidth,bheight;
  int xcoord,ycoord;
  color buttonColor,messageColor;
  String message;
  
  public Button (int xcoord, int ycoord, int bwidth, int bheight, color buttonColor, color messageColor, String txt) {
    this.xcoord = xcoord;
    this.ycoord = ycoord;
    this.bwidth = bwidth;
    this.bheight = bheight;
    this.buttonColor = buttonColor;
    this.messageColor = messageColor;
    message = txt;
  }
  
  void display() {
    rectMode(CENTER);
    fill(buttonColor);
    rect(xcoord,ycoord,bwidth,bheight);
    fill(messageColor);
<<<<<<< HEAD
    text(message,x+bwidth/4-2,y+bheight/4,bwidth,bheight);
    noFill();
  }
  
  void draw() {
    
  }
  
  boolean isClicked() {
    boolean b1 = mousePressed;
    boolean b2 = mouseX >= xcoord && mouseX <= xcoord+bwidth;
    boolean b3 = mouseY >= ycoord && mouseY <= ycoord+bheight;
    return b1 && b2 && b3;
  }
  void mousePressed() {
    
  }

=======

>>>>>>> b81e200ff325422e45fc2d92fb59e48c91dbe637
}
