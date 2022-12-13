//This function draws the INTRO screen.

void intro() {

  introgif.show();
  startthegamegif.show();
  start.show();
  selectmap.show();
  fill(white);
  textSize(tsize);
  text("DEFEND THY TOWER", width/2, 300);

tsize++;
if(tsize==50){
  tsize--;
}else if(tsize<30){
  tsize++;
}
  if (start.clicked) {
    mode=PLAY;
  }

  if (selectmap.clicked) {
    mode= OPTIONS;
  }
}
