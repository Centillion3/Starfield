class Particle {
  double x;
  double y;
  color c;
  double angle;
  double speed;
  double curve;

  Particle() {
    x = (int)(Math.random() * 50) + 276;
    y = (int)(Math.random() * 50) + 276;
    c = color((int)(Math.random() * 255), (int)(Math.random() * 255), 
    (int)(Math.random() * 255));
    angle = Math.random() * TWO_PI;
    speed = (int)(Math.random()* 5) + 1;
    curve = (Math.random() - 0.5) * 0.05;
  }

  void move(int back) {
    angle += curve * back;
  
    x += back * Math.cos(angle) * speed;
    y += back * Math.sin(angle) * speed;
  }

  void show() {
    fill(c);
    noStroke();
    ellipse((float)x, (float)y, 5, 5);
  }
}
class OddballParticle extends Particle {

  OddballParticle() {
    super();
  }

  void show() {
    fill(255, 0, 0);
    noStroke();
    ellipse((float)x, (float)y, 15, 15);
  }
}
Particle[] particles = new Particle[500];

void setup() {
  size(600, 600);

  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }

  particles[0] = new OddballParticle();
}

int returning = 1;

void draw() {
  fill(0, 25);
  noStroke();
  rect(0, 0, width, height);

  for (int i = 0; i < particles.length; i++) {
    particles[i].move(returning);
    particles[i].show();
  }
}

void mousePressed() {
  returning *= -1;
}
