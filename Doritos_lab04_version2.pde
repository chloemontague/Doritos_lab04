// two tests for Doritos Battleship:
//     1. How will you test whether the GUI is functionally correct?
//          -
//     2. How will you test your GUI's usability?
//          -

// 400 x 400 / how many rows you want rows/col = 
  int boardSize = 10;
  int squareSize = 400/boardSize;
  int miniSquareSize = squareSize/2;
  int c1,c2;

import controlP5.*;
ControlP5 cp5;
int myColor = color(255);
int gridSize = 10;

void setup() {
  size(900, 1000);
  noStroke();
  
  

  
  for (int i = 0; i < boardSize; i++) {
    for (int j = 0; j < boardSize; j++) {
      cp5 = new ControlP5(this);
      float separation = 1.25;
      float x = 200 + (separation*i*miniSquareSize);
      float y = 750 + (separation*j*miniSquareSize);

      
     cp5.addButton(" ")
     .setValue(0)
     .setPosition(x, y)
     .setSize(miniSquareSize, miniSquareSize)
     .setColorActive(0xff000000)
     .setColorBackground(0xff990000)
     .setColorForeground(0xff999999)
  //   .setColorLabel(0xff990000);
     ;
     
      cp5.addButton("Help")
     .setValue(1)
     .setPosition(450, 50)
     .setSize((squareSize*3), squareSize)
     .setColorActive(0xff000000)
     .setColorBackground(0xff990000)
     .setColorForeground(0xff999999)
     ;
     
     cp5.addButton("Score: 2-2")
     .setValue(1)
     .setPosition(300, 50)
     .setSize((squareSize*3), squareSize)
     .setColorActive(0xff000000)
     .setColorBackground(0xff990000)
     .setColorForeground(0xff999999)
     ;
  
    }
}
}


void draw() {
  background(myColor);
  
  for (int i = 0; i < boardSize; i++) {
   for (int j = 0; j < boardSize; j++) {
    
     //int x = 150 + (i*squareSize);
     //int y = 150 + (j*squareSize);
     //fill(255);
     //stroke(0);
     
     //square(x, y, squareSize);
     
     
     cp5 = new ControlP5(this);
      float separation = 1.25;
      float x = 200 + (separation*i*squareSize);
      float y = 150 + (separation*j*squareSize);

     
     cp5.addButton(" ")
     .setValue(1)
     .setPosition(x, y)
     .setSize(squareSize, squareSize)
     .setColorActive(0xff000000)
     .setColorBackground(0xff990000)
     .setColorForeground(0xff999999)
    // .setColorLabel(0xff990000);
     ;
 
   }
    
  } 
    
}
