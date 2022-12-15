void build() {
  image(selectedmap, width/2, height/2);
  pickpathing();
  toolbarv2();
  handlebuttonclicksv2();
  animateThings();
  poor();
  notenough();
}

void toolbarv2() {
  //side bar
  stroke(grey);
  strokeWeight(2);
  fill(grey);
  rect(925, height/2, 200, height);

  //play
  play.show();

  //gun
  gun.show();
  fill(green);
  text("$150", 915, 340);

  //sniper
  sniper.show();
  fill(green);
  text("$500", 915, 475);

  //aoe
  AoEtower.show();
  fill(green);
  text("$750", 915, 610);



  //money
  fill(black);
  strokeWeight(5);
  textSize(50);
  fill(green);
  text("Money: " + money, 150, 690);

  //lives;
  fill(black);
  strokeWeight(5);
  textSize(50);
  fill(red);
  text("Lives: " + lives, 150, 760);
}

void  handlebuttonclicksv2 () {
  if (play.clicked && building == false) mode = PLAY;

  if (gun.clicked && building == false && money >= 150) {
    tacts.add(new Tact(-1000, -1000, 30, 30));
  }

  if (sniper.clicked && building == false && money >= 500) {
    snipers.add(new Sniper(-1000, -1000, 100, 100));
  }

  if (AoEtower.clicked && building == false && money >= 750) {
    aoerings.add(new AoE_Ring(-1000, -1000, 100, 100));
  }
}

void notenough() {
  timer--;
  if (timer > 0) {
    fill(red);
    text("Insufficent Money", width/2, 300);
  }
}

void poor() {
  if (AoEtower.clicked && building == false && money < 750) {
    timer = 50;
  }
  if (sniper.clicked && building == false && money < 500) {
    timer = 50;
  }
  if (gun.clicked && building == false && money < 150) {
    timer = 50;
  }
}
