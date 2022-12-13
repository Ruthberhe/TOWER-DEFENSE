//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the screen.

class Tower {

  final int PLACING=0;
  final int PLACED=1;
  float x, y;
  int cooldown, threshold;
  int towermode;
  int towertype;
  int d=5;

  Tower(int type) {
    x= mouseX;
    y= mouseY;
    cooldown= 0;

    towermode= PLACING;
    towertype= type;
    if (towertype ==GUN) threshold= 30;
    if (towertype== AOE) threshold= 30;
    if (towertype== SNIPER) threshold= 200;
  }


  void show() {
    //if (towermode == PLACED) {
    //  square(x, y, 40);
    //} else if (towermode == PLACING) {
    //  square(mouseX, mouseY, 40);
    //  if (mousePressed) {
    //    towermode= PLACED;
    //    x= mouseX;
    //    y=mouseY;
    // }
    if (towermode ==PLACING) {
      x= mouseX;
      y=mouseY;
      if (mousePressed && mouseX<900) {
        towermode= PLACED;
        //building=false;
      }
    }
    if (towertype ==GUN) showGunTower();
    if (towertype== AOE) showAoETower();
    if (towertype== SNIPER) showSniperTower();
  }

  void showGunTower() {
    stroke(ablack);
    strokeWeight(4);
    fill(blue);
    square(x, y, 40);
  }


  void showAoETower() {
    stroke(linen);
    strokeWeight(3);
    fill(ablack);
    circle(x, y, 30);
  }

  void showSniperTower() {
    stroke(linen);
    strokeWeight(3);
    fill(ablack);
    circle(x, y, 30);
  }


  void act() {
    if (towermode==PLACED) {
      if (towertype ==GUN) actGunTower();
      if (towertype== AOE) actAoETower();
      if (towertype== SNIPER) actSniperTower();
    }
  }

  void actGunTower() {
    cooldown++;
    if (cooldown>=threshold) {
      cooldown=0;
      bullets.add(new Bullet(x, y, 0, -10));
      bullets.add(new Bullet(x, y, 0, 10));
      bullets.add(new Bullet(x, y, -10, 0));
      bullets.add(new Bullet(x, y, 10, 0));
    }
  }

  void actAoETower() {
    fill(blue, 10);
    circle(x, y, d);
    d++;
    if (d==150) {
      d=5;
    }

    int i=0;
    i=0;
    while (i<mobs.size()) {
      Mob moby =mobs.get(i);
      if (dist(moby.x, moby.y, x, y)< d/2 + moby.d/2) {
        moby.hp--;
        acounter++;
        score+=3;
        collectcoin.play();
      }
      i++;
    }
  }

  void actSniperTower() {
    Mob moby =mobs.get(0);
   
    cooldown++;
    if (cooldown>=threshold) {
      stroke(white);
      line(x, y, moby.x, moby.y);
      square(x, y, 40);
      moby.hp--;
      scounter++;
      score+=5;
      cooldown=0;
    }
  }
}
