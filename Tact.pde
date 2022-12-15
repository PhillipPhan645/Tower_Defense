class Tact {
  final int PLACING = 0;
  final int PLACED  = 1;

  float x, y;
  int cooldown, threshold;
  int towermode;
  int d;
  boolean touch;

  Tact(float _x, float _y, int c, int th) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    towermode = PLACING;
    d = 100;
    touch = false;
  }
  
  void show() {
    println(touch);

    stroke(black);
    strokeWeight(4);
    fill(blue);
    if (towermode == PLACED) {
      image(tact, x, y, 80, 80);
    } else if (towermode == PLACING) {
      checkOverlappingTowers();
      image(tact, mouseX, mouseY, 80, 80);
      if (mousePressed && mouseX < 825 && touch == false) {
        towermode = PLACED;
        money = money - 150;
        x = mouseX;
        y = mouseY;
      }
    }
    if (towermode == PLACING) building = true;
    if (towermode == PLACED) building = false;
  }


  void checkOverlappingTowers() {
    touch = false;
    int i = 0;
    while (i < tacts.size()-1) {
      Tact myTact = tacts.get(i);
      if (dist(myTact.x, myTact.y, mouseX, mouseY) < myTact.d) {
        touch = true;
      }
      i++;
    }
  }

  void act() {
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;
      if (alive == true) {
        bullets.add(new Bullet(x, y, 0, -10));
        bullets.add(new Bullet(x, y, 0, 10));
        bullets.add(new Bullet(x, y, -10, -0));
        bullets.add(new Bullet(x, y, 10, 0));
      }
    }
  }
}
