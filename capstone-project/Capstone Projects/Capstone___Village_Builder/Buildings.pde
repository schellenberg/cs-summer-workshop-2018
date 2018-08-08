class Buildings { // all the buildings and what is needed to make them work
  //prop
  int life, toMuchLife; // life is for the user choice, toMuchLife is when the user tries to put more building on screen then 5 of 1 kind
  boolean houseT, parkT, farmT, shopT, words, houseWords, parkWords, farmWords, storeWords;
  int choice = 4; // 1 = house, 2 = park, 3 = farm, 4 = shop, 0 = place holder
  
  int[] first = new int[4];
  int[] second = new int[4];
  int[] third = new int[4];
  int[] forth = new int[4];

  int[] allOk = new int[5];
  int allHouse = 0;
  int allPark = 0;
  int allFarm = 0;
  int allStore = 0;

  int tempHouse = 0;
  int tempPark = 0;
  int tempFarm = 0;
  int tempStore = 0;

  float houseAngle = 0;
  float parkAngle = 0;
  float farmAngle = 0;
  float shopAngle = 0;

  PShape base = loadShape("doner.obj"); //Bottom platform
  PShape houser = loadShape("Parthouser.obj"); //the house note, these are really big, if have time make smaller when i used scale on obj everything went bad
  PShape farmer = loadShape("Partfarmer.obj"); // the farm
  PShape parker = loadShape("parker.obj"); // the park/forest looking thing note, need to rotateY(radians(180)) for it to be displayed correctly
  PShape storer = loadShape("PartStore.obj"); // the store

  //con
  void Building() {
  }
  
   int touch() { // pick what to put down

    if (life == 0) { 
      words = false;
      houseT = false;
      parkT = false;
      farmT = false;
      shopT = false;
    }

    if (mouseX > 0 && mouseX < width/4 && mouseY > 0 && mouseY < height/6 && words == false) {// house choser
      choice = 1;
      words = true;
      houseT = true;
      life = 55;
    }

    if (mouseX > width/4 && mouseX < width/2 && mouseY > 0 && mouseY < height/6 && words == false) { // parks choser
      choice = 2;
      words = true;
      parkT = true;
      life = 55;
    }

    if (mouseX > width/2 && mouseX < (width/4) + (width/2) && mouseY > 0 && mouseY < height/6 && words == false) { // farm choser
      choice = 3;
      words = true;
      farmT = true;
      life = 55;
    }

    if (mouseX > (width/2)+(width/4) && mouseY < width && mouseY > 0 && mouseY < height/6 && words == false) { // store choser
      choice = 4;
      words = true;
      shopT = true; 
      life = 55;
    }

    if (houseT == true && life >= 1) {
      text("House", width/2, 150);
      if (life > 0 && frameCount%2 == 0) life-= 1;
    }

    if (parkT == true && life >= 1) {
      text("Park", width/2, 150);
      if (life >0 && frameCount%2 == 0) life-= 1;
    }

    if (farmT == true && life >= 1) {
      text("Farm", width/2, 150);
      if (life >0 && frameCount%2 == 0) life-= 1;
    }

    if (shopT == true && life >= 1) {
      text("Shop", width/2, 150);
      if (life >0 && frameCount%2 == 0) life-= 1;
    }
    return life;
  }

  void display() { // The the OBJ stuff
    // rotating rollover at the top of the screen
    if (toMuchLife > 0) {
      text("To many of those building, try another", 275, 200);
      if (frameCount % 2 == 0)toMuchLife -= 1;
    }

    if (mouseX > 0 && mouseX < width/4 && mouseY > 0 && mouseY < height/6) { // House 
      houseAngle += 0.02;
    }
    pushMatrix();
    scale(0.6);
    translate(210, 200, 100);
    rotateX(radians(-24));
    rotateX(radians(180));
    rotateZ(PI);
    rotateY((42+houseAngle));
    shape(houser);
    scale(1);
    popMatrix();

    if (mouseX > width/4 && mouseX < width/2 && mouseY > 0 && mouseY < height/6) { // park
      parkAngle += 0.02;
    }
    pushMatrix();
    shapeMode(CENTER);
    scale(0.7);
    translate(425, 145, 80);
    rotateZ(radians(20));
    rotateX(radians(-50));
    rotateX(radians(180));
    rotateZ(PI);
    rotateY((42+parkAngle));
    shape(parker);
    scale(1);
    shapeMode(LEFT);
    popMatrix();

    if (mouseX > width/2 && mouseX < (width/4) + (width/2) && mouseY > 0 && mouseY < height/6) { // farms
      farmAngle += 0.02;
    }
    pushMatrix();
    scale(0.7);
    translate(660, 150, 100);
    rotateX(radians(-44));
    rotateX(radians(180));
    rotateZ(PI);
    rotateY((42+farmAngle));
    shape(farmer);
    scale(1);
    popMatrix();

    if (mouseX > (width/2)+(width/4) && mouseY < width && mouseY > 0 && mouseY < height/6) { // shops
      shopAngle += 0.02;
    }
    pushMatrix();
    scale(0.7);
    translate(900, 160, 100);
    rotateX(radians(-24));
    rotateX(radians(-20));
    rotateX(radians(180));
    rotateZ(PI);
    rotateY((42+shopAngle));
    shape(storer);
    scale(1);
    popMatrix();

    // the loops for putting things on the base plate
    pushMatrix();  // this is the base plate
    translate(width-30, height/2);

    rotateX(radians(-24));
    rotateY(radians(42));

    shape(base);
    popMatrix();

    for (int i = 0; i < 4; i++) { // Back row
      pushMatrix();
      if (i == 0)translate(width-308, (height/2)-110, -205);
      else if (i == 1)translate(width-230, (height/2)-70, -120);
      else if (i == 2)translate(width-140, (height/2)-36, -80);
      else if (i == 3) translate(width-60, (height/2)+2); 
      rotateX(radians(-24));
      rotateY(radians(42));
      
      if (forth[i] == 1) {
        tempHouse += 1;
        shape(houser);
      } else if (forth[i] == 2) {
        tempPark += 1;
        rotateY(radians(180));
        shape(parker);
      } else if (forth[i] == 3) {
        tempFarm += 1;
        shape(farmer);
      } else if (forth[i] == 4) {
        tempStore += 1;
        shape(storer);
      }

      popMatrix();
    }

    for (int i = 0; i < 4; i++) { // Back center row
      pushMatrix();
      if (i == 0)translate(width-400, (height/2)-80, -160);
      else if (i == 1)translate(width-318, (height/2)-43, -90);
      else if (i == 2)translate(width-237, (height/2)-5, -10);
      else if (i == 3) translate(width-150, (height/2)+31, 70);
      rotateX(radians(-24));
      rotateY(radians(42));
      
      if (third[i] == 1) {
        tempHouse += 1;
        shape(houser);
      } else if (third[i] == 2) {
        tempPark += 1;
        rotateY(radians(180));
        shape(parker);
      } else if (third[i] == 3) {
        tempFarm += 1;
        shape(farmer);
      } else if (third[i] == 4) {
        tempStore += 1;
        shape(storer);
      }
      popMatrix();
    }


    for (int i = 0; i < 4; i++) { // Front center row
      pushMatrix();
      if (i == 0)translate(width-490, (height/2)-46, -80);
      else if (i == 1)translate(width-413, (height/2)-10, -20);
      else if (i == 2)translate(width-327, (height/2)+28, 72);
      else if (i == 3) translate(width-245, (height/2)+66, 150);
      rotateX(radians(-24));
      rotateY(radians(42));
      
      if (second[i] == 1) {
        tempHouse += 1;
        shape(houser);
      } else if (second[i] == 2) {
        tempPark += 1;
        rotateY(radians(180));
        shape(parker);
      } else if (second[i] == 3) {
        tempFarm += 1;
        shape(farmer);
      } else if (second[i] == 4) {
        tempStore += 1;
        shape(storer);
      }
      popMatrix();
    }

    for (int i = 0; i < 4; i++) { // Front row
      pushMatrix();
      if (i == 0)translate(width-578, (height/2)-12, 0);
      else if (i == 1)translate(width-504, (height/2)+26, 60);
      else if (i == 2)translate(width-418, (height/2)+61, 153);
      else if (i == 3) translate(width-338, (height/2)+101, 230);
      rotateX(radians(-24));
      rotateY(radians(42));
      
      if (first[i] == 1) {
        tempHouse += 1;
        shape(houser);
      } else if (first[i] == 2) {
        tempPark += 1;
        rotateY(radians(180));
        shape(parker);
      } else if (first[i] == 3) {
        tempFarm += 1;
        shape(farmer);
      } else if (first[i] == 4) {
        tempStore += 1;
        shape(storer);
      }
      popMatrix();
    }
    
    //The valuse that will be returned
    allHouse = tempHouse;
    allPark = tempPark;
    allFarm = tempFarm;
    allStore = tempStore;

    //The number count of each building to see if there is to much of one building
    allOk[1] = tempHouse;
    allOk[2] = tempPark;
    allOk[3] = tempFarm;
    allOk[4] = tempStore;

    tempHouse = 0;
    tempPark = 0;
    tempFarm = 0;
    tempStore = 0;
  }

  int houseLook() {
    return allHouse;
  }
  int parkLook() {
    return allPark;
  }
  int farmLook() {
    return allFarm;
  }
  int storeLook() {
    return allStore;
  }

  void choices() { // The putting down of the buildings
    println(mouseX, mouseY);
    // First row
    if (mouseX >= 252 && mouseX <= 430 && mouseY >= 479 && mouseY <= 592 && mousePressed && choice != 0) {
      if (allOk[choice] < 5)first[3] = choice;
      else toMuchLife = 55;
    } else if (mouseX >= 166 && mouseX <= 313 && mouseY >= 419 && mouseY <= 496 && mousePressed && choice != 0) {
      if (allOk[choice] < 5)first[2] = choice;
      else toMuchLife = 55;
    } else if (mouseX >= 106 && mouseX <= 227 && mouseY >= 376 && mouseY <= 432 && mousePressed && choice != 0) {
      if (allOk[choice] < 5)first[1] = choice;
      else toMuchLife = 55;
    } else if (mouseX >= 60 && mouseX <= 166 && mouseY >= 342 && mouseY <= 386 && mousePressed && choice != 0) {
      if (allOk[choice] < 5)first[0] = choice;
      else toMuchLife = 55;
    }
    // Second row
    else if (mouseX >= 389 && mouseX <= 544 && mouseY >= 422 && mouseY <= 503 && mousePressed && choice != 0) {
      if (allOk[choice] < 5)second[3] = choice;
      else toMuchLife = 55;
    } else if (mouseX >= 297 && mouseX <= 427 && mouseY >= 379 && mouseY <= 438 && mousePressed && choice != 0) {
      if (allOk[choice] < 5)second[2] = choice;
      else toMuchLife = 55;
    } else if (mouseX >= 227 && mouseX <= 338 && mouseY >= 345 && mouseY <= 390 && mousePressed && choice != 0) { 
      if (allOk[choice] < 5)second[1] = choice;
      else toMuchLife = 55;
    } else if (mouseX >= 171 && mouseX <= 267 && mouseY >= 318 && mouseY <= 351 && mousePressed && choice != 0) {
      if (allOk[choice] < 5)second[0] = choice;
      else toMuchLife = 55;
    }
    // Third row 
    else if (mouseX >= 493 && mouseX <= 626 && mouseY >= 384 && mouseY <= 443 && mousePressed && choice != 0) {
      if (allOk[choice] < 5)third[3] = choice;
      else toMuchLife = 55;
    } else if (mouseX >=396 && mouseX <= 509 && mouseY >= 349 && mouseY <= 392 && mousePressed && choice != 0) {
      if (allOk[choice] < 5)third[2] = choice;
      else toMuchLife = 55;
    } else if (mouseX >= 322 && mouseX <= 419 && mouseY >= 321 && mouseY <= 355 && mousePressed && choice != 0) {
      if (allOk[choice] < 5)third[1] = choice;
      else toMuchLife = 55;
    } else if (mouseX >= 265 && mouseX <= 350 && mouseY >= 298 && mouseY <= 326 && mousePressed && choice != 0) {
      if (allOk[choice] < 5)third[0] = choice;
      else toMuchLife = 55;
    }
    // Forth row 
    else if (mouseX >= 572 && mouseX <= 687 && mouseY >= 352 && mouseY <= 397 && mousePressed && choice != 0) {
      if (allOk[choice] < 5)forth[3] = choice;
      else toMuchLife = 55;
    } else if (mouseX >= 477 && mouseX <= 575 && mouseY >= 323 && mouseY <= 358 && mousePressed && choice != 0) {
      if (allOk[choice] < 5)forth[2] = choice;
      else toMuchLife = 55;
    } else if (mouseX >= 403 && mouseX <= 487 && mouseY >= 300 && mouseY <= 329 && mousePressed && choice != 0) {
      if (allOk[choice] < 5)forth[1] = choice;
      else toMuchLife = 55;
    } else if (mouseX >= 339 && mouseX <= 417 && mouseY >= 282 && mouseY <= 304 && mousePressed && choice != 0) {
      if (allOk[choice] < 5)forth[0] = choice;
      else toMuchLife = 55;
    }
  }
}