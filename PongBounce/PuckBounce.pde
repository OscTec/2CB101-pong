
class Puck {
  Paddle paddle;//Makes a object that can be called to access methods in other classes
  Menu menu;
  int scoreLeft = 0;//Scores of the right person
  int scoreRight = 0;//Score of the left person
  float speed = 4;//Starting speed of the ball
  float x = width/2;//Balls starting x location
  float y = height/2;//Balls starting y location
  //float leftY = (height/2 - 100); 
  //float rightY = (height/2 - 100);
  float leftY;
  float rightY;
  float xspeed = -speed;
  float yspeed = speed;
  float leftYchange;
  float rightYchange;
  float speedChange = 0.5;
  float hitCount = 0;//Used to count how many times the ball hits the paddle

  void setup() {
    menu = new Menu();
  }

  void reset() {//Reset method
    //speed = 4;
    x = width/2;//Resets x location
    y = height/2;//Resets y location
    hitCount = 0;//Sets the hit counter back to 0  
    menu.resetOut();//Calls method to reset the speed bar
  }

  void resetSpeed() {//Another reset method but with a different purpose 
    speed = 4;//Resets ball speed to 4 
    float ran = random(-1, 1);//Sets ran to a random value between -1 and 1
    float angle = random(-1, 1);//Sets angle to a random value between -1 and 1
    if (ran > 0) {//If ran is greater than 0 ball will go right 
      xspeed = 5 * cos(angle);
      yspeed = 5 * sin(angle);
      //yspeed = speed;
    } else {//else it will go left
      xspeed = -5 * cos(angle);
      yspeed = -5 * sin(angle);
      //yspeed = speed;
    }
  }

  void update() {//Method that is called continuously by draw in main class
    //xspeed = speed;
    //yspeed = speed;
    x = x + xspeed;//Updates x coordinate of ball making it move
    y = y + yspeed;//Updates y coordinate of ball making it move
    leftY += leftYchange;//Updates the coordinate of the left paddle
    leftY = constrain(leftY, 0, 520);//Constrains it to between 0 and 520
    rightY += rightYchange;//Updates the coordinate of the left paddle
    rightY = constrain(rightY, 0, 520);//Constrains it to between 0 and 520
    //fill(255);
    //textSize(64);
    //text(speed, 450, 700);
  }

  void updateLeft(float lY) {//Method used as part of the code that tells the puck where the left paddle is
    leftY = lY;//Sets leftY equal to the value lY which has just been passed in
  }

  void updateRight(float rY) {//Method used as part of the code that tells the puck where the right paddle is
    rightY = rY;//Sets rightY equal to the value rY which has just been passed in
  }

  void upSpeed() {//Ups speed of ball
    speed += speedChange;
    speed = constrain(speed, 4, 24);//Constrains it to between 4 and 24
  }

  void downSpeed() {//Decreases speed of ball 
    speed -= speedChange;
    speed = constrain(speed, 4, 24);//Constrains it to between 4 and 24
  }



  void scoreLeft() {//Right players points 
    textSize(64);//Size of text
    text(scoreLeft, 730, 64);//What text says X coordinate Y coordinate
    fill(255);//White text
  }

  void scoreRight() {//Left players points 
    textSize(64);
    text(scoreRight, 350, 64);
    fill(255);
  }

  void edge() {//Method for checking if the ball goes off screen or touches the top or bottom 
    if (y > 708) {//Checks if ball touches the top of the window
      yspeed = -speed;//If it does reverses yspeed
      //yspeed *= -1;
    }
    if (y < 12) {//Checks if ball touches the botton of the window
      yspeed = speed;//If it does reverses yspeed
      //yspeed *= -1;
    }
    if (x > 1068) {//Checks if ball goes off right of screen
      resetSpeed();//If it does resets ball speed 
      scoreRight++;//Increases left players score
      //xspeed = -speed;
      //reset1();
      reset();//Resets aspects of game
    }
    if (x < 12) {//Checks if ball goes off left of screen
      resetSpeed();//If it does resets ball speed
      scoreLeft++;//Increases right players score
      //xspeed = speed;
      //reset1();
      reset();//Resets aspects of game
    }
  }

  void move(float change) {
    leftYchange = change;
  }

  void moveRight(float change) {
    rightYchange = change;
  }

  void paddleContactLeft() {//Method for checking if puck hits paddle and if so acts on it
    if ((x <= 50 && x >= 25) && y <= (leftY + 200) && y > leftY) {//Checks if puck is hitting the paddle
      hitCount++;//Increases hit count by 1 
      menu.currentSpeed();//Calls method current speed in menu
      float puckLoc = (y - 100) - leftY;//Works out the pucks location relative to the paddle
      float radians = radians(45);//Sets radians equal to 45
      float angle = map(puckLoc, -100, 100, -radians, radians);//Maps pucks location to a number between radians and -radians
      xspeed = 5 * cos(angle);
      //yspeed = 5 * sin(angle);
    }
    //if ((x <= 50 && x >= 25) && y <= (leftY + 200) && y > leftY) { //Works but no angle variation 
    //    xspeed *= -1;
    //    hitCount++;
    //    menu.currentSpeed();
    //  }
    //}
    //}
  }

  void paddleContactRight() {//Method for checking if puck hits paddle and if so acts on it
    if  ((x >= 1030 && x <= 1055) && y < (rightY + 200) && y > rightY) {//Checks if puck is hitting the paddle
      //if  ((x >= 1030 && x <= 1055) && y > rightY ) { //Ball glitches through half the time
      hitCount++;//Increases hit count by 1
      menu.currentSpeed();//Calls method current speed in menu
      float puckLoc = (y - 100) - rightY;//Works out the pucks location relative to the paddle
      float radians = radians(135);//Sets radians equal to 135
      float angle = map(puckLoc, -100, 100, -radians, radians);//Maps pucks location to a number between radians and -radians
      xspeed = 5 * -cos(angle);
      //yspeed = 5 * sin(angle);
    }
    //if  ((x >= 1030 && x <= 1055) && y < (rightY + 200) && y > rightY ) { //Works but no angle variation 
    //  xspeed *= -1;
    //  hitCount++;
    //  menu.currentSpeed();
    //}
  }

  void show() {//Draws the puck
    fill(255);//Colours it white
    ellipse(x, y, 24, 24);//X coordinate, Y coordinate, 24 pixels wide, 24 pixels high
  }
}