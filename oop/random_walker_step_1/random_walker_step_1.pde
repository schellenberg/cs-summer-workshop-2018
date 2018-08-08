// Object-Oriented Programming
// Random Walker Example
// Stefan Scott
// CS Workshop August 2018
//
// Part One: Simple Objects

Walker a,b;

void setup(){
  //Setup Function runs one time. Objects can't be instantiated before this point in the program.
  size(600,400);
  a = new Walker(200,200,color(255,0,255));
  b = new Walker(400,100,color(0,0,255));
}

void draw(){
  //Draw is an infinitely looping function. Default is 60 times per second. Each time through draw(), 
  //move and display object a and object b. We access those class methods using the dot operator.
  
  a.move();
  a.display();
  
  b.move();
  b.display();
  
}