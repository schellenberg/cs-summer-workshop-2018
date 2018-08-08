class Levels {

  //class variables
  int level;
  int deaths = 0;
  int endframe = 0;

  //class constructor
  Levels(int level_) {//hopefully this is getting called once per level, to change between the levels.
    level = level_;
  }

  //class functions
  void intro() {
    if (level == 0) {
      if (frameCount < 180) image(introScene[0], width/2, height/2);
      if ((frameCount > 179) && (frameCount < 360))image(introScene[1], width/2, height/2);
      if ((frameCount > 359)&&(frameCount < 540))image(introScene[2], width/2, height/2);
      if ((frameCount > 539)&&(frameCount < 720))image(introScene[3], width/2, height/2);
      if ((frameCount > 719) &&(frameCount < 900))image(introScene[4], width/2, height/2);
      if ((frameCount > 899) && (frameCount < 1080))image(introScene[5], width/2, height/2);
      if ((frameCount > 1079) && (frameCount < 1260))image(introScene[6], width/2, height/2);

      //println("changed level");
      if (frameCount > 1260)level =1;
    }
  }

  void outro() {
    if (level == 18) {
      v.location.x = 2000;
      if (endframe==0)endframe = frameCount;
      if (frameCount - endframe < 180) image(outroScene[0], width/2, height/2);
      if ((frameCount - endframe > 179) && (frameCount - endframe < 360))image(outroScene[1], width/2, height/2);
      if ((frameCount - endframe > 359)&&(frameCount - endframe < 540))image(outroScene[2], width/2, height/2);
      if ((frameCount - endframe > 539)&&(frameCount - endframe < 720)){
        image(outroScene[3], width/2, height/2);
        text(l.deaths, 810, 293);
      }
      if ((frameCount - endframe > 719) &&(frameCount - endframe < 900000000))image(outroScene[4], width/2, height/2);
    }
  }

  void fillArray(int level) {
    //for each level, we first set how many lavas/platforms are in the level.
    //next, set the fill colour for lava/platforms
    //call our platform/lava function for each, with the coordinates of each level.  
    if (level == 1) {
      p.position = 0;
    } 

    if (level == 2) {
      lavalist.add(new Lava(500, 600));
    }

    if (level == 3) {
      lavalist.add(new Lava(300, 300));
      lavalist.add(new Lava(1000, 300));
    }

    if (level == 4) {
      lavalist.add(new Lava(300, 400));
      lavalist.add(new Lava(900, 400));
    }

    if (level == 5) {
      lavalist.add(new Lava(300, 450));
      lavalist.add(new Lava(850, 450));
    }

    if (level == 6) {
      lavalist.add(new Lava(300, 1000));
      platformlist.add(new Platform(700, 600, 200, 100));
    }

    if (level == 7) {
      p.position = 3;
      lavalist.add(new Lava(200, 1600));
      platformlist.add(new Platform(700, 600, 200, 100));
      platformlist.add(new Platform(1400, 300, 200, 100));
    }

    if (level == 8) {
      p.position = 1;
      lavalist.add(new Lava(200, 1600));
      platformlist.add(new Platform(750, 400, 100, 50));
      platformlist.add(new Platform(1400, 600, 200, 100));
      platformlist.add(new Platform(0, 550, 200, 100));
    }

    if (level == 9) {
      p.position = 1;
      lavalist.add(new Lava(200, 1600));
      platformlist.add(new Platform(750, 750, 50, 10));
    }

    if (level == 10) {
      p.position = 3;
      lavalist.add(new Lava(200, 1600));
      platformlist.add(new Platform(640, 490, 2, 2));
      platformlist.add(new Platform(1450, 450, 150, 10));
    }

    if (level == 11) {
      p.position = 3;
      lavalist.add(new Lava(200, 1600));
      platformlist.add(new Platform(650, 400, 50, 10));
      platformlist.add(new Platform(100, 550, 20, 10));
    }

    if (level == 12) {
      p.position = 3;
      lavalist.add(new Lava(200, 1600));
      platformlist.add(new Platform(600, 600, 100, 10));
      platformlist.add(new Platform(400, 400, 100, 10));
      platformlist.add(new Platform(1000, 200, 100, 10));
    }

    if (level == 13) {
      p.position = 3;
      lavalist.add(new Lava(200, 1600));
      platformlist.add(new Platform(500, 700, 100, 10));
      platformlist.add(new Platform(1500, 700, 100, 10));
      platformlist.add(new Platform(1400, 400, 100, 10));
    }

    if (level == 14) {
      p.position = 3;
      lavalist.add(new Lava(200, 1600));
      platformlist.add(new Platform(1350, 325, 30, 10));
      platformlist.add(new Platform(500, 500, 30, 10));
    }

    if (level == 15) {
      p.position = 2;
      lavalist.add(new Lava(200, 1600));
      platformlist.add(new Platform(300, 600, 30, 10));
      platformlist.add(new Platform(400, 400, 30, 10));
      platformlist.add(new Platform(500, 200, 30, 10));
    }

    if (level == 16) {
      p.position = 0;
      lavalist.add(new Lava(200, 1600));
      platformlist.add(new Platform(50, 600, 100, 10));
      platformlist.add(new Platform(50, 550, 100, 10));
      platformlist.add(new Platform(50, 500, 100, 10));
      platformlist.add(new Platform(50, 450, 100, 10));
      platformlist.add(new Platform(50, 400, 100, 10));
      platformlist.add(new Platform(50, 350, 100, 10));
      platformlist.add(new Platform(50, 300, 100, 10));
      platformlist.add(new Platform(50, 250, 100, 10));
      platformlist.add(new Platform(50, 200, 100, 10));
      platformlist.add(new Platform(50, 150, 100, 10));
      platformlist.add(new Platform(50, 100, 100, 10));
      platformlist.add(new Platform(50, 50, 1450, 10));
    }

    if (level == 17) {
      p.position = 0;
      lavalist.add(new Lava(200, 1600));
      platformlist.add(new Platform(50, 600, 100, 10));
      platformlist.add(new Platform(50, 400, 1400, 10));
      platformlist.add(new Platform(1200, 575, 375, 10));
    }
  }
}