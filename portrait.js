function setup() {
  createCanvas(300,400); 
  background(25, 130, 80); 
  
  // draw a circle and a rectangle with the default colors
  circle (300/2, 400/2, 50);
  rect(10, 10, 80, 20);
  
  // change the stroke and fill
  fill(180,0,0);
  stroke(0,0,180);
  // circle(80, 80, 80);
  ellipse(200, 280, 50, 80);
  
  // change the stroke color but keep the same fill
  stroke(180,0,0);
  line( 0,0, 300, 300);
  
  let foo = radians(90);
  print(foo);                  //!!!!!!!!!!!!!!!!!!!!!!!! THIS IS VERY USEFUL!!!!!!!
  
  arc(50, 55, // center of the ellipse
      50, 50, // width and height
      0, radians(180)); // start and stop angle
  
}
