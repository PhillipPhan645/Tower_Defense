class Bullet {
  float x, y, vx, vy, d;
  int hp;
  
  Bullet(float _x, float _y, float _vx, float _vy) {
    x  = _x ;
    y  = _y ;
    vx = _vx;
    vy = _vy;
    d = 45;
    hp = 1;
  }
  
  void show() {
    image(tactbullet, x, y, d, d);
  }
  
  void act() {
    x = x + vx;
    y = y + vy;
    if (x < -10 || x > 825 || y < -10 || y > height+10) {
      hp = 0;
    }
  }
}
