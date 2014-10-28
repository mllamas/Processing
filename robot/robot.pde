ArrayList<Robot> robots;
int numberOfRobots = 6;

void setup() {
  size(640, 480);
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
