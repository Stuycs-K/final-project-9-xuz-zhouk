public class Button {
  int width,height;
  color buttonColor,messageColor;
  String message;
  
  public Button (int width, int height, color buttonColor, color messageColor, String txt) {
    this.width = width;
    this.height = height;
    this.buttonColor = buttonColor;
    this.messageColor = messageColor;
    message = txt;
  }
  
  void display(int x, int y) {
    rectMode(CENTER);
    fill(buttonColor);
    rect(x,y,width,height);
    fill(messageColor);
    text(message,x,y,width,height);
    noFill();
  }

}
