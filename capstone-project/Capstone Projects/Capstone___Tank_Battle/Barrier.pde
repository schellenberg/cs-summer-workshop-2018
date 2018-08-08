class Barrier {
  //Creating all the variables used for the size and position of each barrier. 
  float x = 200, y= 175, w = 125, h = 200, left = x, right = x +w, up= y, down = y+h;
  float x1 = 200, y1 = 625, w1 = 125, h1 = 200, left1 = x1, right1 = x1 +w1, up1 = y1, down1= y1+h1;
  float x2 = 625, y2 = 300, w2 = 125, h2 = 400, left2 = x2, right2 = x2 +w2, up2 = y2, down2=y2+h2;


  Barrier() {
  }

  //Displaying each barrier
  void display() {
    fill(255);
    rect(x, y, w, h);
    rect(x1, y1, w1, h1);
    rect(x2, y2, w2, h2);
  }

}