//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  float x, y, vx, vy, d;
  int hp, maxhp;
  int value;
  color fillcolor, strokecolor;
  float speed;
  Mob(float _x, float _y, float _vx, float _vy) {
    x= _x;
    y= _y;
    vx= _vx;
    vy= _vy;
    hp=1;
    d=40;
    strokecolor= linen;
    fillcolor=dgreen;
    speed=1;
  }


  void show() {
    stroke(strokecolor);
    fill(fillcolor);
    circle(x, y, d);
    //image(bluemob, x, y, 70, 50);
  }

  void act() {
    x+=vx*speed;
    y+=vy*speed;

    int i=0;
    while (i<nodes.length) {
      if (dist(nodes[i].x, nodes[i].y, x, y)<4) {
        vx= nodes[i].dx;
        vy= nodes[i].dy;
      }
      i++;
    }

    //collision
    i=0;
    while (i<bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y)< d/2 + myBullet.d/2) {
        hp--;
        myBullet.lives--;
       gcounter++;
        score++;
        collectcoin.play();
      }
      i++;
    }

    if (x>900) {
      lives--;
    }

    if (lives==0) {
      mode=GAMEOVER;
    }
  }
}



//ask about sniper class and building mode
//if timer <10 then mobs.hp--; and timer ==100;
