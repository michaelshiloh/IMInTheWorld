int currentDisplay = 0; // 0 for main clock, 1 for additional clocks
int ringColorState = 0; // Variable to keep track of the color state
color[] ringColors = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)}; // Colors for the rings

void setup() {
  size(800, 800);
  background(0);
  strokeCap(SQUARE);
}

void draw() {
  fill(0);
  rect(0, 0, 800, 800);

  if (currentDisplay == 0) {
    displayMainClock();
  } else if (currentDisplay == 1) {
    displayAdditionalClocks();
  }
}

void displayMainClock() {
  int s = second();
  int h = hour();
  int m = minute();

  String time;

  if (h >= 10)
    time = h + "";
  else
    time = "0" + h;
  if (m < 10)
    time = time + ":0" + m;
  else
    time = time + ":" + m;
  if (s < 10)
    time = time + ":0" + s;
  else
    time = time + ":" + s;

  if (h > 12)
    h = h - 12;

  translate(width / 2, height / 2);
  rotate(radians(-90));

  noFill();
  strokeWeight(12);
   // Alternate the colors of the rings
  stroke(ringColors[ringColorState % 3]);
  arc(0, 0, 400, 400, 0, ((2 * PI) / 60) * s);

  stroke(ringColors[(ringColorState + 1) % 3]);
  arc(0, 0, 350, 350, 0, ((2 * PI) / 60) * m);

  stroke(ringColors[(ringColorState + 2) % 3]);
  arc(0, 0, 300, 300, 0, ((2 * PI) / 12) * h);

  rotate(radians(90));
  PFont font = createFont("Arial", 60);
  textFont(font);
  fill(255);
  textAlign(CENTER, CENTER);
  text(time, 0, 0);
  
  text("ISRAEL",0,-350);
}

void displayAdditionalClocks() {
  int offsetX = width / 4; // Adjust the offset based on the width of the screen
  int offsetY = height / 2;

  for (int i = 0; i < 3; i++) {
    int timezoneHour = (hour() + i + 1) % 24;
    int timezoneMinute = minute();
    int timezoneSecond = second();
    

    pushMatrix();
    translate(offsetX * (i + 1), offsetY);
    rotate(radians(-90));

    noFill();
    strokeWeight(12);

    // 1st Ring
    stroke(ringColors[ringColorState % 3]);
    arc(0, 0, 150, 150, 0, ((2 * PI) / 60) * timezoneSecond);

    // 2nd Ring
    stroke(ringColors[(ringColorState + 1) % 3]);
    arc(0, 0, 120, 120, 0, ((2 * PI) / 60) * timezoneMinute);

    // 3rd Ring
    stroke(ringColors[(ringColorState + 2) % 3]);
    arc(0, 0, 90, 90, 0, ((2 * PI) / 12) * timezoneHour);

    rotate(radians(90));
    PFont font = createFont("Arial", 24);
    textFont(font);
    fill(255); // Set text color to white
    textAlign(CENTER, CENTER);
    text(nf(timezoneHour, 2) + ":" + nf(timezoneMinute, 2) + ":" + nf(timezoneSecond, 2), 0, 0);

    popMatrix();
  }
}
void keyPressed() {
  if (key == 'd') {
    currentDisplay = 1; // Switch to additional clocks display
  } else if (key == 'r') {
    currentDisplay = 0; // Switch back to main clock display
  }
  
  
  if (key == 'q' || key == 'Q') {
    exit(); // Quit the sketch
  }
}



void mousePressed() {
  // Check if the mouse is clicked within the time text area
  if (dist(mouseX, mouseY, width / 2, height / 2) <= 100) {
    // Increment the color state to change the ring colors
    ringColorState++;
  }
}
