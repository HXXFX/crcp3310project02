Walker walker;
Food food;

void setup() {
  size(720, 720);
  walker = new Walker(new PVector(width/2, height/2)); // pass in a pvec to walker class
  food = new Food(new PVector(width/2, height/2));
}

void draw() {
  walker.walk();
  walker.applyForce(new PVector(-0.1, 0));
  drawWalker();
}

void drawWalker() {
  //stroke(random(255), random(255), random(255));
  rect(walker.location.x, walker.location.y, 100, 100);
  ellipse(food.location.x, food.location.y, 200, 200);
}

void mousePressed()
{
 walker.applyForce(new PVector(13, 0)); 
}