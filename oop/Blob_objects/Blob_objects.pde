// Object-Oriented Programming
// Having objects react to each other
// Stefan Scott
// CS Workshop August 2018
//
// Exploration Time: Using Mutable Data Structure (ArrayList), and having objects react to each other

ArrayList<Walker> walkers = new ArrayList<Walker>();
void setup() {
  size(600, 400);
  background(0);
  noStroke();
}
void mousePressed() {
  walkers.add(new Walker(random(width), random(height), color(int(random(255)), int(random(255)), int(random(255)), 200)));
}
void draw() {
  background(0);
  println(walkers.size());
  
  //loops through each object
  for (int i = 0; i < walkers.size(); i++) {
    
    //before doing anything, though, loop through all the other objects that haven't been dealt with yet this frame
    //and check if any are close to the current object (i). If they are, have the object at position i 'absorb' it
    //by increasing its own size, and then remove the close object at position (j). If a removal happens, decrement j
    //so that we won't miss an object next time through the loop as the data will have shifted down in the arraylist.
    for (int j = i+1; j< walkers.size();j++){
      if(walkers.get(i).close(walkers.get(j))){  //.close() function is defined in our Walker class
        walkers.get(i).size += walkers.get(j).size;
        walkers.remove(j);
        j--;
      }
    }
    //now display and move the current object
    walkers.get(i).move();
    walkers.get(i).display();
  }
}