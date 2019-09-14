class Prize {

  float x, y, dx, dy, size;
   PImage Cherry;

  Prize() {
    x = random(width);
    y = random(height);
    dx = 0;
    dy = 0;
    size = 30;
     Cherry = loadImage("cherry.png");
  }


  
  void display() {
     image (Cherry, x, y, size, size);
    x += dx;
    y += dy;
    
    if (x < 0 || x > width) {
      dx *= -1;
      x += dx;
    }
    if (y < 0 || y > height) {
      dy *= -1;
      y += dy;
    }
  }
   

}
