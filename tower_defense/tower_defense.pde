import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//Tower Defense Game
//RUTH BERHE
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
final int OPTIONS  = 4;

int mode;


//tower types
final int GUN=0;
final int AOE=1;
final int SNIPER=2;

int MAP1=1;
int MAP2=2;

PImage selectedmap;

//Pallette
color white    =#ffffff;
color black    =#000000;
color ablack   =#0D1321;
color linen    =#FFEDDF;
color green    =#C5D86D;
color burgundi =#86615C;
color blue      =#AFE0CE;
color dgreen    =#001011;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start, wave, rect, build, play, gun, bmode, cash, sniper, AoE, selectmap, map1, map2, rect1, rect2, restart;

//Collections of objects
Node[] nodes, map1nodes, map2nodes;

ArrayList <Mob> mobs;
ArrayList <Tower> towers;
ArrayList <Bullet> bullets;

//Images and Gifs
Gif startthegamegif, firegif, introgif;
//Fonts
PFont swipe;
PImage newwave, gold, mapy1, mapy2, warrior, bluemob, mappy1;
//SIGN
int counter, wcounter, cashcount, lives;
int maps;
int timer=100;
int gcounter=5;
int scounter=25;
int acounter=30;
int score,HS=0;
float tsize=5;

//sfx
Minim minim;
AudioPlayer collectcoin;

// ===================== SETUP =========================

void setup() {
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
  
 // mapy1= loadImage("mapy1.png");
   mappy1= loadImage("mappy1.png");
  mapy2= loadImage("mapy2.png");
  warrior= loadImage("warrior.png");
  bluemob=loadImage("bluemob.png");
  newwave= loadImage("newwave.png");
  gold= loadImage("gold.png");
  introgif= new Gif ("introgif/frame_", "_delay-0.15s.gif", 34, 1, width/2, height/2, width, height);
  startthegamegif= new Gif("startthegamegif/frame_", "_delay-0.07s.gif", 12, 2, width/2, 3*height/2, 200, 200);
 minim= new Minim(this);
  collectcoin = minim.loadFile( "collectcoin.mp3");

  //Load Fonts
  PFont swipe = createFont("swipe.ttf", 50);
  textFont(swipe);
  counter=0;
  wcounter=1;
  cashcount=100;
  lives=5;

  //Create Collections of Objects
    mobs= new ArrayList<Mob>();
  towers= new ArrayList<Tower>();
  bullets= new ArrayList<Bullet>();
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", 700, height/2, 300, 100, white, black);
  selectmap= new Button("MAPS", 250, height/2, 400, 100, dgreen, white);
  //PLAY - Next Wave, To Build Mode
  wave = new Button(newwave, 900, 100, 100, 100, linen, green);
  rect= new Button("", 900, 100, 110, 110, linen, green);
  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
  build= new Button("BUILD", 900, 250, 100, 100, ablack, white);
  play= new Button("PLAY", 900, 100, 100, 100, green, white);
  gun= new Button ("GUN", 900, 200, 100, 100, ablack, blue);
  cash= new Button (gold, 50, 50, 50, 50, green, white);
  sniper= new Button ("SNIPER", 900, 340, 100, 100, linen, burgundi);
  AoE= new Button("AoE", 900, 500, 100, 100, blue, white);
  restart= new Button("RESTART", width/2, 200, 300, 100, dgreen, blue);

  // options screen
  map1= new Button(mappy1, 250, 300, 400, 400, blue, white);
  map2= new Button(mapy2, 750, 300, 400, 400, blue, white);
  rect1= new Button("rect1", 250, 300, 420, 420, blue, white);
  rect2= new Button("rect2", 750, 300, 420, 420, blue, white);
}

void makeNodes() {
  //Plot the nodes on the map
  //map1 nodes
  map1nodes= new Node[8];
  map1nodes[0]= new Node(200, 400, 0, -1);
  map1nodes[1]= new Node(200, 200, 1, 0);
  map1nodes[2]= new Node(410, 200, 0, 1);
  map1nodes[3]= new Node(410, 550, -1, 0);
  map1nodes[4]= new Node(250, 550, 0, -1);
  map1nodes[5]= new Node(250, 460, 1, 0);
  map1nodes[6]= new Node(600, 460, 0, -1);
  map1nodes[7]= new Node(600, 300, 1, 0);

  //map2nodes
  map2nodes= new Node[16];
  map2nodes[0]= new Node(260, 400, 0, -1);
  map2nodes[1]= new Node(260, 290, -1, 0);
  map2nodes[2]= new Node(90, 290, 0, -1);
  map2nodes[3]= new Node(90, 200, 1, 0);
  map2nodes[4]= new Node(480, 200, 0, 1);
  map2nodes[5]= new Node(480, 290, -1, 0);
  map2nodes[6]= new Node(350, 290, 0, 1);
  map2nodes[7]= new Node(350, 560, 1, 0);
  map2nodes[8]= new Node(515, 560, 0, -1);
  map2nodes[9]= new Node(515, 480, -1, 0);
  map2nodes[10]= new Node(430, 480, 0, -1);
  map2nodes[11]= new Node(430, 400, 1, 0);
  map2nodes[12]= new Node(670, 400, 0, 1);
  map2nodes[13]= new Node(670, 480, -1, 0);
  map2nodes[14]= new Node(590, 480, 0, 1);
  map2nodes[15]= new Node(590, 630, 1, 0);
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
  } else if ( mode== OPTIONS) {
    options();
  }
}
