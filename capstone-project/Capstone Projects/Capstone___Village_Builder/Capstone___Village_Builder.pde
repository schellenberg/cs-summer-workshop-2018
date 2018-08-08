// Capstone Project Build a Village
// This program was created for the final project for CS30, this program lets the user build a village with original 3D assets 
//
// Library needed: interfascia
//
import interfascia.*;

IFTextField t; // interfascia stuff
GUIController c;
IFLabel l;

Buildings build;

PFont text;

int show = 0;

PImage house, park, farm, coiner;

void setup() {
  frameRate(45); // Don't know how taxing the OBJ's are so I'm lowering the frame rate to help processing out just incase
 
  size(750, 750, P3D);

  build = new Buildings();
  
 //the little images repersenting the things on screen 
  coiner = loadImage("coiner.png");
  farm = loadImage("farms.png");
  house = loadImage("simple-black-house-hi.png");
  park = loadImage("park.png");
  
  // interfascia stuff don't know what or how they do stuff their website and
  //github don't say
  t = new IFTextField("", 25, height-46, 150);
  c = new GUIController(this);
  l = new IFLabel("", 25, 70);

  text = createFont("Abodearabic-Regular", 14, true);

  c.add(t); // more interfascia stuff
  t.addActionListener(this);
}

void draw() {
  background(135, 206, 235);
  if (show != 0) show = build.touch(); // if show or life in building != 0 the words will show for the last picked building
  
  build.display();
  
  // changer/top tool bar
  fill(210, 105, 30); // 160,82,45
  rect(0, 0, width/4, height/6);
  fill(0);
  text("House", width/8-20, 25); //House box

  fill(50, 205, 50);
  rect(width/4, 0, width/4, height/6);
  fill(0);
  text("Park", (width/2)-(width/8)-20, 25); // Park box

  fill(218, 165, 32);
  rect(width/2, 0, width/4, height/6);
  fill(0);
  text("Farm", (width/2)+(width/8)-20, 25); // Farm box

  fill(65, 105, 225); // 135,206,250
  rect(width-(width/4), 0, width/4, height/6);
  fill(0);
  text("Shop", width-(width/8)-20, 25); // Shop box

  // Lower information bar
  fill(147, 112, 219);
  rect(0, height-75, height, 75);
  fill(0);
  text("You have " + build.houseLook() +" houses", 200, height-46);
  text("You have " + build.parkLook() +" parks", 320, height-46);
  text("You have " + build.farmLook() +" farms", 440, height-46);
  text("You have " + build.storeLook() +" shops", 560, height-46);

  //puts little pics for how many things of something are on the screen
  for (int h = 0; h < 5; h++) { // House
    if (h < build.houseLook()) {
      pushMatrix();
      scale(0.03);
      image(house, 6500+(h*800), height*31.5);
      popMatrix();
    }
  }
  for (int p = 0; p < 5; p++) { // Parks 
    if (p < build.parkLook()) {
      pushMatrix();
      scale(0.03);
      image(park, 10500+(p*800), height*31.5);
      popMatrix();
    }
  }
  for (int f = 0; f < 5; f++) { // farms
    if (f < build.farmLook()) {
      pushMatrix();
      scale(0.03);
      image(farm, 14500+(f*800), height*31.5);
      popMatrix();
    }
  }
  for (int s = 0; s < 5; s++) { // Shops
    if (s < build.storeLook()) {
      pushMatrix();
      scale(0.03);
      image(coiner, 18700+(s*800), height*31.5);
      popMatrix();
    }
  }
}

void actionPerformed(GUIEvent e) { // This is the text box at the lower left corner. note can't backspace 
  if (e.getMessage().equals("Completed")) {
    l.setLabel(t.getValue());
  }
}

void mousePressed() { // This is for the top four boxes
  if(mouseY < height/6){
  show = build.touch();}
  else{
   build.choices(); 
  }
}