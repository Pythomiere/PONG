void game() {
  // background
  background (dimgrey);
  stroke(lightpurple);
  strokeWeight(5);
  line(width/2, 0, width/2, height);
  fill(dimgrey);
  circle(width/2, height/2, (height+width)/10);

  // scoreboard
  fill(dimgrey);
  rect(width/2, height/5+5, width*2/3, height/5, 20);
  textSize(80);
  fill(productred);
  text(leftscore, width/4+5, height/5);
  fill(deepnavy);
  text(rightscore, 3*width/4-5, height/5);
  fill(lightpurple);
  timer = timer-1;
  textSize(50);
  if (gamemode == gapmode) {
    text(gap - abs(leftscore - rightscore) + " to win!", width/2, height/5);
    if (gap - abs(leftscore - rightscore) == 1) {
      normaltheme.pause();
      rushtheme.play();
    } else { 
      rushtheme.pause();
      normaltheme.play();
    }
  } else if (gamemode == summode) {
    text(sum - leftscore - rightscore + " to win!", width/2, height/5);
    if (int(sum/2) - highscore == 1) {
      normaltheme.pause();
      rushtheme.play();
    } else {
      normaltheme.play();
      rushtheme.pause();
    }
  } else if (gamemode == timemode) {
    text("left time: " + (int)time, width/2, height/5);
    if ((int)time <=10) {
      normaltheme.pause();
      rushtheme.play();
    } else { 
      rushtheme.pause();
      normaltheme.play();
    }
  } else if (gamemode == reachmode) {
    if (leftscore > rightscore) {
      highscore = leftscore;
      if ((reach - highscore) == 1) {
        normaltheme.pause();
        rushtheme.play();
      } else { 
        rushtheme.pause();
        normaltheme.play();
      }
    } else {
      highscore = rightscore;
    }
    text(reach - highscore + " to win!", width/2, height/5);
  }
  image(PAUSE, width/2 + 3, height/2 - 2, 150, 150);

  // paddles 
  noStroke();
  fill(productred);
  circle(leftx, lefty, leftd);
  fill(deepnavy);
  circle(rightx, righty, rightd);

  //move paddles
  if (AI == true) {
    if (ballx >= width/2 && vx >=0) {
      if (righty > bally + balld) {
        righty = righty-ais;
      } else if (righty < bally - balld) {
        righty = righty+ais;
      }
    }
    if (righty > height - balld - rightd/2) {
      righty = height - balld - rightd/2;
    } else if (righty < balld + rightd/2) {
      righty = balld + rightd/2;
    }
  } else {
    if (upkey == true) {
      if (righty >= rightd/2 + balld) {
        righty = righty - paddles;
      }
    }
    if (downkey == true) {
      if (righty <= height - rightd/2 - balld) {
        righty = righty + paddles;
      }
    }
  }
  //if (AI == true) {
  //  if (ballx <= width/2 && vx <=0) {
  //    if (lefty > bally + balld) {
  //      lefty = lefty-ais;
  //    } else if (lefty < bally - balld) {
  //      lefty = lefty+ais;
  //    }
  //  }
  //  if (lefty > height - balld - leftd/2) {
  //    lefty = height - balld - leftd/2;
  //  } else if (lefty < balld + leftd/2) {
  //    lefty = balld + leftd/2;
  //  }
  //} else {
  if (wkey == true) {
    if (lefty >= leftd/2 + balld) {
      lefty = lefty - paddles;
    }
  }
  if (skey == true) {
    if (lefty <= height - leftd/2 - balld) {
      lefty = lefty + paddles;
    }
  }
  // } 

  // ball
  if (ballx == 0 && bally == 0 && vx == -1 && vy == -1) {
    randomvx(1, -1);
    vy = random(-1, 1);
  }
  if (timer < 0) {
    ballx = ballx + (balls+3)*vx;
    bally = bally + (balls+3)*vy;
  }
  if (bally > height+balld) {
    bally = height-balld-1;
  } else if (bally < -balld) {
    bally = balld+1;
  }
  fill(yellow);
  circle(ballx, bally, balld);
  if (dist(ballx, bally, leftx, lefty) <= (leftd + balld)/2) { 
    boop.play();
    boop.rewind();
    b = tan(atan(vx/vy)+2*atan((bally - lefty)/(ballx - leftx)));
    if (ballx > (leftx)) {
      vx = (balls+1)/(1+exp(-1*(b*(vx+vy)/(b+1))));
    } else {
      vx = -(balls+1)/(1+exp(-1*(b*(vx+vy)/(b+1))));
    } 
    if (bally < lefty) {
      vy = (-0.8*balls)*abs(balls+1/(1+exp(-1*(vx/b))));
    } else {
      vy = (0.8*balls)/(1+exp(-1*(vx/b)));
    }
  }
  if (dist(ballx, bally, rightx, righty) <= (rightd + balld)/2) { 
    boop.play();
    boop.rewind();
    a = tan(atan(vx/vy)+2*atan((bally - righty)/(ballx - rightx)));
    if (ballx > (rightx)) {
      vx = (balls+1)/(1+exp(-1*(a*(vx+vy)/(a+1))));
    } else {
      vx = -(balls+1)/(1+exp(-1*(a*(vx+vy)/(a+1))));
    }
    if (bally < righty) {
      vy = (-0.8*balls)*abs(2.5/(1+exp(-1*(vx/a))));
    } else {
      vy = (0.8*balls)/(1+exp(-1*(vx/a)));
    }
  }
  if (bally + balld/2 >= height || bally - balld/2 <= 0) {
    vy = -1*vy;
    ding.play(); 
    ding.rewind();
  }

  // scoring
  if (ballx + balld < 0) {
    rightscore++; 
    scorereset();
    randomvx(-1, 0);
  }
  if (ballx - balld > width) {
    leftscore++; 
    scorereset();
    randomvx(0, 1);
  }
  if (abs(vx) < 1) {
    vx = vx*1.5;
  }
  if (abs(vy) > 5) {
    vy = vy/1.5;
  }

  //gamemodes
  if (gamemode == gapmode && abs(leftscore - rightscore) >= gap) {
    mode = gameover;
    bump.play();
    bump.rewind();
  } else if (gamemode == summode && leftscore+rightscore >= sum) {
    mode = gameover;
    bump.play();    
    bump.rewind();
  } else if (gamemode == timemode) {
    if (time <= 0) {
      mode = gameover;
      bump.play();    
      bump.rewind();
    } else {
      time = (time*60 - 1)/60;
    }
  } else if (gamemode == reachmode && leftscore >= reach || gamemode == reachmode && rightscore >= reach) {
    mode = gameover;
    bump.play();
    bump.rewind();
  }
  if (pauseswitch == true) {
    mode = pause;
    tick.play();
    tick.rewind();
  }
}

void gameClicks() {
  if (dist(width/2, height/2, mouseX, mouseY) <= 150) {
    pauseswitch = !pauseswitch;
  }
}

void randomvx(float ix, float iy) {
  vx = random(ix, iy);
  if (abs(vx)<0.5) {
    randomvx(ix, iy);
  }
}

void scorereset() {
  ballx = width/2; 
  bally = height/2; 
  randomvx(0, 1);
  vy = random(-1, 1);
  timer = 25;
  if (gamemode == gapmode && abs(leftscore - rightscore) < gap) {
    tada.play();
    tada.rewind();
  } else if (gamemode == summode && leftscore+rightscore < sum) {
    tada.play();
    tada.rewind();
  } else if (gamemode == timemode && time > 0) {
    tada.play();
    tada.rewind();
  } else if (gamemode == reachmode && leftscore < reach && rightscore < reach) {
    tada.play();
    tada.rewind();
  }
}
