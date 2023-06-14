Storage[] storages = new Storage[8];

Boolean toolBar = false;

int studentIndex = -1;
String inputText = "";
String displayText = "";

Boolean wrongInput = false;
float max = 0;

int radius;
int opacity = 0;

void setup() {
  size(970, 700);
  textSize(50);
  textAlign(CENTER, CENTER);
  radius = 1000000;
  // Construct Storages
  storages[0] = new Storage(100, 50, "Claudio");
  storages[1] = new Storage(340, 50, "Emmanuel");
  storages[2] = new Storage(580, 50, "Felipe");
  storages[3] = new Storage(820, 50, "Lisa");
  storages[4] = new Storage(100, 550, "Maggie");
  storages[5] = new Storage(340, 550, "Soomi");
  storages[6] = new Storage(580, 550, "Yunho");
  storages[7] = new Storage(820, 550, "Yupu");
}

void draw() {
  if (!toolBar) {
    background(0);
    if (studentIndex == -1) {
      displayText = "Select a Student to Grade (Click the Box)";
    } else if (wrongInput) {
      displayText = "Wrong Input, Please Try Again.\nPress SpaceBar to Continue.";
    } else {
      // println(storages[studentIndex].name);
      // first grade input (Class Participation 10%)
      if (storages[studentIndex].index == 0) {
        displayText = "Class Participation Grade (0~10): " + storages[studentIndex].name;
        max = 10;
      }
      // Second grade input (Short Assignments 20%)
      if (storages[studentIndex].index == 1) {
        displayText = "Short Assignments Grade (0~20): " + storages[studentIndex].name;
        max = 20;
      }
      // Third grade input (Artist Presentation 10%)
      if (storages[studentIndex].index == 2) {
        displayText = "Artist Presentation (0~10): " + storages[studentIndex].name;
        max = 10;
      }
      // Fourth grade input (Collaborative Project 20%)
      if (storages[studentIndex].index == 3) {
        displayText = "Collaborative Project (0~30): " + storages[studentIndex].name;
        max = 30;
      }
      // Fifth grade input (Final Project 30%)
      if (storages[studentIndex].index == 4) {
        displayText = "Final Project (0~30): " + storages[studentIndex].name;
        max = 30;
      }
      if (storages[studentIndex].index == 5) {
        inputText = "";
        displayText = "Grading Complete: " + storages[studentIndex].output() + "/100 : " + storages[studentIndex].letterGrade +"\n"+storages[studentIndex].name;
      }
    }

    text(displayText, width/2, height/2-35);
    text(inputText, width/2, height/2+35);

    for (int i=0; i<8; i++) {
      storages[i].display();
    }

    square(50, 400, 50);
    text("ToolTip", 90, 480);
  } else
  {
    background(0);
    fill(255);
    square(50, 400, 50);
    text("ToolTip", 90, 480);
    text("r - resets a student's grade\nENTER - Inputs the Value\nPossible input Values\nAny Rational Number\nType '.' for decimal points.", width/2, height/2);
  }

  // visual effect of clicking
  noFill();
  stroke(255, 255, 255, opacity);
  circle(mouseX, mouseY, radius);
  radius += 10;
  if (opacity>5) {
    opacity -= 20;
  }
  fill(255);
}

void mousePressed()
{
  radius = 0;
  opacity = 255;
  inputText = "";
  if (50<mouseY && mouseY<100) {
    if (100<mouseX&&mouseX<150) studentIndex = 0;
    if (340<mouseX&&mouseX<390) studentIndex = 1;
    if (580<mouseX&&mouseX<630) studentIndex = 2;
    if (820<mouseX&&mouseX<870) studentIndex = 3;
  } else if (550<mouseY && mouseY<600) {
    if (100<mouseX&&mouseX<150) studentIndex = 4;
    if (340<mouseX&&mouseX<390) studentIndex = 5;
    if (580<mouseX&&mouseX<630) studentIndex = 6;
    if (820<mouseX&&mouseX<870) studentIndex = 7;
  } else if (400<mouseY&&mouseY<450) {
    if (50<mouseX && mouseX<100) {
      toolBar = !toolBar;
    }
  }
}

void keyPressed()
{
  wrongInput = false;
  if (Character.isDigit(key) || key == 46) {
    if (storages[studentIndex].index != 5){
    inputText += key;}
  }
  if (key == BACKSPACE) {
    inputText = "";
  }
  if (key == ENTER) {
    if (storages[studentIndex].index < 5 && inputText != "")
    {
      if (Float.isNaN(float(inputText))) {
        wrongInput = true;
        inputText = "";
      } else
      {
        println(float(inputText));
        if (float(inputText)>max) {
          wrongInput = true;
          inputText = "";
        } else {
          storages[studentIndex].input(float(inputText));
          inputText = "";
        }
      }
    }
  }
  if (key == 114 && studentIndex >= 0) {
    wrongInput = false;
    inputText = "";
    storages[studentIndex].reset();
  }
  // if ESC Reset Storage and Index
}

class Storage {
  float StoredContent[] = new float[5];
  float x1, y1;
  String name = "";
  int index = 0;
  boolean complete = false;
  String letterGrade = "";
  Storage(float x, float y, String Name) {
    x1 = x;
    // x2 = x+50;
    y1 = y;
    // y2 = y+50;
    name = Name;
  }
  void input(float grade) {
    StoredContent[index] = grade;
    index++;
    if (index == 5) complete = true;
  }
  void display() {
    fill(255);
    square(x1, y1, 50);
    text(name, x1+25, y1+70);
  }
  void reset() {
    index = 0;
    for (int i=0; i<5; i++) {
      StoredContent[i] = 0;
    }
  }
  float output() {
    float output = 0;
    for (int i=0; i<5; i++) {
      output += StoredContent[i];
    }
    if (output<63) {
      letterGrade = "F";
    } else if (output<70) {
      letterGrade = "D";
    } else if (output<73) {
      letterGrade = "C-";
    } else if (output<77) {
      letterGrade = "C";
    } else if (output<80) {
      letterGrade = "C+";
    } else if (output<83) {
      letterGrade = "B-";
    } else if (output<87) {
      letterGrade = "B";
    } else if (output<90) {
      letterGrade = "B+";
    } else if (output<95) {
      letterGrade = "A-";
    } else {
      letterGrade = "A";
    }
    return output;
  }
}


//class Memo {
//  String content = "";
//  float xPos = width/2;
//  float yPos = height/2;
//  Memo(){
//    // to be added if needed
//  }
//  Memo (String input) {
//    content = input;
//  }
//  void display() {
//    text(content, xPos, yPos);
//  }
//  void move(float xMove, float yMove) {
//    xPos = xMove;
//    yPos = yMove;
//    if (xPos < 0) xPos = 0;
//    if (xPos > width) xPos = width;
//    if (yPos < 0) yPos = 0;
//    if (yPos > height) yPos = height;
//  }
//  String store() {
//    String output;
//    output = content;
//    content = "";
//    return output;
//  }
//}
