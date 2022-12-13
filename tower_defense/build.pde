//This function draws the BUILD screen

void build() {
  drawmap();
  animatethings();
  SIGN();
  drawinterface();
  handleBuildClicks();
}

void drawinterface() {
  stroke(white);
  fill(ablack);
  rect(900, height/2, 200, 800);
  play.show();
  gun.show();
  cash.show();
  sniper.show();
  AoE.show();
}

void SIGN() {
  textSize(40);
  text("BUILD MODE", width/2, 100);
  textSize(15);
  text(" "+cashcount, 90, 50);
}

void handleBuildClicks() {
  if (play.clicked) {
    mode=PLAY;
  }

  fill(white);

  image(gold, 870, 250, 30, 30);
  text(""+gcounter, 900, 250);
  if (gun.clicked) {
    towers.add(new Tower(GUN));
    cashcount--;
    gcounter--;
  }

  image(gold, 870, 400, 30, 30);
  text(""+scounter, 900, 400);
  if (sniper.clicked) {
    towers.add(new Tower(SNIPER));
    cashcount-=10;
    scounter-=10;
  }
  image(gold, 870, 550, 30, 30);
  text(""+acounter, 900, 550);
  if (AoE.clicked) {
    towers.add(new Tower(AOE));
    cashcount-=25;
    acounter-=5;
  }
}
