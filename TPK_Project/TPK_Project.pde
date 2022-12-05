// Madoka Magica Side Story by TPK Studio
// Thyme Chanpayom, Yifeng. Zhang, Pablo Mejia
// Wednesday, November 30, 2022

/******* NOTE REQUIRES SOUND LIBRARY TO BE INSTALLED TO RUN PROPERLY *******/
/* From Processing go to Sketch → Import Library → Manage Library → search for "sound" and select "Sound" */

/* Initialization */
import processing.sound.*; // Import the Sound library for Processing
SoundFile sound;           // Declare SoundFile "sound"
SoundFile Itai;            // Declare SoundFile "Itai"
SoundFile pop;             // Declare SoundFile "pop"

PFont scoreNumber; // Declare font of "scoreNumber"
PFont scoreText;   // Declare font of "scoreText"

PImage background; // Declare Image "background"
PImage crosshairs; // Declare Image "crosshairs"
PImage balloon;    // Declare Image "balloon"
PImage sprite1;    // Declare Image "sprite1"
PImage sprite2;    // Declare Image "sprite2"
PImage sprite3;    // Declare Image "sprite3"
PImage sprite4;    // Declare Image "sprite4"
PImage sprite5;    // Declare Image "sprite5"
PImage sprite6;    // Declare Image "sprite6"

int score; // Initialize "score" variable
int win;   // Initialize "win" variable

float posY1 = random(200, 300);  // Declare random y position of balloon1
float posY2 = random(200, 300);  // Declare random y position of balloon2
float posY3 = random(200, 300);  // Declare random y position of balloon3
float posY4 = random(200, 300);  // Declare random y position of balloon4
float velocityY1 = random(2, 3); // Declare random y velocity of balloon1
float velocityY2 = random(2, 3); // Declare random y velocity of balloon2
float velocityY3 = random(2, 3); // Declare random y velocity of balloon3
float velocityY4 = random(2, 3); // Declare random y velocity of balloon4

boolean showBalloon1 = true; // Initialize boolean showBalloon1 to be true (visible)
boolean showBalloon2 = true; // Initialize boolean showBalloon2 to be true (visible)
boolean showBalloon3 = true; // Initialize boolean showBalloon3 to be true (visible)
boolean showBalloon4 = true; // Initialize boolean showBalloon4 to be true (visible)

/* Setup Function */
void setup() {
  smooth();        // Draws all geometry with smooth (anti-aliased) edges
  noCursor();      // Hides the cursor from view
  frameRate(60);   // Specifies the number of frames to be displayed every second
  size(1000, 600); // Defines the dimension of the display window width and height in units of pixels
  background = loadImage("background.png"); // Load Image "background.png"
  crosshairs = loadImage("crosshairs.png"); // Load Image "crosshairs.png"
  balloon = loadImage("balloon.png");       // Load Image "balloon.png"
  sprite1 = loadImage("sprite1.png");       // Load Image "sprite1.png"
  sprite2 = loadImage("sprite2.png");       // Load Image "sprite2.png"
  sprite3 = loadImage("sprite3.png");       // Load Image "sprite3.png"
  sprite4 = loadImage("sprite4.png");       // Load Image "sprite4.png"
  sprite5 = loadImage("sprite5.png");       // Load Image "sprite5.png"
  sprite6 = loadImage("sprite6.png");       // Load Image "sprite6.png"
  pop = new SoundFile(this, "pop.mp3");     // Load SoundFile "pop.mp3"
  Itai = new SoundFile(this, "Itai.mp3");   // Load SoundFile "Itai.mp3"
  sound = new SoundFile(this, "sound.mp3"); // Load SoundFile "sound.mp3"
  scoreText = loadFont("AmericanTypewriter-50.vlw"); // Load Font for "scoreText"
  scoreNumber = loadFont("AcademyEngravedLetPlain-100.vlw"); // Load Font for "scoreNumber"
}

/* Draw Function */
void draw() {
  image(background, 0, 0); // Draw the background image
  image(sprite3, 75, 360); // Draw the main character
  fill(255);               // Fill white
  textFont(scoreText);     // Draw text score
  text(score, 200, 50);    // Draw score counter
  text("score:", 30, 50);  // Draw text "score:"
  if (showBalloon1) image(balloon, 600, posY1 + velocityY1); // Call the balloon image
  posY1 += velocityY1;                                       // Change y position of the balloon
  if (posY1 < 20 || posY1 > 350) {                           // Check if balloon touch top or bottom
    velocityY1 *= -1;                                        // Change y velocity of the balloon
  }
  if (showBalloon2) image(balloon, 700, posY2 + velocityY2); // Call the balloon image
  posY2 += velocityY2;                                       // Change y position of the balloon
  if (posY2 < 20 || posY2 > 350) {                           // Check if balloon touch top or bottom
    velocityY2 *= -1;                                        // Change y velocity of the balloon
  }
  if (showBalloon3) image(balloon, 800, posY3 + velocityY3); // Call the balloon image
  posY3 += velocityY3;                                       // Change y position of the balloon
  if (posY3 < 20 || posY3 > 350) {                           // Check if balloon touch top or bottom
    velocityY3 *= -1;                                        // Change y velocity of the balloon
  }
  if (showBalloon4) image(balloon, 900, posY4 + velocityY4); // Call the balloon image
  posY4 += velocityY4;                                       // Change y position of the balloon
  if (posY4 < 20 || posY4 > 350) {                           // Check if balloon touch top or bottom
    velocityY4 *= -1;                                        // Change y velocity of the balloon
  }
  image(crosshairs, mouseX, mouseY); // Call the crosshairs image to follow mouse position
  if (win == 4) { // Check if score = 4 (all balloon disappeared)
    winScreen();  // Show a "You Win" screen
    delay(300);   // Delay 300 milliseconds
    exit();       // End the game
  }
}

/* Mouse Pressed Function */
void mousePressed() {      // When mouse is pressed
  sound.play();            // Play sound for gunshot
  image(sprite4, 75, 360); // Change Animation (Image)
  // Check if mouse position is on Balloon1
  if ((mouseX > 550 && mouseX < 650) && (mouseY > posY1-50 && mouseY < posY1+50) && showBalloon1) {
    showBalloon1 = false; // Turn boolean showBalloon1 to be false (hidden)
    score = score + 1;    // Add 1 score when Balloon1 got hit
    win = win + 1;        // Add 1 win when Balloon1 got hit
    pop.play();           // Play pop sound when Balloon1 got hit
  }
  // Check if mouse position is on Balloon2
  if ((mouseX > 650 && mouseX < 750) && (mouseY > posY2-50 && mouseY < posY2+50) && showBalloon2) {
    showBalloon2 = false; // Turn boolean showBalloon2 to be false (hidden)
    score = score + 1;    // Add 1 score when Balloon2 got hit
    win = win + 1;        // Add 1 win when Balloon2 got hit
    pop.play();           // Play pop sound when Balloon2 got hit
  }
  // Check if mouse position is on Balloon3
  if ((mouseX > 750 && mouseX < 850) && (mouseY > posY3-50 && mouseY < posY3+50) && showBalloon3) {
    showBalloon3 = false; // Turn boolean showBalloon3 to be false (hidden)
    score = score + 1;    // Add 1 score when Balloon3 got hit
    win = win + 1;        // Add 1 win when Balloon3 got hit
    pop.play();           // Play pop sound when Balloon3 got hit
  }
  // Check if mouse position is on Balloon4
  if ((mouseX > 850 && mouseX < 950) && (mouseY > posY4-50 && mouseY < posY4+50) && showBalloon4) {
    showBalloon4 = false; // Turn boolean showBalloon4 to be false (hidden)
    score = score + 1;    // Add 1 score when Balloon4 got hit
    win = win + 1;        // Add 1 win when Balloon4 got hit
    pop.play();           // Play pop sound when Balloon4 got hit
  }
  // Check if mouse position is on on the Sprite (Character)
  if ((mouseX > 30 && mouseX < 80) && (mouseY > 310 && mouseY < 410)) {
    background(255, 0, 0);  // Show red screen when the character got hit (
    Itai.play();            // Play sound for when the character got hit
    text("Itai!", 60, 320); // Show the "Itai!" text
  }
}

/* Win Screen Function */
void winScreen () {
  fill(255, 0, 0);            // Fill Red
  textFont(scoreNumber);      // Show the text for scrore
  text("You Win!", 300, 250); // Show the text for "You Win!" screen
}
