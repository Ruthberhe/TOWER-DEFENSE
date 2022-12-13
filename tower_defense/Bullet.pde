//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.

class Bullet {

  float x, y, vx, vy, d;
  int lives;
  Bullet (float _x, float _y, float _vx, float _vy) {
    x= _x;
    y= _y;
    vx= _vx; 
    vy= _vy;
    lives=1;
    d=15;
  }

  void show() {
    stroke(ablack);
    fill(linen);
    circle(x, y, d);
  }

  void act() {
    x+=vx;
    y+=vy;
  }
}
