// Object-Oriented Programming
// Random Walker Example
// Stefan Scott
// CS Workshop August 2018
//
// Part Two: Making and Using Many Objects

Walker[] walkers = new Walker[40];

void setup(){
  size(600,400);
  background(0);
  noStroke();
  for (int i = 0; i < walkers.length; i++){
    walkers[i] = new Walker(random(width),random(height),color(int(random(255)),int(random(255)),int(random(255)),200));
  } 
}

void draw(){
  //each time through draw, loop through all of the Walker Objects. Move and Display each one.
  for (int i = 0; i < walkers.length; i++){
    walkers[i].move();
    walkers[i].display();
  } 
  
}