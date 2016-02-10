//Big bad motherfucker

Bag bag;
ArrayList <Food> foods = new ArrayList<Food>();

final int NUMBER_OF_FOOD = 100;
final int NUMBER_OF_COLORS = 10;

color[] colorPalette = new color[NUMBER_OF_COLORS];

int BAG_SIZE = 50;


void setup() 
{
  size(1080, 1080);
  bag = new Bag(new PVector(width/2, height/2)); // pass in a pvec to Bag class

  //food = new Food(new PVector(width/2, height/2));

  for (int i = 0; i < NUMBER_OF_COLORS; i++)
  {
    colorPalette[i] = color(random(0, 200));
  }

  for (int i = 0; i < NUMBER_OF_FOOD; i++)
  {
    //food.add(new Food());
    PVector foodLoc = new PVector(random(0, width), random(0, height));
    color foodCol = colorPalette[(int)random(0, NUMBER_OF_COLORS)];
    foods.add( new Food(foodLoc, foodCol) );
  }
} //end setup

void draw()
{
  background(0, 255, 0);
  bag.bagMotion();
  bag.applyForce(new PVector(-0.1, 0));
  bag.drawBag();
  drawFood();
} //end draw




 void drawFood()
{

  for (int i = foods.size() - 1; i >= 0; --i)
  {
    Food f = foods.get(i);
    f.drawFoodEllipse();
    if (bag.isTouching(f))
    {
      bag.eat(f);
      foods.remove(f);
    }
  }
}

void mousePressed()
{
  bag.applyForce(new PVector(13, 0));
}