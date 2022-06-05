
This document: Lecture Notes

**This is subject to change**

### June 2

- Download Processing from [here](https://processing.org/download). 
- Download and install Arduino from
  [here](https://www.arduino.cc/en/Main/Software).
  If you are on Windows chose either the
  Windows Installer ("Windows Win 7 and newer")
  or install from
  the Microsoft App Store ("Windows app Win 8.1 or 10")

#### What’s the class about?

- Media with which we interact. This could be
	- Screen based
	- Physical with motors, lights, lasers
	- Non-technical, such as 
		- Signage (e.g. wayfinding)
		- Human traffic flow e.g. at an airport or a cafeteria

**Interactive Media is not just about technology**. It includes
- Design of physical objects
- Design of spaces
- Human computer interface
- Human human interface
- Information representation
- Ergonomics
- Inclusive design

What else can you think of that belongs on this list?

What kind of tools are useful in creating Interactive Media projects?
- Video
- Audio
- Touch screens
- Paper and pencil
- Our brains
- Talking to people who might use the end result
- Asking lots of questions
- Listening more than talking
- Testing ideas (prototypes) very early in the process, even before plans are
	complete (the plans could be based in faulty assumptions!)

What else can you think of that belongs on this list?

Arduino is just one of many tools that we find helpful

#### Introduction to Arduino

- IDE
- blink
	- Upload the Blink example
	- Change the parameter in delay()
	- Upload again and verify that the LED blinks at the new rate
- What is a program?
- What is a circuit?

What if want to work with more than just the LED on the Arduino?
- Arduino has many connections called *pins*
	- 20 pins
	- Arduino provides LED on pin 13
	- LED_BUILTIN = 13 

How will connect to these pins?

https://github.com/michaelshiloh/IntroductionToInteractiveMedia/blob/master/

The most confusing part of this course is usually the solderless breadboard:
![](https://github.com/michaelshiloh/IntroductionToInteractiveMedia/blob/master/media/breadboard.jpg)
Image courtesy of
[SparkFun](https://learn.sparkfun.com/tutorials/how-to-use-a-breadboard/all)

Let's extend this circuit to the breadboard:

![](https://github.com/michaelshiloh/IntroductionToInteractiveMedia/blob/master/media/ArduinoControllingLED_schem.png)
![](https://github.com/michaelshiloh/IntroductionToInteractiveMedia/blob/master/media/ArduinoControllingLED_bb.png)

#### Digital Input

Adding a switch

![](https://github.com/michaelshiloh/IntroductionToInteractiveMedia/blob/master/media/ArduinoLEDMomentarySwitch_schem.png)
![](https://github.com/michaelshiloh/IntroductionToInteractiveMedia/blob/master/media/ArduinoLEDMomentarySwitch_bb.png)

````
void setup() {
  pinMode(8, OUTPUT);
  pinMode(13, OUTPUT);
  pinMode(A2, INPUT);
}

void loop() {

  int switchPosition = digitalRead(A2);

  if (switchPosition == HIGH) {
    digitalWrite(8, HIGH);   // turn the LED on (HIGH is the voltage level)
    digitalWrite(13, LOW);
  } else  {
    digitalWrite(8, LOW);    // turn the LED off by making the voltage LOW
    digitalWrite(13, HIGH);
  }
}
````

An example:

````

const int pushButton = A2;
const int redLEDPin = A0;
const int greenLEDPin = 8;

void setup() {
  pinMode(redLEDPin, OUTPUT);
  pinMode(greenLEDPin, OUTPUT);
}

void loop() {

  int buttonState = digitalRead(pushButton);

  if (buttonState == HIGH) {
    digitalWrite(redLEDPin, HIGH);
    digitalWrite(greenLEDPin, HIGH);
    delay(500);
    digitalWrite(greenLEDPin, LOW);
    delay(300);
    digitalWrite(redLEDPin, LOW);
    digitalWrite(greenLEDPin, HIGH);
    delay(700);
  }
  allOff();
  delay(1000);
}

void allOff() {
  digitalWrite(redLEDPin, LOW);
  digitalWrite(greenLEDPin, LOW);
}
````

Other things you can do:

Add another LED on a different pin

![](https://github.com/michaelshiloh/IntroductionToInteractiveMedia/blob/master/media/ArduinoTwoLEDs_schem.png)
![](https://github.com/michaelshiloh/IntroductionToInteractiveMedia/blob/master/media/ArduinoTwoLEDs_bb.png)

Add another switch on a different pin

![](https://github.com/michaelshiloh/IntroductionToInteractiveMedia/blob/master/media/ArduinoTwoSwitches_schem.png)
![](https://github.com/michaelshiloh/IntroductionToInteractiveMedia/blob/master/media/ArduinoTwoSwitches_bb.png)

#### In-class exercise

Now write a program that will blink different patterns depending on which
switch is pressed. 
Using two switches you can select between four patterns.
How is that possible?

### June 3
#### Motor Driver 

Circuit Schematic

![](https://github.com/michaelshiloh/IntroductionToInteractiveMedia/blob/master/media/arduinoSparkFunMotorDriver_schem.jpg)

How did I choose which pins to use?
- Never use pins 0 and 1 (dedicated for USB communication)
- Avoid pin 13 if possible (it flashes 3 times on reset)
- Directional control pins (ain1, ain2, bin1, bin2) only require
	digital signals so avoid pins with extra functionality 
	(analog input, SPI, PWM)
- Inclusion of the servo library 
	disables `analogWrite()` on pins 9 and 10
	(I'm not using the servo library now but perhaps I'll add it later)
- Use of the `tone()` function 
	disables `analogWrite()` on pins 3 and 11
	(I'm not using the `tone()` function now but perhaps I'll add it later)
- This leaves PWM pins 5 and 6 for the speed controls (pwma and pwmb)
- Might as well choose nearby digital pins

Code

````

const int ain1Pin = 3;
const int ain2Pin = 4;
const int pwmAPin = 5;

const int bin1Pin = 8;
const int bin2Pin = 7;
const int pwmBPin = 6;


void setup() {
  pinMode(ain1Pin, OUTPUT);
  pinMode(ain2Pin, OUTPUT);
  pinMode(pwmAPin, OUTPUT); // not needed really
}

void loop() {
  // turn in one direction, full speed
  Serial.println("full speed");
  analogWrite(pwmAPin, 255);
  digitalWrite(ain1Pin, HIGH);
  digitalWrite(ain2Pin, LOW);
  // stay here for a second
  delay(1000);

  // slow down
  Serial.println("slowing down");
  int speed = 255;
  while (speed--) {
    analogWrite(pwmAPin, speed);
    delay(20);
  }
}

````

Here is the code that Noah developed to control the motor speed and
direction using a potentiometer:

````
const int ain1Pin = 3;
const int ain2Pin = 4;
const int pwmAPin = 5;

const int bin1Pin = 8;
const int bin2Pin = 7;
const int pwmBPin = 6;

const int potPin = A5;


void setup() {
  pinMode(ain1Pin, OUTPUT);
  pinMode(ain2Pin, OUTPUT);
  pinMode(pwmAPin, OUTPUT); // not needed really
}

void loop() {
  int potVal = analogRead(potPin);
  delay(20);
  if (potVal > 1023 / 2) { //counterclockwise
    digitalWrite(ain1Pin, HIGH);
    digitalWrite(ain2Pin, LOW);
    analogWrite(pwmAPin, potVal / 4);
  } else { //clockwise
    digitalWrite(ain1Pin, LOW);
    digitalWrite(ain2Pin, HIGH);
    analogWrite(pwmAPin, 255 - potVal / 4);
  }
}
````

#### Responsive Interactions: Avoiding the use of Delay

Tutorial](https://www.arduino.cc/en/Tutorial/BlinkWithoutDelay)


### June 6
#### Robots!

- Decide: Humanoid? Animal? Neither?
- Make a body
- Give it the ability to move 
- Option: add servo motor

Time permitting:

#### Multitasking without `delay()`

So much for blinking. What if we want to move a servo motor at the same time?

Adafruit [Multitasking Tutorial Part
I](https://learn.adafruit.com/multi-tasking-the-arduino-part-1?view=all)

Play a melody and blink an LED
without using `delay()`:
[toneMelodyAndBlinkWithoutDelay](https://github.com/michaelshiloh/toneMelodyAndBlinkWithoutDelay)

#### Human-Robot Interaction

- Michal's video [lecture](https://www.youtube.com/watch?v=MX0TqQEE1o0)

Some of the important points:

Human Computer Interactions (HRI)
and ethical questions

What is a robot?
- Difference between robot & computer: robot has a body and can move

3 types of robots:
- industrial robots: replaces people in various manual industry
- service robots: interacts more with people
- social robots: designed mainly for its interaction with people

HRI
- When people interact with objects, we related differently if we see a face
- Designers know this and put in a face
- Even when it isn't designed we look for a face

- We project human-human behavior to computer-human interactions
- We do this much more with robots
- We do this even though we know they are robots

Hitchbot
- Designed to look homeless
- very simple technically, was just to  his destination
- Was able to cross the country due to empathy he generated
- Was "murdered" in Philadelphia

Roomba: People sad when Roomba malfunctioned
other: apparently people have an easier time learning second language w/ robot

Paro - therapeutic robot for the elderly
- looks like a baby seal
- note that the demonstrating woman refers to robot as "he" not "it"

Jibo - MIT grads, lots of energy and money put into the project

Uncanny valley - discomfort around things that are very much like humans, 
	but aren't 
	- Note where corpse is
	- note that things that move make us more uncomfortable
	- robot designers must be very aware of this

Darling et al: would people be willing to break ("kill") bots?
	- done with very simple "bristle bots"

Exoskellaton

Guy Hoffman
- Background in animation
- Paid a lot of attention the movements of the lamp
- Does not move like a robot
- Invokes empathy
- White robot (kip) carries  on this project
	- Reacts to loud noise by being startled

Elliq - installed next to tablet and draws user's attention to tablet
Asimo and face - maybe more uncanny valley
all robots at CES2017 are trying to stay away from Uncanny Valley

what about size?
- robots used to be human sized
- now smaller, like pets

voice?
- "peppy" etc

Behavior?
- google team

**Is it ethical and smart to suggest to people that robots are not machines?**

Sherry Turkle asked children if they would want robot babysitter

Problems?
- Is this a form of lying?
	- it is directed against weakest elements of society (children, elderly,
		mentaly disabled)
- argument is that this is a supplement and not a replacement for humans
	- can we keep that up?
- one sided emotional relationship
- Some possible paths:
	- prohibit

now we move from ethical questions of using robots to questions of ethical
treatement of robots

boston dynamics videos aroused response against violence towards robots

- children were violent towards robot
- adults vandalized K5 surveillance robot

