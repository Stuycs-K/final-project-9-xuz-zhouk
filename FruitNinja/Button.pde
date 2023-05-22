public class Button {
  int width,height;
  color c;
  String text;
  
  public Button (int width, int height, int color, String txt) {
    this.width = width;
    this.height = height;
    this.c = c;
    this.text = text;
  }
  
  void display(int x, int y) {
    fill(c);
    rect(x,y,width,height);
    noFill();
  }

}
