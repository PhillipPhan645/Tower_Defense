//This function draws the INTRO screen.
void intro() {
  introback.show();
  startbutton();
  title();
}

void startbutton() {
  //show button
  start.show();
  //click button
  if (start.clicked) {
    mode = MAPSELECT;
  }
}

void title() {
  //title
  textFont(karash);
  fill(white);
  textSize(150);

  //blink text
  counter = counter + 1;
  if (counter < 10) {
    fill(black);
    text("Castle Defence", width/2, height/10);
  }
  if (counter > 10) {
    fill(white);
    text("Castle Defence", width/2, height/10);
  }
  if (counter == 20) counter = 0;
}
