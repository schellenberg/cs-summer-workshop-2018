//Computer Science 30
//Audio Visualizer:
//Library to Install: Minim

//Five different Audio Visualizations, using Minim Library
//Activate each using 'a', 'b', 'c', 'd', 'e'


import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;



Minim minim;
AudioPlayer[] sound = new AudioPlayer[6];
int keyIndex=0;
float x=0;
float y=40;
float rows, cols;
float scl = 20;
int size = 45;




//Size of the window and also gets the sounds
void setup() {
  background(0);
  noCursor();
  size(500, 500, P3D);
  rows = height/scl;
  cols = width/scl;
  minim = new Minim(this);
  //Looping sounds 
  for (int i=0; i <6; i++) {
    sound[i] = minim.loadFile("sound"+i+".wav");
  }
}




void draw() {
  //This moves the visuals according to the sounds 
  if (keyPressed == true) {
    if (keyIndex == 0) {
      background(0);
      for (int i = 0; i < sound[keyIndex].bufferSize() - 1; i++) {
        pushMatrix();
        translate(width/2, height/2);
        fill(255);
        stroke(0);
        rotate(radians(i));
        ellipse(sound[keyIndex].left.get(i)*150, sound[keyIndex].right.get(i+1)*350, 5, 5);
        popMatrix();
      }
    } else if (keyIndex == 1) {
      background(0);
      for (int i = 0; i < 360; i+=3) {
        pushMatrix();
        rectMode(CORNER);
        translate(width/2, height/2);
        rotate(radians(i));
        int middle = 180;
        int s=abs(middle-i);
        s=int(map(s, 180, 0, 50, 250));
        fill(255);
        ellipse(0, 0, sound[keyIndex].left.get(i)*150, 150);
        rect(70, -2, abs(sound[keyIndex].left.get(i)*s), 2);
        //rect(position,position,size,size)
        popMatrix();
      }
    } else if (keyIndex == 2) {
      pushMatrix();
      background(30);
      noStroke();
      randomSeed(1);
      translate(width/2, height/2);
      rotateX(PI/2);
      translate(-width/2, -height/2);
      for (int  y= 0; y<rows; y++) {
        fill(int(random(255)), int(random(255)), int(random(255)));
        beginShape(TRIANGLE_STRIP);
        for (int x = 0; x<cols; x++) {
          vertex(x*scl, y*scl, sound[keyIndex].left.get(int(y*scl+x))*200);
          vertex(x*scl, (y+1)*scl, sound[keyIndex].right.get(int(y*scl+x))*100);
        }
        endShape();
      }
      popMatrix();
    } else if (keyIndex == 3) {
      for (int i = 0; i < sound[keyIndex].bufferSize() - 1; i++) {
        pushMatrix();
        rectMode(CORNER);
        translate(20, 20);
        noStroke();
        for (int x=0; x<width; x=x+size) {
          for (int y=0; y<height; y=y+size) {
            rect(x, y, sound[keyIndex].left.get(i)*size, sound[keyIndex].left.get(i)*size);
            fill(int(sound[keyIndex].right.get(i)*50), (int(sound[keyIndex].right.get(i)*50)), int(random(255)));
          }
        }
        popMatrix();
      }
    } else if (keyIndex == 4) {
      for (int i = 0; i < sound[keyIndex].bufferSize() - 1; i+=2.5) {
        pushMatrix();
        stroke(map(i, 0, width, 0, 255), map(y+sound[keyIndex].right.get(10)*20, 0, height, 0, 255), mouseX);
        strokeWeight(sound[keyIndex].left.get(i)*90);
        line(x+sound[keyIndex].left.get(i)*80, y+sound[keyIndex].right.get(10)*20, x+=10, y+sound[keyIndex].right.get(20)*20); 
        if (x>=width) {
          x=0;
          y= y+10;
        } else if (y>height) {
          y=0;
        }
        popMatrix();
      }
    } else if (keyIndex == 5) {
      background(0);
      for (int i = 0; i < sound[keyIndex].bufferSize() - 1; i+=1) {
        stroke(255);
        strokeWeight(sound[keyIndex].right.get(i)*50);
        line(i,height/2+sound[keyIndex].left.get(i)*200,i+1,+height/2+sound[keyIndex].left.get(i)*200);
        
      }
    }
  } else {
    background(0);
  }
}



//This keeps track of the keys that are pressed by the numbers of the letters
void keyPressed() {
  if (key >= 'A' && key <='Z' || (key >= 'a' && key<='z')) {
    if (key <= 'Z') {
      keyIndex = key-'A';
    } else {
      keyIndex = key-'a';
    }
    sound[keyIndex].play();
    println(keyIndex);
  }
}




//When the key is released the sound will be paused and reset 
void keyReleased() {
  sound[keyIndex].pause();
  sound[keyIndex].rewind();
}