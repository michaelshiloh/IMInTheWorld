//button Restaurant
int buttonRestaurantX;
int buttonRestaurantY;
int buttonRestaurantW;
int buttonRestaurantH;

//button Customer
int buttonCustomerX;
int buttonCustomerY;
int buttonCustomerW;
int buttonCustomerH;

//scene tracker
int scene = 0;

//images
PImage manamana;
PImage profile;
PImage search;
PImage back;

//food stocks
int schnitzel = 5;
int falafel = 7;
int sabich = 7;

void setup() {
  size(350, 500);
  background(255);
  
  //button Restaurant
  buttonRestaurantX = width/2 - 120;
  buttonRestaurantY = height/2 + 40;
  buttonRestaurantW = 100;
  buttonRestaurantH = 35;
  
  //button Customer
  buttonCustomerX = width/2 + 20;
  buttonCustomerY = height/2 + 40;
  buttonCustomerW = 100;
  buttonCustomerH = 35;
  
  //making buttons for type seelction screen
  rect(buttonRestaurantX, buttonRestaurantY, buttonRestaurantW, buttonRestaurantH, 20);
  rect(buttonCustomerX, buttonCustomerY, buttonCustomerW, buttonCustomerH, 20);
  textSize(17);
  fill(0);
  text("Restaurant", buttonRestaurantX + 10, buttonRestaurantY + 23);
  text("Customer", buttonCustomerX + 15, buttonCustomerY + 23);
  
  textSize(80);
  fill(63,158,86);
  text("Tawfir", 70, height/3);
  
}

void setupRestaurant() {
  background(255);
  
  //menu bars
  stroke(63,158,86);
  strokeWeight(2);
  line(5, 10, 25, 10);
  line(5, 15, 25, 15);
  line(5, 20, 25, 20);
  
  //restaurant name
  textSize(40);
  fill(63,158,86);
  text("Mana Mana", width/4-5, 40);
  stroke(63,158,86);
  strokeWeight(3);
  line(width/4-2, 45, 3*width/4+7, 45);
  
  //image
  manamana = loadImage("manamana.jpg");
  image(manamana, width/6, 60);
  
  //stock
  textSize(25);
  text("Stock", 20, 224);
  strokeWeight(2);
  line(22, 228, 77, 228);
  
  //items in stock and stock buttons
  textSize(16);
  fill(0);
  text("1. Schnitzel in pita bread - "+schnitzel+" in stock", 20, 251);
  text("2. Falafel in pita bread - "+falafel+" in stock", 20, 271);
  text("3. Sabich in pita bread - "+sabich+" in stock", 20, 291);
  fill(255);
  strokeWeight(1);
  fill(0, 255, 0);
  stroke(0);
  circle(width - 40, 245, 12); 
  circle(width - 40, 265, 12);  
  circle(width - 40, 285, 12);  
  fill(255, 0, 0);
  circle(width - 20, 245, 12);
  circle(width - 20, 265, 12);
  circle(width - 20, 285, 12);
  fill(0);
  text("+", width-43.5, 251);
  text("-", width-22.5, 250);  
  text("+", width-43.5, 271);
  text("-", width-22.5, 270);  
  text("+", width-43.5, 291);
  text("-", width-22.5, 290);  
  
  //orders
  textSize(25);
  fill(63,158,86);
  text("Orders", 20, 323);
  stroke(63,158,86);
  strokeWeight(2);
  line(22, 328, 90, 328);
  
  //order list
  textSize(14);
  fill(0);
  text("1. 1x Sabich in pita bread - 12:35 - Michael Shiloh", 20, 348);
  text("2. 1x Schnitzel in pita bread - 13:00 - Felipe Queiroz", 20, 368);
  text("3. 1x Schnitzel in baguette - 13:01 - Yupu Chen", 20, 388);
  
  //delivery comms
  textSize(25);
  fill(63,158,86);
  text("Delivery", 20, 421);
  strokeWeight(2);
  line(22, 426, 105, 426);
  
  //delivery messages
  textSize(16);
  fill(0);
  text("2 deliveries ongoing", 20, 445);
  text("1 driver ready for pickup", 20, 465);
}

void setupConsumer() {
  background(255);
  
  //menu bars
  stroke(63,158,86);
  strokeWeight(2);
  line(5, 10, 25, 10);
  line(5, 15, 25, 15);
  line(5, 20, 25, 20);
  
  //customer name
  textSize(40);
  fill(63,158,86);
  text("John", 55, 60);
  text("Smith", 55, 100);
  
  //customer profile image
  profile = loadImage("profile.png");
  image(profile, 210, 18, 100, 100);
  
  textSize(23);
  fill(0);
  text("Offers near ", 20, 150);
  fill(63,158,86);
  text("36 Bnei Dan St.:", 130, 150);
  
  strokeWeight(1);
  fill(255);
  stroke(0);
  rect(20, 160, 310, 70, 20);
  textSize(27);
  fill(0);
  text("Aroma Espresso Bar", 60, 200);
  textSize(14);
  text("900 meters away...", 210, 225);
  
  fill(255);
  rect(20, 235, 310, 70, 20);
  textSize(27);
  fill(0);
  text("Chicken Crispy", 90, 275);
  textSize(14);
  text("1.2 kilometers away...", 190, 300);
  
  textSize(23);
  fill(0);
  text("Based on your recent meals:", 20, 335);
  
  fill(255);
  rect(20, 345, 310, 70, 20);
  textSize(27);
  fill(0);
  text("Mana Mana", 110, 385);
  textSize(14);
  text("2.1 kilometers away...", 190, 410);
  
  fill(255);
  rect(20, 420, 310, 70, 20);
  textSize(27);
  fill(0);
  text("Bucke", 142, 460);
  textSize(14);
  text("2.5 kilometers away...", 190, 485);
  
  fill(255);
  stroke(255);
  circle(width/2, height-20, 40);                      
  stroke(0);
  rect(0, height-40, width, height);
  search = loadImage("search.png");
  image(search, width/2-15, height-37, 35, 35);
}

void setupSearch() {
  background(255);
  
  //menu bars
  stroke(63,158,86);
  strokeWeight(2);
  line(5, 10, 25, 10);
  line(5, 15, 25, 15);
  line(5, 20, 25, 20);

  //search bar
  stroke(180);
  fill(255);
  strokeWeight(1);
  rect(30, 30, 290, 40);
  image(search, 280, 35, 30, 30);
  stroke(0);
  line(40, 40, 40, 60);
  
  //filters
  rect(20, 80, 100, 30, 15);
  rect(125, 80, 100, 30, 15);
  rect(230, 80, 100, 30, 15);
  fill(63, 158, 86);
  textSize(16);
  text("Filters", 50, 100);
  fill(0);
  text("Near me", 150, 100);
  text("Healthy", 255, 100);
  fill(255);
  stroke(255);
  circle(25, height-25, 15);
  back = loadImage("back.png");
  image(back, 10, height-40, 30, 30);

}

void draw() {
  //start up scene, user type selection
  if (scene == 0) {
    if (mousePressed) {
      if (mouseX >= buttonRestaurantX && mouseX <= buttonRestaurantX+buttonRestaurantW && mouseY >= buttonRestaurantY && mouseY <= buttonRestaurantY+buttonRestaurantH) {
        print("Restaurant");
        scene = 1;
        setupRestaurant();
      }
      if (mouseX >= buttonCustomerX && mouseX <= buttonCustomerX+buttonCustomerW && mouseY >= buttonCustomerY && mouseY <= buttonCustomerY+buttonCustomerH) {
        print("Customer");
        scene = 2;
        setupConsumer();
      }
    }
  }
  //restaurants home screen
  else if (scene == 1) {
    if (keyPressed && key == 'c') { 
      scene = 2;
      setupConsumer(); 
    } 
    if (mousePressed) {
      if (dist(mouseX, mouseY, width-40, 245) <= 12) { schnitzel++; setupRestaurant(); delay(200); }
      else if (dist(mouseX, mouseY, width-40, 265) <= 12) { falafel++; setupRestaurant(); delay(200); } 
      else if (dist(mouseX, mouseY, width-40, 285) <= 12) { sabich++; setupRestaurant(); delay(200); }
      else if (dist(mouseX, mouseY, width-20, 245) <= 12 && schnitzel > 0) { schnitzel--; setupRestaurant(); delay(200); }
      else if (dist(mouseX, mouseY, width-20, 265) <= 12 && falafel > 0) { falafel--; setupRestaurant(); delay(200); }
      else if (dist(mouseX, mouseY, width-20, 285) <= 12 && sabich > 0) { sabich--; setupRestaurant(); delay(200); }
    }
  }
  //consumers home screen
  else if (scene == 2) {
    
    if (keyPressed && key == 'r') { 
      scene = 1;
      setupRestaurant(); 
    }
    if (mousePressed) {
      if (dist(mouseX, mouseY, width/2, height-20) <= 20) { scene = 3; setupSearch(); }
    }
  
  
  }
  //consumers search screen
  else if (scene == 3) {
    if (keyPressed && key == 'r') { 
      scene = 1;
      setupRestaurant(); 
    }
    else if (keyPressed && key == 'c' || dist(mouseX, mouseY, 25, height-25) <= 15) { 
      scene = 2;
      setupConsumer(); 
    } 
  
  }
  

}
