class SpeedyMob extends Mob {
  SpeedyMob(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 40;
    value = 20;
    maxhp = 10 + wavecount;
    hp = maxhp;
    fillcolor = blue;
    strokecolor = white;
    speed = 4;
  }
}
