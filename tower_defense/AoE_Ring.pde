//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a
//short period of time.

//class AoE_Ring {
//  float x, y, d;
//  final int PLACING=0;
//  final int PLACED=1;
//  int ringmode;
//  AoE_Ring(float _x, float _y) {
//    x=_x;
//    y=_y;
//    d=100;
//    ringmode=PLACING;
//  }

//  void show() {
//    stroke(ablack);
//    strokeWeight(4);
//    fill(blue, 10);
//    if (ringmode == PLACED) {
//      circle(x, y, d);
//    } else if (ringmode == PLACING) {
//      circle(mouseX, mouseY, d);
//      if (mousePressed) {
//        ringmode= PLACED;
//        x=mouseX;
//        y=mouseY;
//      }
//    }
//  }


//  void act() {
//    if (ringmode==PLACED) {
//      circle(x, y, d);
//      d++;
//    }
//    if (d>200) {
//      d=0;
//    }

//    int i=0;
//    while (i<mobs.size()) {
//      Bullet mymob = bullets.get(i);
//      if (dist(mymob.x, mymob.y, x, y)< d/2 + mymob.d/2) {

//        mymob.lives--;
//        acounter++;
//      }
//    }
//  }
//}
