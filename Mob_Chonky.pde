class ChonkyMob extends Mob {
  ChonkyMob(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 80;
    maxhp = 20 + wavecount*4;
    hp = maxhp;
    value = 80;
    strokeWeight(5);
    fillcolor = black;
    strokecolor = Dblue;
    speed = 0.5;
  }
}
