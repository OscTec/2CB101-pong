
Puck puck;
Paddle paddle;
Menu menu;
float leftPaddleSpeed = 15;//Speed that the left paddle move at
float rightPaddleSpeed = 15;//Speed that the right paddle moves at
PImage img;  

void setup() {
  size(1080, 720);//The height and width of the window 
  puck = new Puck();//Allows methods in class Puck to be called  
  paddle = new Paddle();//Allows methods in class Paddle to be called 
  menu = new Menu();//Allows methods in class Menu to be called
  size(1080, 720);//The size of the window
  img = loadImage("background.jpg");//Set img so its the image background.jpg
  puck.setup();//Calls method setup in class puck
  menu.setup();//Calls method setup in class menu
  puck.resetSpeed();//Calls method resetSpeed in class puck
}

void draw() {//Everything in this methods is called continuously
  image(img, 0, 0);//Used to to display image. First is the name of the image used then its X coordinate and Y coordinate 
  //background(0);//Sets background to black
  puck.paddleContactLeft();//Checks is puck has hit the left paddle
  puck.paddleContactRight();//Checks is puck has hit the right paddle
  paddle.updateLeft();//Moves left paddle
  paddle.updateRight();//Moves right paddle 

  puck.edge();//Checks if puck is at edge
  puck.update();//Moves puck
  puck.show();//Shows puck in new location
  paddle.show();//Shows paddles in new locations
  puck.scoreLeft();//Calls scoreLeft to keep it on the screen 
  puck.scoreRight();//Calls scoreRight to keep it on the screen 
  menu.speedBar();//Calls methods to display the speed bar
}

void keyPressed() {//Triggers when a key is pressed
  if (key == 'w') {
    paddle.moveLeftPaddle(-leftPaddleSpeed);//Passes leftPaddleSpeed to method moveLeftPaddle in class paddle causing it to move
    puck.move(-leftPaddleSpeed);//This passes leftPaddleSpeed to method move in class puck
  } else if (key == 's') {
    paddle.moveLeftPaddle(leftPaddleSpeed);
    puck.move(leftPaddleSpeed);
  }
  if (key == 'p') {
    paddle.moveRightPaddle(-rightPaddleSpeed);
    puck.moveRight(-rightPaddleSpeed);
  } else if (key == 'l') {
    paddle.moveRightPaddle(rightPaddleSpeed);
    puck.moveRight(rightPaddleSpeed);
  }
  if (keyCode == UP) {
    menu.upSpeed(); 
    puck.upSpeed();
  } else if (keyCode == DOWN) {
    menu.downSpeed();
    puck.downSpeed();
  }
}

void keyReleased() {//Triggers when a key is released this stops paddles move indefinitely after key is released
  if (key == 'w' || key == 's') {
    paddle.moveLeftPaddle(0);
  } else if (key == 'p' || key == 'l') {
    paddle.moveRightPaddle(0);
  }
}