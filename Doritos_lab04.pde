// two tests for Doritos Battleship:
//     1. How will you test whether the GUI is functionally correct?
//          -
//     2. How will you test your GUI's usability?
//          -


//////////////////////////
//Variable declarations//
/////////////////////////

//Import controlP5 software and rename so there is less typing
import controlP5.*;
ControlP5 cp5;

//C1 and C2 for controlP5 functionality
int c1, c2;

//The Width and Height of the screen... will scale to different desktops
int WIDTH;
int HEIGHT;

//The size of the boards (number of rows/columns)... can be changed to increase the difficulty
int boardSize = 10;

//The size of each square... is dependent on the size of the boards. Mini square size is one half of the normal.
int squareSize;
int miniSquareSize;

//Constants to store buttons help and score
Button help;
Button score;
Button[][] bigBoardMatrix = new Button[boardSize][boardSize];
boolean[][] bigBoardMatrixPressed = new boolean[boardSize][boardSize];
Button[][] miniBoardMatrix = new Button[boardSize][boardSize];
boolean helpButtonPressed = false;
boolean scoreButtonPressed = false;


//Constant CColor for all the buttons and the collor change when they are pressed.
CColor buttonColor = new CColor(0xff999999, 0xff990000, 0xff000000, 0xff000000, 0xff000000);
CColor buttonPressedColor = new CColor(0xff000000, 0xff000000, 0xff000000, 0xffFFFFFF, 0xffFFFFFF);

//Constant for the background color
int myColor = color(255);


///////////////////
//Setup Function//
//////////////////

void setup() {

  //When will open up to fill the screen
  fullScreen();
  noStroke();


  // Variables//

  //Initialize WIDTH and HEIGHT to be the size of the display width and height
  WIDTH = displayWidth;
  HEIGHT = displayHeight;
  //We want the board to be 1/3 of the width, so square size will be that divided by the boardSize (number of rows/cols).
  squareSize = (WIDTH/3)/boardSize;
  //Mini squares will be one half of that
  miniSquareSize = squareSize/2;
  //The square will begin 1/7 of the way down the screen (x and y directions)
  float squareX = WIDTH/7;
  float squareY = HEIGHT/7;
  //Squares will be separated by 1/4 a square size
  float separation = squareSize/4;
  float miniSeparation = miniSquareSize/4;


  //Create the large board to be a series of buttons
  for (int i = 0; i < boardSize; i++) {
    for (int j = 0; j < boardSize; j++) {


      cp5 = new ControlP5(this);
      float x = (squareX + i*squareSize) + (i * separation);
      float y = (squareY + (j*squareSize) + (j * separation));


      bigBoardMatrix[i][j] = cp5.addButton(i + " , " + j)
        .setValue(1)
        .setPosition(x, y)
        .setSize(squareSize, squareSize)
        .setColor(buttonColor);
    }
  }




  //Create the mini board to also be a series of buttons
  for (int i = 0; i < boardSize; i++) {
    for (int j = 0; j < boardSize; j++) {
      cp5 = new ControlP5(this);
      float x = (2*(squareX) + (i*miniSquareSize) + (i * miniSeparation) + (WIDTH/3));
      float y = (squareY) + (j*miniSquareSize) + (j * miniSeparation);


      miniBoardMatrix[i][j] = cp5.addButton(i + " , " + j)
        .setValue(0)
        .setPosition(x, y)
        .setSize(miniSquareSize, miniSquareSize)
        .setColor(buttonColor);
    }
  }

  //Add a help button
  help = cp5.addButton("Help")
    .setValue(1)
    .setPosition((WIDTH/7), (WIDTH/7 + WIDTH/3 + squareSize))
    .setSize((squareSize*6), squareSize)
    .setColor(buttonColor)
    ;

  //Add a score button
  score = cp5.addButton("Score: 2-2")
    .setValue(1)
    .setPosition((WIDTH/7 + squareSize*6.25), (WIDTH/7 + WIDTH/3 + squareSize))
    .setSize((squareSize*6), squareSize)
    .setColor(buttonColor)
    ;
    

}


///////////////////
//Draw Function///
/////////////////

void draw() {

  //Set the background color 
  background(myColor);
  if (helpButtonPressed == true) {
    help.setColor(buttonPressedColor);
  } else {
    help.setColor(buttonColor);
  }
  

  for (int i = 0; i < boardSize; i++) {
    for (int j = 0; j < boardSize; j++) {
      if (bigBoardMatrixPressed[i][j] == true) {
        bigBoardMatrix[i][j].setColor(buttonPressedColor);
      } else {
        bigBoardMatrix[i][j].setColor(buttonColor);
      }
    }
  }
}


////////////////////
//Other Functions//
//////////////////


//Help button functionality
public void Help() {
  help.mouseReleased();
  if (!helpButtonPressed) {
    helpButtonPressed = true;
  } else {
    helpButtonPressed = false;
  }
}



public void matrixPressed() {
  for (int i = 0; i < boardSize; i++) {
    for (int j = 0; j < boardSize; j++) {
      bigBoardMatrix[i][j].mouseReleased();
      if (!bigBoardMatrixPressed[i][j]) {
        bigBoardMatrixPressed[i][j] = true;
      } else {
        bigBoardMatrixPressed[i][j] = false;
      }
    }
  }
}
