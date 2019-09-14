//Charlie Sun
//25/7/2019
//Control the gost with your up,down, right, left key
//There is going to be 1 new cherry and three new enemies every level
//Your goal is to eat all cherry
//Your have three lives and every cherry giving you 1 live the maximum lives is 5.
//Also by pressing o gives you 0-5 seconds of invicible time (It is all luck) 
//This is a really good game to release stress ^v^
//P.S. DON'T PRESS THE WRONG KEYS
//Source
//Pac https://commons.wikimedia.org/wiki/File:Original_PacMan.png
//Gost https://banner2.kisspng.com/20180416/ohq/kisspng-ms-pac-man-ghosts-video-game-pac-man-5ad4ef05b8a731.6587195715239042617564.jpg
//Cherry https://ui-ex.com/images/pacman-transparent-cherry-1.png
// Audio pop and eat came from youtube and freedom is from my friend
//OMH


SoundFX fx;
Player pl;
Timer t;
Timers ts;

ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Prize> prizes = new ArrayList<Prize>();
int gameState=0;
int eni = 5;
int level = 1;
int priz = 3;
boolean oo = false;


void setup() {

  size(600, 600);
  t = new Timer(32);
  fx = new SoundFX(this);
  ts = new Timers(5);
  init();
}


void init() {
  pl = new Player();
  enemies.clear();
  fx.freedom();
 
  for (int i=0; i<eni; i++) {
    enemies.add(new Enemy());
  }
  prizes.clear();
  for (int i=0; i<3; i++) {
    prizes.add(new Prize());
  }
  level = 1;
}

void initi() {
  pl = new Player();
  enemies.clear();
   
   

  for (int i=0; i<eni; i++) {
    enemies.add(new Enemy());
  }
  prizes.clear();
  for (int i=0; i<priz; i++) {
    prizes.add(new Prize());
  }
}

void draw() {
  if (gameState==0) {
    background(0, 0, 255);
    intro();
  } else if ( gameState >= 1) {
    gameOn();
    if (t.timeHasRunOut()) {
      gameState = - 1;
    }
    text(("Time left ")+(t.timeRemainingSeconds()), 50, 100);
    text(("Lives "+ (pl.lives)), 50, 150);
  } else if ( gameState == - 1) {


    gameOutro();
  } else if ( gameState == - 2) {
    gameWon();
  }
}

void keyPressed() {

  if (keyCode == 37) { // left
    pl.dx = -5;
  } else if (keyCode == 38) { // up
    pl.dy = -5;
  } else if (keyCode == 39) { // right
    pl.dx = 5;
  } else if (keyCode == 40) { // down
    pl.dy = 5;
  } else if (keyCode == 32) { // space
    gameState++;
    if (gameState == 0) {
      level = 1;
      eni = 5;
      priz = 3;
      init();
      t = new Timer(22);
      ts = new Timers(5);
    }
  } else if (key == ENTER || key == RETURN ) { 
    if (gameState == -2 ) {
      gameState += 2;
    
 
      eni += 2;
      priz ++;
      level++;
      initi();
      t = new Timer(22);
      ts = new Timers(5);
    }
  } else if (key == 'o') {
    oo = true;
   
  }
}  


void intro() {
  background(0);
  fill(#14FF00);
  textSize(25);
  text ("Press space to enter", 175, 300);
}
void keyReleased() {
  pl.dx = 0;
  pl.dy = 0;
}

void gameOn() {
  background(0);
  fill(#14FF00);    
  textSize(25);
  text ("Level " + level, 260, 40); 
  pl.basics();
  pl.bounceAtEdge();

  for (int i=0; i<enemies.size(); i++) {
    Enemy en = enemies.get(i);
    en.basics();
    en.bounceAtEdge();
    if (oo == false) {
      if (pl.collidesWith(en)) {
        enemies.remove(i);
        fx.eat();
        pl.lives--;

        if (pl.lives == 0) {
          gameState = -1;
        }
      } 
    } else { 
       if (ts.timeHasRunOut()) {
      oo = false;
    }
       textSize(25);
       text(("Invincible Time ")+(ts.timeRemainingSeconds()), 50, 200);
      }
  }
  if (prizes.size()==0) {
    gameState = - 2;
  }
  for (int v =0; v <prizes.size(); v++) {
    Prize pr = prizes.get(v);
    pr.display();

    if (pl.collide(pr)) {
      prizes.remove(v);
      fx.pop();
      if (pl.lives < 5) {
        pl.lives ++;
      }
    }
  }
}


void gameOutro() {
  background(0);
  fill(#14FF00);
  textSize(25);
  text ("You Failed", 222, 275);
  text ("Press space to continue", 170, 320); 
  fx.freedom.pause();
}

void gameWon() {
  background(0);
  fill(#14FF00);
  textSize(25);
  text ("Level Cleared", 225, 275); 
  text ("Press enter to continue", 170, 320);
  text ("Press space to restart", 178, 370);
}
//Suggestions
// Aray: it would be better if the player moved faster, but its good though
// Too hard
