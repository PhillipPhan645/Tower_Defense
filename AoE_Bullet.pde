class AoE_Bullet {
  float x, y, d;
  float visible;
  int hp;

  AoE_Bullet(float _x, float _y) {
    x  = _x ;
    y  = _y ;
    d = 300;
    hp = 100000000;
    visible = 0;
  }

  void show() {
    image(aoebullet, x, y, d, d);
  }

  void act() {
    visible++;
    if (visible == 10) {
      hp = 0;
      visible = 0;
    }
  }
}
