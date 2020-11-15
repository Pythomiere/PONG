void gameover() {
  noStroke();
  pauseeverything();
  tada.play();
  fill(0, 0, 0, 80);
  rect(width/2, height/2, width, height);
  textSize(80);
    fill(productred);
  text(leftscore, width/4+5, height/5);
  fill(deepnavy);
  text(rightscore, 3*width/4-5, height/5);
  fill(dimgrey);
  text(":" , width/2, height/5 - 3);
  textSize(200);
  if (leftscore > rightscore) {
    fill(productred);
    text("wins!", width/2, height*2/3);
    text("LEFT", width/2, height/3);
  } else if (leftscore < rightscore) {
    fill(deepnavy);
    text("wins!", width/2, height*2/3);
    text("RIGHT", width/2, height/3);
  } else {
    fill(255);
    text("DRAW!", width/2, height/2);
  }

  // quit button
  if (mouseX < width/2+50 && mouseX > width/2-50 && mouseY < height*6/7+25 && mouseY > height*6/7-25) {
    fill(#8C8C8C);
  } else {
    fill(#717171);
  }
  strokeWeight(3);
  stroke(0);
  rect(width/2, height*7/8, 100, 50, 20);
  fill(0);
  textSize(30);
  text("Quit", width/2, height*7/8-3);
}

void gameoverClicks() {
  if (mouseX < width/2+50 && mouseX > width/2-50 && mouseY < height*7/8+25 && mouseY > height*7/8-25) {
    exit();
  } else {
    mode = intro;
  }
}

void pauseeverything() {
  rushtheme.pause();
  normaltheme.pause();
  vx = 0; 
  vy = 0;
}
