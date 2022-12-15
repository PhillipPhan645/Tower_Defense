class Mob {
  float x, y, vx, vy, d;
  int hp, maxhp;
  int value;
  color fillcolor, strokecolor;
  float speed;

  Mob(float _x, float _y, float _vx, float _vy) {
    x  = _x ;
    value = 15;
    y  = _y ;
    vx = _vx;
    vy = _vy;
    d = 40;
    hp = 15;
    maxhp = 15;
    speed = 2;
    strokecolor = black;
    fillcolor = grey;
  }

  void show() {
    fill(purple);
    healthbar();
    strokeWeight(3);
    stroke(strokecolor);
    fill(fillcolor);
    circle(x, y, d);
  }

  void act() {
    x =  x + vx*speed;
    y = y + vy*speed;
    int i = 0;
    while (i < nodes.length) {
      if (dist(nodes[i].x, nodes[i].y, x, y) < 5) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
      i++;
    }
    i = 0;
    while (i < bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y ) < d/2 + myBullet.d/2) {
        hp = hp -2;
        myBullet.hp = myBullet.hp -1;
      }
      i++;
    }

    i = 0;
    while (i < aoebullets.size()) {
      AoE_Bullet myAoE_Bullet = aoebullets.get(i);
      if (dist(myAoE_Bullet.x, myAoE_Bullet.y, x, y ) < d/2 + myAoE_Bullet.d/2) {
        hp = hp -1;
        myAoE_Bullet.hp = myAoE_Bullet.hp -1;
      }
      i++;
    }
  }
  void alive() {
    alive = true;
  }

  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+10)-2, 54, 24);//background
    fill(red);
    rect(x-25, y-(d+10), 50, 20);
    fill(green);
    rect(x-25, y-(d+10), hp*50/maxhp, 20);
    rectMode(CENTER);
  }
}
