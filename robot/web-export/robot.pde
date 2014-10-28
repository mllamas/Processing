ArrayList<Robot> robots;
int numberOfRobots = 6;

void setup() {
  size(400, 300);
  robots = new ArrayList<Robot>();
  float scale = 0.4;
  for (int i = 0; i < numberOfRobots; ++i) {
    color robotColor = color(random(100), random(100), random(100), 40);
    robots.add(new Robot(robotColor, scale));
    scale *= 0.9;
  }
}

void draw() {
  background(255);

  robots.get(0).moveTo(mouseX, mouseY);
  robots.get(0).draw();

  for (int i = 1; i < numberOfRobots; ++i) {
    Robot previousRobot = robots.get(i-1);
    Robot currentRobot = robots.get(i);
    currentRobot.easeTowards(previousRobot.x, previousRobot.y, 0.05);
    currentRobot.draw();
  }
}
 class Robot {
  float x = 0;//location of robot
  float y = 0;//location of robot
  float scale = 1; //size of robot
  int robotColor;
  
  Robot(int robotColor_, float scale_) {
    robotColor = robotColor_;
    scale = scale_;
  }

  void moveTo(float x_, float y_) {
    x = x_;
    y = y_;
  }

  void draw() {
    pushMatrix();
    fill(robotColor);
    noStroke();
    translate(x, y);

    //draw body of robot
    float bodyWidth = 100 * scale;
    float bodyHeight = 150 * scale;
    float yTopOfBody = -bodyHeight/2;
    rect(-bodyWidth/2, yTopOfBody, bodyWidth, bodyHeight);

    //draw neck of robot
    float neckWidth = 30 * scale;
    float neckHeight = 80*(1+cos(millis() * 0.001 / scale)) * scale;
    float yTopOfNeck = yTopOfBody - neckHeight;
    rect(-neckWidth/2, yTopOfNeck, neckWidth, neckHeight);

    //draw head of robot
    float headWidth = 140 * scale;
    float headHeight = 30 * scale;
    float yTopOfHead = yTopOfNeck - headHeight;
    rect(-headWidth/2, yTopOfHead, headWidth, headHeight);
    popMatrix();
  }

  void easeTowards(float targetX, float targetY, float easing) {
    float dx = targetX - x;
    if (abs(dx) > 1) {
      x += dx * easing;
    }

    float dy = targetY - y;
    if (abs(dy) > 1) {
      y += dy * easing;
    }
  }
}

