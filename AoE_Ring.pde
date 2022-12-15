class AoE_Ring {
  final int PLACING = 0;
  final int PLACED  = 1;

  float x, y;
  int cooldown, threshold;
  int towermode;
  int d;
  int counter;
  boolean touch;

  AoE_Ring(float _x, float _y, int c, int th) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    towermode = PLACING;
    d = 100;
    counter = 0;
    touch = false;
  }

  void show() {
    stroke(black);
    strokeWeight(4);
    fill(blue);
    if (towermode == PLACED) {
      image(aoetower, x, y, 80, 80);
    } else if (towermode == PLACING) {
      image(aoetower, mouseX, mouseY, 80, 80);
      checkOverlappingTowers();
      if (mousePressed && mouseX < 825 && touch == false) {
        towermode = PLACED;
        money = money - 750;
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
    while (i < aoerings.size()-1) {
      AoE_Ring  myAoE_Ring = aoerings.get(i);
      if (dist(myAoE_Ring.x, myAoE_Ring.y, mouseX, mouseY) < myAoE_Ring.d) {
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
        aoebullets.add(new AoE_Bullet(x, y));
      }
    }
  }
}
