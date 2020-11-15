void intro() {
  welcome.play();

  // PONG!
  background(dimgrey);
  textSize(PONGsize);
  textAlign(CENTER, CENTER);
  fill(255);
  text("PONG", width/2, height/5);
  if (PONGsize <= 80) {
    PONG = 1.002;
  } else if (PONGsize >= 300) { 
    PONG = 0.998;
  } 
  PONGsize = pow(PONGsize, PONG);
  
  // two players mode
  noStroke();
  if (mouseX <= width/3+125 && mouseX >= width/3-125 && mouseY >= height*2/3-75 && mouseY <= height*2/3+75) {
    fill(#4D4C4C);
  } else {
    fill(#717171);
  }
  rect(width/3, height*2/3, 250, 150, 20);
  fill(255);
  textSize(40);
  text("players", width/3, height*2/3 + 20);
  text("two", width/3, height*2/3 - 35);

  // one players mode
  noStroke();
  if (mouseX <= width*2/3+125 && mouseX >= width*2/3-125 && mouseY >= height*2/3-75 && mouseY <= height*2/3+75) {
    fill(#4D4C4C);
  } else {
    fill(#717171);
  }
  rect(width*2/3, height*2/3, 250, 150, 20);
  fill(255);
  textSize(40);
  text("players", width*2/3, height*2/3 + 20);
  text("one", width*2/3, height*2/3 - 35);

  // mode button
  if (mouseX <= width*7/8+50 && mouseX >= width*7/8-50 && mouseY >= height*8/9-25 && mouseY <= height*8/9+25) {
    fill(#828282);
  } else {
    fill(#717171);
  }
  rect(width*7/8, height*8/9, 100, 50, 20);
  fill(0);
  textSize(20);
  if (gamemode == 1) {
    text("gap", width*7/8, height*8/9-3);
  } else if (gamemode == 2) {
    text("sum", width*7/8, height*8/9-3);
  } else if (gamemode == 3) {  
    text("time", width*7/8, height*8/9-3);
  } else if (gamemode == 4) {
    text("reach", width*7/8, height*8/9-3);
  }
  textSize(50);
  text("MODE", width*7/8, height*23/24);
}

void introClicks() {
  if (mouseX <= width/3+125 && mouseX >= width/3-125 && mouseY >= height*2/3-75 && mouseY <= height*2/3+75) {
    AI = false;
    introreset();
  }
  if (mouseX <= width*2/3+125 && mouseX >= width*2/3-125 && mouseY >= height*2/3-75 && mouseY <= height*2/3+75) {
    AI = true;
    introreset();
  }
  if (mouseX <= width*7/8+50 && mouseX >= width*7/8-50 && mouseY >= height*8/9-25 && mouseY <= height*8/9+25) {
    gamemode = gamemode + 1;
    if (gamemode > 4) {
      gamemode = 1;
    }
  }
}

void introreset() {
  time = 40;
  gap = 3;
  sum = 7;
  reach = 5;
  highscore = leftscore;
  PONG = 1.002;
  PONGsize = 100;
  bally = lefty = righty = height/2; 
  ballx = width/2;
  randomvx(-1, 1);
  vy = random(-1, 1);
  leftscore = rightscore = 0;
  mode = game;
  gamestart.play();
  gamestart.rewind();
  normaltheme.rewind();
  rushtheme.rewind();
}
