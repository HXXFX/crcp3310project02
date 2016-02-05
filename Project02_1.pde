Walker walker;


void setup() {
  size(720, 720);
  walker = new Walker(new PVector(20, 20));
}

void draw() {
  walker.walk();
  drawWalker();
}

void drawWalker() {
  stroke(random(255), random(255), random(255));
  rect(walker.location.x, walker.location.y, 100, 100);
}