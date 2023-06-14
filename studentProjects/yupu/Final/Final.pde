PImage img;

void setup() {
  size(1000, 400);
  //background(230, 248, 249, 50);
  img = loadImage("museum.jpg");
}
int xmove = 0;
int ymove = 0;
int lasty = 0;
int n = 0;
boolean right = true;

void draw() {
  imageMode(CENTER);
  image(img, 500, 200, 1000, 400);
  cursor(CROSS);
  //background(230, 248, 249, 200);

  float time = float(millis());

  if (time < 5000) {
    textSize(80);
    fill(255, 255);
    text("Welcome to IM Museum", 110, 180);
  } else {

    stroke(255, 80);
    
    fill(250, 50);
    rect(790, 100, 160, 200, 10);
    
    fill(250, 50);
    rect(850, 350, 85, 30, 10);
    
    fill(0);
    textSize(17);
    text("Language", 857, 370);

    fill(250, 50);
    rect(500, 20, 100, 30, 10);
    fill(0, 0, 0);
    textSize(17);
    text("Guided Tour", 507, 40);

    fill(250, 50);
    rect(660, 20, 100, 30, 10);
    fill(0, 0, 0);
    textSize(17);
    text("Exhibitions", 672, 40);

    fill(250, 50);
    rect(820, 20, 100, 30, 10);
    fill(0, 0, 0);
    textSize(17);
    text("Share this!", 832, 40);

    drawRoute();
    if (mousePressed == true) {
      if (right == true && n!= 4) { // movement of the arrow
        if (!(xmove > 130)) {
          xmove += 2;
        } else if (!(ymove - lasty > 50)) {
          ymove += 2;
        } else {
          lasty = ymove;
          right = false;
          n+=1;
        }
      }

      if (right == false && n!= 4) { //movement of the arrow
        if (!(xmove < 0)) {
          xmove -= 2;
        } else if (!(ymove - lasty > 50)) {
          ymove += 2;
        } else {
          lasty = ymove;
          right = true;
          n+=1;
        }
      }
    }

    drawCircle(xmove, ymove);
    drawArrow(xmove, ymove);
  }
}

void drawArrow(int xmove, int ymove) {
  strokeWeight(4);
  fill(255, 255, 255); //drawing the arrow
  stroke(255, 255, 255);
  beginShape();
  vertex(100+xmove, 290-ymove);
  vertex(120+xmove, 240-ymove);
  vertex(140+xmove, 285-ymove);
  vertex(120+xmove, 265-ymove);
  vertex(100+xmove, 290-ymove);
  endShape();
}

void drawCircle(int xmove, int ymove) {
  strokeWeight(4);
  fill(55, 141, 237, 150); //drawing the circle
  stroke(255, 255, 255, 150);
  circle(120 + xmove, 265 - ymove, 60);
}

void drawRoute() {
  strokeWeight(5);
  noFill(); //drawing the line
  stroke(55, 141, 237, 150);
  beginShape();
  curveVertex(120, 250);
  curveVertex(120, 250);
  curveVertex(250, 250);
  curveVertex(250, 200);
  curveVertex(120, 200);
  curveVertex(120, 150);
  curveVertex(250, 150);
  curveVertex(250, 100);
  curveVertex(120, 100);
  curveVertex(120, 50);
  curveVertex(120, 80);
  endShape();
}
