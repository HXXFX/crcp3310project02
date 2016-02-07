//Big bad motherfucker

Walker walker;
//Food food;

int NUMBER_OF_FOOD = 50;
int WALKER_SIZE = 50;

ArrayList <Food> food = new ArrayList<Food>();


void setup() 
{
  size(720, 720);
  walker = new Walker(new PVector(width/2, height/2)); // pass in a pvec to walker class

  //food = new Food(new PVector(width/2, height/2));

  for (int i = 0; i < NUMBER_OF_FOOD; i++)
  {
    food.add(new Food());
  }
} //end setup

void draw()
{
  walker.walk();
  walker.applyForce(new PVector(-0.1, 0));
  drawWalker();
  drawFood();
} //end draw

void drawWalker() 
{
  noFill();
  //stroke(random(255), random(255), random(255));
  rect(walker.location.x, walker.location.y, WALKER_SIZE, WALKER_SIZE);
}

void drawFood()
{
  //noFill();
  //ellipse(food.location.x, food.location.y, 200, 200);
  for (Food f : food)
  {
    f.drawFoodEllipse();
  }
}


void mousePressed()
{
  walker.applyForce(new PVector(13, 0));
}