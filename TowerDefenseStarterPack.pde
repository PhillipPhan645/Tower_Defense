//Tower Defense Game
//Phillip Phan
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
final int MAPSELECT= 4;
int mode;

//Color Palette
color red    = #FFADAD;
color orange = #FFD6A5;
color yellow = #FDFFB6;
color green  = #CAFFBF;
color blue   = #A0C4FF;
color purple = #BDB2FF;
color white  = #FFFFFC;
color black  = #000000;
color pink   = #FFC6FF;
color brown  = #cb997e;
color grey   = #C0C0C0;
color Bred   = #EE4B2B;
color Dblue  = #050A30;
color cyan   = #E0FFFF;
color beige  = #F5F5DC;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start;
Button nextwave;
Button build;
Button play;
Button gun;
Button sniper;
Button AoEtower;
Button selectedmap1;
Button selectedmap2;
Button retry;

//Alive
boolean alive;

//pathing
boolean path;

//money
int money;

//building
boolean building;

//Collections of objects
//nodes
Node[] nodes, map1nodes, map2nodes;

//mobs
ArrayList<Mob> mobs;
ArrayList<SpeedyMob> speedymobs;
ArrayList<ChonkyMob> chonkymobs;

//bullets
ArrayList<Bullet> bullets;
ArrayList<AoE_Bullet> aoebullets;

//tower
ArrayList<Tact> tacts;
ArrayList<Sniper> snipers;
ArrayList<AoE_Ring> aoerings;

//Images and Gifs
Gif introback;
PImage statue;
PImage house;
PImage playb;
PImage nextwaves;

//tower
PImage tact;
PImage snipe;
PImage aoetower;

//bullet
PImage tactbullet;
PImage aoebullet;

//map
PImage spooky;
PImage gameovermap;
PImage selectedmap;
PImage map;


//Fonts
PFont karash;
PFont kids;

//counter
int counter;

//wave
int wavecount;

//lives
int lives;

//insufficent money timer
int timer;
// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  introback = new Gif("castle/frame_", "_delay-0.08s.gif", 22, 1, width/2, height/2, width, height);
  map       = loadImage("image/map.png");
  nextwaves = loadImage("image/nextwave.png");
  house     = loadImage("image/build.png");
  playb     = loadImage("image/playb.png");
  tact      = loadImage("image/tact.png");
  tactbullet = loadImage("image/bullet.png");
  snipe = loadImage("image/sniper.png");
  aoetower = loadImage("image/aoetower.png");
  spooky = loadImage("image/map2.png");
  aoebullet = loadImage("image/aoebullet.png");
  gameovermap = loadImage("image/gameoverpic.jpeg");


  //Load Fonts
  karash = createFont("font/Karasha.ttf", 200);
  kids   = createFont("font/newkids.otf", 200);


  //Create Collections of Objects
  //mobs
  chonkymobs = new ArrayList<ChonkyMob>();
  speedymobs = new ArrayList<SpeedyMob>();
  mobs = new ArrayList<Mob>();

  //tower
  tacts = new ArrayList<Tact>();
  snipers = new ArrayList<Sniper>();
  aoerings = new ArrayList<AoE_Ring>();

  //bullets
  bullets = new ArrayList<Bullet>();
  aoebullets = new ArrayList<AoE_Bullet>();

  //wavecount
  wavecount = 0;

  //money
  money = 500;

  //building
  building = false;

  //lives
  lives = 3;
}

void makeButtons() {
  //INTRO - Start
  textFont(karash);
  start    = new Button("START", width/2, 3*height/4, 200, 100, white, black);
  nextwave = new Button(nextwaves, 915, 75, 125, 80, white, green);
  build    = new Button(house, 916, 175, 125, 80, white, green);
  play    = new Button(playb, 916, 175, 125, 80, white, green);
  gun    = new Button(tact, 916, 285, 125, 80, white, black);
  sniper = new Button(snipe, 916, 420, 125, 80, white, black);
  AoEtower = new Button(aoetower, 916, 555, 123, 80, white, black);
  selectedmap1 = new Button(map, width/2-width/4, height/2+100, 300, 200, white, black);
  selectedmap2 = new Button(spooky, width/2+width/4, height/2+100, 300, 200, white, black);
  retry = new Button("Retry", width/2, 600, 200, 100, white, black);
}

void makeNodes() {
  map1nodes = new Node[8];
  map1nodes[0] = new Node(width/2, 75, 1, 0);
  map1nodes[1] = new Node(775, 75, 0, 1);
  map1nodes[2] = new Node(775, 600, -1, 0);
  map1nodes[3] = new Node(620, 600, 0, -1);
  map1nodes[4] = new Node(620, 150, -1, 0);
  map1nodes[5] = new Node(380, 150, 0, 1);
  map1nodes[6] = new Node(380, 600, -1, 0);
  map1nodes[7] = new Node(220, 600, 0, -1);

  map2nodes = new Node[11];
  map2nodes[0] = new Node(width/2, 250, 1, 0);
  map2nodes[1] = new Node(750, 250, 0, -1);
  map2nodes[2] = new Node(750, 75, -1, 0);
  map2nodes[3] = new Node(400, 75, 0, 1);
  map2nodes[4] = new Node(400, 440, -1, 0);
  map2nodes[5] = new Node(175, 440, 0, -1);
  map2nodes[6] = new Node(175, 320, 1, 0);
  map2nodes[7] = new Node(610, 320, 0, 1);
  map2nodes[8] = new Node(610, 600, -1, 0);
  map2nodes[9] = new Node(400, 600, 0, 1);
  map2nodes[10] = new Node(400, 700, -1, 0);
}

// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else if (mode == MAPSELECT) {
    mapselect();
  }
  println(mouseX + "," + mouseY);
}
