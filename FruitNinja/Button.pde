public class Button {
  int bwidth,bheight;
  int xcoord,ycoord;
  color buttonColor,messageColor;
  String message;
  int textSize;
  String buttonType;
  PImage img;
  boolean displayed;
 
  //button constructor using width,height
  public Button (int xcoord, int ycoord, int bwidth, int bheight, color buttonColor, color messageColor, String txt, int textSize) {
    this.xcoord = xcoord;
    this.ycoord = ycoord;
    this.bwidth = bwidth;
    this.bheight = bheight;
    this.buttonColor = buttonColor;
    this.messageColor = messageColor;
    message = txt;
    this.textSize = textSize;
    buttonType = "color";
    displayed = false;
  }
  //button constructor using img
  public Button(int xcoord, int ycoord, PImage img, color messageColor, String txt, int textSize) {
    this.img = img;
    this.xcoord = xcoord;
    this.ycoord = ycoord;
    bwidth = img.width;
    bheight = img.height;
    buttonColor = color(0,0,0);
    this.messageColor = messageColor;
    message = txt;
    this.textSize = textSize;
    buttonType = "image";
    displayed = false;
  }
 //displays the button
  void display() {
    if (buttonType.equals("color")) {
      rectMode(CENTER);
      fill(buttonColor);
      rect(xcoord,ycoord,bwidth,bheight);
      fill(messageColor);
      textSize(textSize);
      text(message,xcoord,ycoord,bwidth,bheight);
      noFill();
      displayed = true;
    }
    if (buttonType.equals("image")) {
      image(img,xcoord - bwidth/2,ycoord - bheight/2);
      displayed = true;
    }
  }
 
  String getText() {
    return message;
  }
 
  void hide() {
    displayed = false;
  }
  
  boolean isDisplayed() {
    return displayed;
  }
 
 //resizes image
  void resize(int f) {
    if (buttonType.equals("image")) {
      img.resize(f,0);
      bwidth = img.width;
      bheight = img.height;
    }
  }
 
 //checks if (mouse)x,(mouse)y are within the button
  boolean update(int x, int y) {
    boolean b2 = x >= xcoord - bwidth/2 && x <= xcoord + bwidth/2;
    boolean b3 = y >= ycoord - bheight/2 && y <= ycoord + bheight/2;
    return b2 && b3 && displayed;
  }

}
