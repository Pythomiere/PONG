import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//PONG
// Elvis Chen
// 1-2
// Nov. 8th, 2020


// Mode framework
int mode; 
final int intro = 1;
final int game = 2; 
final int gameover = 3; 
final int pause = 4; 
int gamemode; 
final int gapmode = 1; 
final int summode = 2; 
final int timemode = 3;
final int reachmode = 4; 
int winner = 0; 
final int left = 1; 
final int right = 2; 
final int tie = 3; 

// entity variables
float leftx, lefty, leftd, rightx, righty, rightd, paddles; // paddles
float ballx, bally, balld, balls; // ball 
float vx, vy;
float a, b;
int ais; 

// keyboard variables
boolean wkey, skey;
boolean upkey, downkey, AI;
boolean pauseswitch;

// color!
color lightpurple = #9C83BF;
color dimgrey = #A7A6A6;
color productred = #E05F61;
color deepnavy = #2D3246;
color yellow = #F4B955;

// scoring
int leftscore, rightscore, timer, highscore;
PFont pix;
int gap, sum, reach;
float time;

// pictures 
PImage PAUSE, PLAY; 

// intro
float PONG, PONGsize;
int circlex; 

// sound variables
Minim minim; 
AudioPlayer normaltheme, rushtheme, ding, tick, tada, welcome, bump, gamestart, boop;

void setup() {
  size(1000, 800);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  mode = intro;
  gamemode = gapmode;
  PONG = 1.002;
  PONGsize = 100;
  
  //music
  minim = new Minim(this);
  normaltheme = minim.loadFile("looop.mp3");
  bump = minim.loadFile("explosion.mp3");
  tada = minim.loadFile("tada.mp3");
  tick = minim.loadFile("tick.mp3");
  ding = minim.loadFile("ding.mp3");
  welcome = minim.loadFile("splash.mp3");
  rushtheme = minim.loadFile("fotbb.mp3");
  gamestart = minim.loadFile("lance.mp3");
  boop = minim.loadFile("boop.mp3");

  // initialize paddles
  leftx = 0; 
  lefty = height/2; 
  leftd = 200; 

  rightx = width; 
  righty = height/2; 
  rightd = leftd;
  
  paddles = 35;

  //initialize ball
  ballx = width/2; 
  bally = height/2; 
  balld = 80; 
  balls = 5;
  vx = -1;
  vy = -1;
  AI = false;
  ais = 25;

  //initialize keyboard
  wkey = skey = false;
  upkey = downkey = false;
  pauseswitch = false;
  
  //initialize score
  leftscore = rightscore = 0;
  timer = 50; 
  pix = createFont("Pix.ttf", 200);
  textFont(pix);

  // images 
  PAUSE = loadImage("pause.png");
  PLAY = loadImage("play.png");
}

void draw() {
  if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
  } else if (mode == gameover) {
    gameover();
  } else if (mode == pause) {
    pausescreen();
  } else {
    println("Error: mode =" + mode);
  }
}
