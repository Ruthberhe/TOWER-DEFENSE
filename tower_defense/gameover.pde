//This function draws the GAMEOVER screen.



void gameOver() {
  background(ablack);
  textSize(tsize);
  text("GAMEOVER", width/2, height/2);
  if (tsize>200) {
    tsize=5;
  }
  tsize++;
  
  if(score>HS){
    HS=score;
  }
  restart.show();
  if(restart.clicked){
    reset();
    mode=INTRO;
  }
}
