
class Paddle {
  float leftY = (height/2 - 100);//Starts the left paddle off in the middle of the screen
  //float leftY = 0;
  float rightY = (height/2 - 100);//Starts the right paddle off in the middle of the screen
  float leftYchange;//Vaule to be set by passing value from PongBounce
  float rightYchange;//Vaule to be set by passing value from PongBounce

  void show() {
    rect(25, leftY, 25, 200);//Shows a rectangle at coordinates 25, leftY and its 25 pixels wide and 200 in height
    rect(1030, rightY, 25, 200);//Shows a rectangle at coordinates 1030, rightY and its 25 pixels wide and 200 in height
  }

  void updateLeft() {//Method for moving left paddle
    leftY += leftYchange;//Changes leftY by adding leftY and leftYchange together then making leftY equal to the answer
    leftY = constrain(leftY, 0, 520);//Constrains leftY to equal or be between 0 and 520
    puck.updateLeft(leftY);//Passes leftY value to method updateLeft in puck
  }

  void updateRight() {//Method for moving right paddle 
    rightY += rightYchange;//Changes rightY by adding rightY and rightYchange together then making rightY equal to the answer
    rightY = constrain(rightY, 0, 520);//Constrains rightY to equal or be between 0 and 520
    puck.updateRight(rightY);//Passes rightY value to method updateRight in puck
  }

  void moveLeftPaddle(float change) {//Method used for passing in speed from PongBounce
    leftYchange = change;//Sets value of leftYchange to the value just being passed in
  }

  public float getleftY() {//Method used to pass value of the top of left paddle
    return leftY;
  }

  void moveRightPaddle(float change) {//Method used for passing in speed from PongBounce
    rightYchange = change;//Sets value of leftYchange to the value just being passed in
  }

  public float getrightY() {//Method used to pass value of the top of right paddle
    return rightY;
  }
}