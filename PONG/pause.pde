void pausescreen() {
  normaltheme.pause();
  rushtheme.pause();
  fill(dimgrey);
  circle(width/2, height/2, 150);
  fill(0, 0, 0, 15);
  rect(width/2, height/2, width, height);
  image(PLAY, width/2+1, height/2, 150, 150);
  if (pauseswitch == false ) {
    mode = game;
  }
  fill(dimgrey);
  rect(width/2, height*2/3, 100, 50, 20);
  fill(#717171);
  textSize(30);
  text("Back", width/2, height*2/3-4);
  fill(dimgrey);
  rect(width/2, height*3/4, 100, 50, 20);
  fill(#717171);
  textSize(30);
  text("Quit", width/2, height*3/4-4);
}

void pauseClicks() {
  if (dist(width/2, height/2, mouseX, mouseY) <= 75) {
    pauseswitch = !pauseswitch;
  } else if (mouseX < width/2+50 && mouseX > width/2-50 && mouseY < height*2/3+25 && mouseY > height*2/3-25) {
    pauseswitch = !pauseswitch;
    mode = intro;
  } else if (mouseX < width/2+50 && mouseX > width/2-50 && mouseY < height*3/4+25 && mouseY > height*3/4-25) {
    exit();
  }
}
