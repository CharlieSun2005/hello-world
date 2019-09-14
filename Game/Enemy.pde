class Enemy {
 
  float x, y, dx, dy, size;
 PImage Pac;
  
 
  Enemy() {
    x = random(width);
    y = random(height);
    dx = random(-5,5);
    dy = random(-5,5);
    size = 30;
    Pac = loadImage("PacMan.png");
  }
  
  
  void basics() {
   image (Pac, x, y, size, size);
   image (Pac, x, y, size, size); 
    x += dx;
    y += dy;  
  }
  
  void bounceAtEdge() {
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
