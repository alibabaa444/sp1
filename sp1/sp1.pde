ArrayList<Ball> balls = new ArrayList<Ball>();
int numBalls = 10;

void setup() {
  size(400, 400);
  noStroke();
  for (int i = 0; i < numBalls; i++) {
    Ball ball = new Ball(random(width), random(height), random(10, 30));
    balls.add(ball);
  }
}

void draw() {
  background(220);
  for (Ball ball : balls) {
    ball.display();
    ball.move();
  }
}

void mousePressed() {
  for (int i = 0; i < numBalls; i++) {
    Ball ball = new Ball(mouseX, mouseY, random(10, 30));
    balls.add(ball);
  }
}

class Ball {
  float x, y;
  float diameter;
  float xSpeed, ySpeed;
  color col;

  Ball(float x, float y, float d) {
    this.x = x;
    this.y = y;
    diameter = d;
    xSpeed = random(-2, 2);
    ySpeed = random(-2, 2);
    col = color(random(255), random(255), random(255));
  }

  void move() {
    x += xSpeed;
    y += ySpeed;
    
    if (x > width || x < 0) {
      xSpeed *= -1;
    }
    
    if (y > height || y < 0) {
      ySpeed *= -1;
    }
  }

  void display() {
    fill(col);
    ellipse(x, y, diameter, diameter);
  }
}
