class Player {
  
  int hp, score, lives;
  float x, y, dx, dy, size;
  PImage Gost;
  
  
  Player() {
    hp = 10;
    score = 0;
    lives = 3;
    x = width/2;
    y = height/2;
    dx = 0;
    dy = 0;
    size = 50;
   Gost = loadImage("gost.png");
  }
  


  void basics() {
    image (Gost, x, y, size, size);
    x += dx;
    y += dy;  
    if (size < 50) {
      size = 50; 
    }
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
  
  boolean collidesWith(Enemy e) {
    if (size/2 + e.size/2 > dist(x, y, e.x, e.y)) {
      size += 10;
     
        
      return true;
    } else {
      return false; 
      
    }
  }
  
  boolean collide(Prize p) {
    if (size/2 + p.size/2 > dist(x, y, p.x, p.y)) {
      size -= 10;
     
        
      return true;
    } else {
      return false; 
      
    }
  }
 
}
