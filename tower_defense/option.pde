void options() {
  background(ablack);
  rect1.show();
  rect2.show();
  map1.show();
  map2.show();

  if (map1.clicked) {
    selectedmap=mappy1;
    nodes=map1nodes;
    mode=PLAY;
  }

  if (map2.clicked) {
    selectedmap=mapy2;

    nodes=map2nodes;
    mode=PLAY;
  }
}
