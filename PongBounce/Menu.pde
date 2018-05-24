class Menu {
  color c = color(255, 204, 0);
  float speedWidth;
  float speedChange = 15;

  //void done() {
  //  background();
  //  single();
  //}

  void setup() {//Sets the width of the speed bar
    speedWidth = 15;
  }

  void reset() {//Resets width of speed bar
    speedWidth = 15;
  }

  void resetOut() {//Calls methods reset in class method
    menu.reset();
  }

  //void background() {//Background for a menu
  //  rect(0, 0, 1080, 720);
  //  fill(c);
  //}

  //void single() {//Code for a singl player menu option
  //  rect(0, 0, 1080, 720);
  //  fill(125, 125, 125);
  //  textSize(64);
  //  text("singleplayer", 0, 0);
  //  fill(0);
  //}

  void speedBar() {//Methed used to create bar at bottom of screen to indicate the speed of the bar
    fill(125);//Fills in the rectangle with a grey colour
    rect(440, 640, speedWidth, 100);//X coordinate, Y coordinate, Width, Height 
    fill(0);//Fills in the text black
    textSize(64);//Sets size of text to 64 pixels
    text("Speed", 450, 700);//Text, X coordinate, Y coordinate
  }

  void upSpeed() {//Method to increase the width of the speed bar 
    speedWidth += speedChange;//Adds the the width that bar increase by to the width of the bar
    speedWidth = constrain(speedWidth, 15, 200);//Constrains the width of the bar so that it doesn't get wider as the ball speed stays the same
  }

  void downSpeed() {//Method to increase the width of the speed bar 
    speedWidth -= speedChange;//Minus the the width that bar increase from the width of the bar
    speedWidth = constrain(speedWidth, 15, 200);//Constrains the width of the bar so that it doesn't go below backwards as speed of the ball decreases
  }

  //void currentSpeed(float hit) {
  void currentSpeed() {//Methods to call methods to increase ball speed and speed bar width
    //if(hit%2 == 0 && hit > 0) {
    //System.out.println("Hi there");
    puck.upSpeed();//Increases pucks speed
    menu.upSpeed();//Increases menu width
    //if(hit%2 == 0 && hit > 0) {
    // menu.reset(); 
    //}
    //speedWidth += speedChange;
    //speedWidth = constrain(speedWidth, 15, 200);
    //speedBar();
    //System.out.println("Back at ya");
    //speedBar();
    //upSpeed();
    //speedWidth += speedChange;
    //}
  }
}