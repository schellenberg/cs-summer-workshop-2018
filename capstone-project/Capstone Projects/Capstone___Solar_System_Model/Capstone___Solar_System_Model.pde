//Computer Science 30
//Solar System Model
//Library to Install:  PeasyCam

//This program creates a realistic model of the Sun and four inner planets, Mercury,
// Venus, Earth, and Mars.  The user can change the camera position by clicking and
// draging the mouse and scrolling.  To do this, the user must have the PeasyCam asset
// which can  be found under the 3D section.

import peasy.*;
PeasyCam cam;

void setup() {
  size(1080, 800, P3D);
  sphereDetail(10);
  stroke(1);
  cam = new PeasyCam(this, 500);
  state = cam.getState();
  frameRate(480);
}

float AU = (1.496 * pow(10, 2) * 13.4); // million km (2992)
float G = 0.4; // meters cubed / kilogram / second squared

//Sun variables
PVector SLoc = new PVector(width/2, height/2, 0);
PVector SVel = new PVector(7.189 * pow(10, 3), 0, 0); // km/s
PVector SRotation = new PVector(0, 0.01997, 0);
float SRadius = 695508/5000; // km  The sun is 50 times smaller relative to the other planets 
float SMass = 1.989 * 8; // kg
color SCol = color(245, 245, 40);
float StoSDist = 0;
boolean SMoon = false;

//Mercury variables
float MeRadius = 2440/100; //The other objects are 100 times smaller than actual size
float MeMass = 3.285 * 2;
color MeCol = color(183, 183, 183);
float MetoSDist = 0.39 * AU;
PVector MeLoc = new PVector(0, 0, SLoc.z + MetoSDist);
PVector MeOrbitVel = new PVector(4.7, 0, 0);
PVector MeRotation = new PVector(0, 0.1);
boolean MeMoon = false;

//Venus variables
float VRadius = 6052/100;
float VMass = 4.867 * 2;
color VCol = color(183, 117, 35);
float VtoSDist = 0.72 * AU;
PVector VLoc = new PVector(0, 0, SLoc.z + VtoSDist);
PVector VOrbitVel = new PVector(3.5, 0, 0);
PVector VRotation = new PVector(0, -0.65, 0);
boolean VMoon = false;

//Earth variables
float ERadius = 6371/100; // km
float EMass = 5.972 * 2; // kg
color ECol = color(0, 0, 255);
float EtoSDist = AU;
PVector ELoc = new PVector(0, 0, SLoc.z + EtoSDist);
PVector EOrbitVel = new PVector(3.0, 0, 0); // km / sec
PVector ERotation = new PVector(0, 0.46, 0); // km / sec
boolean EMoon = true;

//Mars variables
float MaRadius = 3390/100; // km
float MaMass = 6.39 * 2; // kg
color MaCol = color(210, 130, 80);
float MatoSDist = 1.60 * AU;
PVector MaLoc = new PVector(0, 0, SLoc.z + MatoSDist);
PVector MaOrbitVel = new PVector(2.4, 0, 0); // km / sec
PVector MaRotation = new PVector(0, 0.24, 0); // km / sec
boolean MaMoon = false;

Planet sun = new Planet(SRadius, SMass, SLoc, SVel, SRotation, StoSDist, SCol, SMoon);
Planet mercury = new Planet(MeRadius, MeMass, MeLoc, MeOrbitVel, MeRotation, MetoSDist, MeCol, MeMoon);
Planet venus = new Planet(VRadius, VMass, VLoc, VOrbitVel, VRotation, VtoSDist, VCol, VMoon);
Planet earth = new Planet(ERadius, EMass, ELoc, EOrbitVel, ERotation, EtoSDist, ECol, EMoon);
Planet mars = new Planet(MaRadius, MaMass, MaLoc, MaOrbitVel, MaRotation, MatoSDist, MaCol, MaMoon);

//
// '1' save current camera-state
// '2' apply saved camera-state
//


void draw() {
  rotateX(-.5f);
  rotateY(-.5f);
  background(0);
  drawPlanets();
}

void drawPlanets(){
  //display all planets
  sun.display();
  mercury.display();
  venus.display();
  earth.display();
  mars.display();
  
  //apply the force of the sun on all other objects
  PVector sunForce = sun.attract(mercury, 5.0, 12.0);
  mercury.applyForce(sunForce);
  mercury.update();
  
  sunForce = sun.attract(venus, 10.0, 25.0);
  venus.applyForce(sunForce);
  venus.update();
  
  sunForce = sun.attract(earth, 25.0, 35.0);
  earth.applyForce(sunForce);
  earth.update();
  
  sunForce = sun.attract(mars, 40.0, 50.0);
  mars.applyForce(sunForce);
  mars.update();
}

CameraState state;

void keyReleased() {
  if (key == '1') state = cam.getState();
  if (key == '2') cam.setState(state, 1000);
  if (key == ' ') background(0);
}