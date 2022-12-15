//This function draws the PLAY screen
void play() {
  image(selectedmap, width/2, height/2);
  pickpathing();
  handlebuttonclicks();
  animateThings();
  toolbar();
  ifoutoflives();
  
}

void animateThings() {
  //mobs
  int i = 0;
  while (i < mobs.size()) {
    Mob myMob = mobs.get(i);
    myMob.act();
    myMob.show();
    myMob.alive();
    if (myMob.hp <= 0) {
      mobs.remove(i);
      money = money + myMob.value;
      alive = false;
    } else
      if (myMob.x <= 0 || myMob.y <= 0 && myMob.x < 250) {
        mobs.remove(i);
        lives--;
        alive = false;
      } else
        i++;
  }

  //tower
  i = 0;
  while (i < tacts.size()) {
    Tact myTact = tacts.get(i);
    myTact.act();
    myTact.show();
    i++;
  }









  //sniper
  i = 0;
  while (i < snipers.size()) {
    Sniper mySniper = snipers.get(i);
    mySniper.show();
    if (mySniper.x >= 0) {
      mySniper.act();
    }
    i++;
  }

  //aoe
  i = 0;
  while (i < aoerings.size()) {
    AoE_Ring myAoE_Ring = aoerings.get(i);
    myAoE_Ring.show();
    myAoE_Ring.act();
    i++;
  }

  //aoebullet
  i = 0;
  while (i < aoebullets.size()) {
    AoE_Bullet myAoE_Bullet = aoebullets.get(i);
    myAoE_Bullet.act();
    myAoE_Bullet.show();
    if (myAoE_Bullet.hp <= 0) {
      aoebullets.remove(i);
    } else
      i++;
  }


  //bullet
  i = 0;
  while (i < bullets.size()) {
    Bullet myBullet = bullets.get(i);
    myBullet.act();
    myBullet.show();
    if (myBullet.hp <= 0) {
      bullets.remove(i);
    } else
      i++;
  }
}

void pathing1() {
  stroke(beige);
  strokeWeight(57);
  line(width/2, 0, width/2, 75);
  line(width/2, 75, 775, 75);
  line(775, 75, 775, 600);
  line(775, 600, 620, 600);
  line(620, 600, 620, 150);
  line(620, 150, 380, 150);
  line(380, 150, 380, 600);
  line(380, 600, 220, 600);
  line(220, 600, 220, 0);
  stroke(brown);
  strokeWeight(8);
  line(475, 0, 475, 100);
  line(475, 100, 748, 100);
  line(748, 100, 748, 573);
  line(748, 573, 650, 573);
  line(648, 573, 648, 123);
  line(648, 123, 350, 123);
  line(350, 123, 350, 573);
  line(350, 573, 248, 573);
  line(248, 573, 248, 0);
  line(530, 0, 530, 45);
  line(530, 45, 803, 45);
  line(803, 45, 803, 631);
  line(803, 631, 593, 631);
  line(593, 631, 593, 180);
  line(593, 180, 410, 180);
  line(410, 180, 410, 631);
  line(410, 631, 193, 631);
  line(193, 631, 193, 0);
}

void pathing2() {
  stroke(beige);
  strokeWeight(50);
  line(width/2, 0, width/2, 250);
  line(width/2, 250, 750, 250);
  line(750, 250, 750, 75);
  line(750, 75, 400, 75);
  line(400, 75, 400, 440);
  line(400, 440, 175, 440);
  line(175, 440, 175, 320);
  line(175, 320, 610, 320);
  line(610, 320, 610, 600);
  line(610, 600, 400, 600);
  line(400, 600, 400, 700);
  line(400, 700, 0, 700);
  stroke(brown);
  strokeWeight(8);
  line(525, 0, 525, 50);
  line(525, 50, 774, 50);
  line(774, 50, 774, 275);
  line(774, 275, 476, 275);
  line(476, 275, 476, 103);
  line(476, 103, 427, 103);
  line(427, 103, 427, 295);
  line(427, 295, 634, 295);
  line(634, 295, 634, 629);
  line(634, 629, 428, 629);
  line(428, 629, 428, 728);
  line(428, 728, 0, 728);
  line(475, 0, 475, 50);
  line(475, 50, 375, 50);
  line(375, 50, 375, 293);
  line(375, 293, 150, 293);
  line(150, 293, 150, 468);
  line(150, 468, 431, 468);
  line(431, 468, 425, 347);
  line(425, 347, 583, 347);
  line(583, 347, 583, 573);
  line(583, 573, 374, 573);
  line(374, 573, 374, 674);
  line(374, 674, 0, 674);
  line(526, 101, 723, 101);
  line(723, 101, 723, 223);
  line(526, 101, 526, 223);
  line(526, 223, 723, 223);
  line(201, 347, 372, 347);
  line(201, 347, 201, 415);
  line(372, 347, 372, 415);
  line(201, 415, 372, 415);
}

void shownodes() {
  int i = 0;
  while (i < nodes.length) {
    nodes[i].show();
    i++;
  }
}

void toolbar() {
  //side bar
  stroke(grey);
  strokeWeight(2);
  fill(grey);
  rect(925, height/2, 200, height);

  //next wave button
  nextwave.show();
  fill(white);
  textFont(kids);
  textSize(25);
  text("Next Wave" + wavecount, 915, 10);
  fill(green);
  stroke(green);

  //build
  build.show();

  //money
  fill(black);
  strokeWeight(5);
  textSize(50);
  fill(green);
  text("Money: " + money, 150, 700);

  //lives;
  fill(black);
  strokeWeight(5);
  textSize(50);
  fill(red);
  text("Lives: " + lives, 150, 760);
}

void  handlebuttonclicks () {
  int i;
  int y;
  i = -1;
  y = 0;
  if (nextwave.clicked && alive == false) {
    while (i < wavecount) {
      mobs.add(new Mob(500, y, 0, 1));
      y=y-50;
      i++;
    }
    if (wavecount % 2 == 0) {
      i = 0;
      y = -50;
      while (i < wavecount/2) {
        mobs.add(new ChonkyMob(500, y, 0, 1));
        y = y-50;
        i++;
      }
    }
    if (wavecount % 3 == 0) {
      i = 0;
      y = -50;
      while (i < wavecount/3) {
        mobs.add(new SpeedyMob(500, y, 0, 1));
        y = y-50;
        i++;
      }
    }
  }

  if (alive == false && nextwave.clicked) {
    i = -1;
    wavecount++;
  }
  if (build.clicked && building == false) mode = BUILD;
}

void pickpathing() {
  if (path == true) {
    pathing1();
  } else {
    pathing2();
  }
}

void ifoutoflives(){
  if (lives <= 0) {
    mode = GAMEOVER;
  }
}
