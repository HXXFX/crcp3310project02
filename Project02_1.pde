//Big bad motherfucker

Bag Bag;
//Food food;

int NUMBER_OF_FOOD = 50;
int Bag_SIZE = 50;

ArrayList <Food> food = new ArrayList<Food>();



void setup() 
{
  size(720, 720);
  Bag = new Bag(new PVector(width/2, height/2)); // pass in a pvec to Bag class

  //food = new Food(new PVector(width/2, height/2));

  for (int i = 0; i < NUMBER_OF_FOOD; i++)
  {
    food.add(new Food());
  }
} //end setup

void draw()
{
  Bag.bag();
  Bag.applyForce(new PVector(-0.1, 0));
  drawBag();
  drawFood();
  
  
  
} //end draw

void drawBag() 
{
  noFill();
  //stroke(random(255), random(255), random(255));
  rect(Bag.location.x, Bag.location.y, Bag_SIZE, Bag_SIZE);
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
  Bag.applyForce(new PVector(13, 0));
}