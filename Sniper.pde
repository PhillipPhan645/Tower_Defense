class Sniper {
  final int PLACING = 0;
  final int PLACED  = 1;

  float x, y;
  int cooldown, threshold;
  int towermode;
  int d;
  boolean touch;

  Sniper(float _x, float _y, int c, int th) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    towermode = PLACING;
    d = 100;
    touch = false;
  }

  void show() {
    stroke(black);
    strokeWeight(4);
    fill(blue);
    if (towermode == PLACED) {
      image(snipe, x, y, 80, 80);
    } else if (towermode == PLACING) {
      image(snipe, mouseX, mouseY, 80, 80);
      checkOverlappingTowers();
      if (mousePressed && mouseX < 825 && touch == false) {
        towermode = PLACED;
        money = money - 500;
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
    while (i < snipers.size()-1) {
      Sniper mySniper = snipers.get(i);
      if (dist(mySniper.x, mySniper.y, mouseX, mouseY) < mySniper.d) {
        touch = true;
      }
      i++;
    }
  }

  void act() {
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;
      int i;
      i = 0;
      if (alive == true) {
        Mob myMob = mobs.get(i);
        myMob.hp = myMob.hp - 10;
      }
      i++;
    }
  }
}
