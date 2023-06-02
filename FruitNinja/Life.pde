public class Life {
  boolean filled;
  int xcoor;
  int ycoor;
  PImage filledX;
  PImage emptyX;
  
  //constructor
  public Life (int x, int y) {
    filledX = loadImage("life.png");
    filledX.resize(100,0);
    emptyX = loadImage("emptyLife.png");
    emptyX.resize(200,0);
    xcoor = x;
    ycoor = y;
    filled = false;
  }
  
  //displays the lifebox
  void display() {
    if (filled == true) {
      image(filledX,xcoor-filledX.width/2,ycoor-filledX.height/2);
    }
    else {
      image(emptyX,xcoor-emptyX.width/2,ycoor-emptyX.height/2);
    }
  }
  
  void setLife(boolean b) {
    filled = b;
  }
  
  boolean filled() {
    return filled;
  }
}
