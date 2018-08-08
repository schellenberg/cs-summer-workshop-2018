// Object-Oriented Programming
// Random Walker Example
// Stefan Scott
// CS Workshop August 2018
// 
// Part Three: 3D Extension

Walker[] walkers = new Walker[100];

void setup(){
  size(600,400,P3D);
  for (int i = 0; i < walkers.length; i++){
    walkers[i] = new Walker(random(width),random(height),random(200),color(int(random(255)),int(random(255)),int(random(255))));
  } 
}

void draw(){
  lights();   //turns on default lighting/shadows for the current frame
  for (int i = 0; i < walkers.length; i++){  //for each object, move and display
    walkers[i].move();
    walkers[i].display();
  } 
  
}