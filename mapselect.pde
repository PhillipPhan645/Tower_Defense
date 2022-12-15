void mapselect() {
  introback.show();
  fill(black);
  strokeWeight(8);
  text("Select Map", width/2, 150);
  frame1();
  frame2();
  
  //map1
  selectedmap1.show();
  if (selectedmap1.clicked) {
    selectedmap = loadImage("image/map.png");
    selectedmap.resize(width, height);
    nodes = map1nodes;
    mode = PLAY;
    path = true;
  }
  
  //map2
  selectedmap2.show();
  if (selectedmap2.clicked) {
    selectedmap = loadImage("image/map2.png");
    selectedmap.resize(width, height);
    nodes = map2nodes;
    mode = PLAY;
    path = false;
  }
}

void frame1(){
  stroke(black);  
  strokeWeight(8);
  line(100,400,400,400);
  line(400,400,400,600);
  line(400,600,100,600);
  line(100,600,100,400);
}

void frame2(){
  stroke(black);  
  strokeWeight(8);
  line(600,400,900,400);
  line(900,400,900,600);
  line(900,600,600,600);
  line(600,600,600,400);
}
