//This function draws the PLAY screen

void play() {
  drawmap();
  animatethings();
  drawplayerinterface();
  handleclicks();
  textSize(20);
  text(mouseX +", " + mouseY, mouseX, mouseY-20);
}

void drawmap() {
  imageMode(CENTER);
  image(selectedmap, 400, 320);
}

void animatethings() {
  int i=0;

  while (i<mobs.size()) {
    Mob myMob= mobs.get(i);
    myMob.show();
    myMob.act();
    if (myMob.hp<=0) {
      mobs.remove(i);
    } else {
      i++;
    }
  }

  i=0;
  while (i<towers.size()) {
    Tower mytower= towers.get(i);
    if (mobs.size()>0) mytower.act();
    mytower.show();
    i++;
  }

  i=0;
  while (i<bullets.size()) {
    Bullet mybullet= bullets.get(i);
    mybullet.show();
    mybullet.act();

    if (mybullet.lives<=0) {
      bullets.remove(i);
    } else {
      i++;
    }
  }
}

void drawplayerinterface() {
  fill(green);
  rect(1000, 200, 400, 1000);
  fill(white);
  textSize(10);
  text("NextWave: "+wcounter, 900, 30);
 
  if (selectedmap==mappy1) {
    fill(dgreen);
    text("LIVES: "+lives, width/2, 50);
   // text("SCORE: "+score, 100, 50);
  }

  if (selectedmap==mapy2) {
    fill(linen);
    text("LIVES: "+lives, width/2, 50);
   // text("SCORE: "+score, 100, 50);
  }


  rect.show();
  wave.show();
  build.show();
  //cash.show();
}

void handleclicks() {
  if (wave.clicked && mobs.size()<1) {
    wcounter++;
    addwave();
  }

  if (build.clicked) {
    mode=BUILD;
  }
}

void addwave() {
  int i=0;
  int x=0;
  while (mobs.size()<wcounter-1) {
    mobs.add(new Mob(x, 400, 1, 0));
    x=x-50;
  }

  if (wcounter % 3==0) {
    i=0;
    x=50;
    while (i< wcounter/3) {
      mobs.add(new Chonkymob(x, 400, 0.5, 0));
      x=x-100;
      i++;
    }
  }

  if (wcounter % 4==0) {
    i=0;
    x=50;
    while (i< wcounter/4) {
      mobs.add(new speedymob(x, 400, 4, 0));
      x=x-50;
      i++;
    }
  }
}


//make the coin adding individual
//sniper and image adjust
// finish doing the maps getting it on the option screen done
//maps variable contains 2 kinds of maps. 1 and 2 if 1 clicked set selectmaps 1 OR make the maps button and
//if the x coordinate is less than waveno them draw mobs if no is 1 draw 1 if its 2 draw 1
//build gameover mode
//if mob reaches end of screen gameover/lives--;
//if you kill a mob cash++
//if gun.clicked then cash --;
//if cash is above 5 can build towers if not can't
//get the next wave button working
//if the wave button is getting clicked then increase the amount of mobs by 1

//to do

//1 add new mobs almost done speedy mob is acting up update dunzo
//2 add towers   nxt task
//3 add new maps
