class Chonkymob extends Mob {
  Chonkymob(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d=80;
    maxhp= 10 + wcounter;
    hp= maxhp;
    value =5;
    fillcolor= blue;
    strokecolor=ablack;
    speed= 0.5;
  }
}
