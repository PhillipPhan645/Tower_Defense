//This function draws the GAMEOVER screen.
void gameOver() {
  gameovermap.resize(width, height);
  image(gameovermap, width/2, height/2);
  retry.show();
  fill(white);
  textSize(100);
  text("GameOver", width/2, 100);

  textFont(kids);
  textSize(50);
  fill(green);
  text("You Reached Wave  " + wavecount + " !!!", width/2, 200);
  if (retry.clicked) {
    reset();
  }
}

void reset() {
setup();
alive = false;
}
