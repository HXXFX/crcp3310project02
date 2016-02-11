//Big bad motherfucker

final int NUMBER_OF_FOOD = 500;
final int NUMBER_OF_COLORS = 10;

final int FOOD_LEFT_BOUNDARY = 0;
final int FOOD_RIGHT_BOUNDARY = 1080;
final int FOOD_TOP_BOUNDARY = 0;
final int FOOD_BOTTOM_BOUNDARY = 1080/2;

final int BAG_MOTION_INITAL_LOCX = 50;
final int BAG_MOTION_INITAL_LOCY = 60;
final int SET_MOTION_INITAL_LOCX = 50;
final int SET_MOTION_INITAL_LOCY = 190;
final int STACK_MOTION_INITAL_LOCX = 50;
final int STACK_MOTION_INITAL_LOCY = 290;
final int TREE_MOTION_INITAL_LOCX = 50;
final int TREE_MOTION_INITAL_LOCY = 490;

final int  FUCKERS_MOTION_LEFT_BOUNDARY = 0;
final int  FUCKERS_MOTION_RIGHT_BOUNDARY = 1080;
final int  FUCKERS_MOTION_TOP_BOUNDARY = 0;
final int  FUCKERS_MOTION_BOTTOM_BOUNDARY = 1080/2;

Bag bag;
Set set;
Stack stack;
Tree tree;

ArrayList <Food> foods = new ArrayList<Food>();
color[] colorPalette = new color[NUMBER_OF_COLORS];

void setup() 
{
  size(1080, 1080);
  bag = new Bag(new PVector(BAG_MOTION_INITAL_LOCX, BAG_MOTION_INITAL_LOCY)); // pass in a pvec to Bag class
  set = new Set(new PVector(SET_MOTION_INITAL_LOCX, SET_MOTION_INITAL_LOCY));
  stack = new Stack(new PVector(STACK_MOTION_INITAL_LOCX, STACK_MOTION_INITAL_LOCY));
  tree = new Tree(new PVector(TREE_MOTION_INITAL_LOCX, TREE_MOTION_INITAL_LOCY));

  for (int i = 0; i < NUMBER_OF_COLORS; i++)
  {
    colorPalette[i] = color(random(0, 200));
  }

  for (int i = 0; i < NUMBER_OF_FOOD; i++)
  {
    //food.add(new Food());
    PVector foodLoc = new PVector(random(FOOD_LEFT_BOUNDARY, FOOD_RIGHT_BOUNDARY), random(FOOD_TOP_BOUNDARY, FOOD_BOTTOM_BOUNDARY));
    color foodCol = colorPalette[(int)random(0, NUMBER_OF_COLORS)];
    foods.add( new Food(foodLoc, foodCol) );
  }
} //end setup

void draw()
{
  background(0, 255, 0);

  drawFood();

  bag.bagMotion();
  bag.applyForce(new PVector(-0.1, 0));
  bag.drawBag();

  set.setMotion();
  set.drawSet();

  stack.stackMotion();
  stack.drawStack();

  tree.treeMotion();
  tree.drawTree();
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

    if (set.isTouching(f))
    {
      set.eat(f);
      foods.remove(f);
    }
    if (stack.isTouching(f))
    {
      stack.eat(f);
      foods.remove(f);
    }
    if (tree.isTouching(f))
    {
      tree.eat(f);
      foods.remove(f);
    }
  }
}

void mousePressed()
{
  bag.applyForce(new PVector(13, 0));
}