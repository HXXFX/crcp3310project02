import java.util.*;

//Big bad motherfucker

final int NUMBER_OF_FOOD = 50;
final int NUMBER_OF_COLORS = 10;

final int FOOD_LEFT_BOUNDARY = 30;
final int FOOD_RIGHT_BOUNDARY = 200;
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

Set <Food> adsfasdfasdf = new Set<Food>();

ArrayList <Food> foods = new ArrayList<Food>();
ArrayList <Food> foods1 = new ArrayList<Food>();

ArrayList <Food> foods2 = new ArrayList<Food>(); //delete zone

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
    colorPalette[i] = color(random(100, 250), random(100, 250), random(100, 250));
  }

  for (int i = 0; i < NUMBER_OF_FOOD; i++)
  {
    //food.add(new Food());
    PVector foodLoc = new PVector(random(FOOD_LEFT_BOUNDARY, FOOD_RIGHT_BOUNDARY), random(FOOD_TOP_BOUNDARY, FOOD_BOTTOM_BOUNDARY));
    color foodCol = colorPalette[(int)random(0, NUMBER_OF_COLORS)];
    foods.add( new Food(foodLoc, foodCol) );

    PVector foodLoc1 = new PVector(random(FOOD_LEFT_BOUNDARY+800, FOOD_RIGHT_BOUNDARY+800), random(FOOD_TOP_BOUNDARY, FOOD_BOTTOM_BOUNDARY));
    color foodCol1 = colorPalette[(int)random(0, NUMBER_OF_COLORS)];
    foods1.add( new Food(foodLoc1, foodCol1) );

    PVector foodLoc2 = new PVector(random(FOOD_LEFT_BOUNDARY+400, FOOD_RIGHT_BOUNDARY+400), random(FOOD_TOP_BOUNDARY, FOOD_BOTTOM_BOUNDARY));
    color foodCol2 = colorPalette[(int)random(0, NUMBER_OF_COLORS)];
    foods2.add( new Food(foodLoc2, foodCol2) );
  }
} //end setup

void draw()
{
  background(0, 255, 0);

  drawFood();

  pushMatrix();
  drawFood1();
  popMatrix();

  pushMatrix();
  drawFood2();
  popMatrix();

  bag.bagMotion();
  bag.applyForce(new PVector(-0.1, 0));
  bag.drawBag();

  //set.setMotion();
  //set.drawSet();

  //stack.stackMotion();
  //stack.drawStack();

  //tree.treeMotion();
  //tree.drawTree();
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

void drawFood1()
{
  for (int i = foods1.size() - 1; i >= 0; --i)
  {
    Food f = foods1.get(i);
    f.drawFoodEllipse();
    if (bag.isTouching(f))
    {
      bag.eat(f);
      foods1.remove(f);
    }

    if (set.isTouching(f))
    {
      set.eat(f);
      foods1.remove(f);
    }
    if (stack.isTouching(f))
    {
      stack.eat(f);
      foods1.remove(f);
    }
    if (tree.isTouching(f))
    {
      tree.eat(f);
      foods1.remove(f);
    }
  }
}


void drawFood2()
{
  for (int i = foods2.size() - 1; i >= 0; --i)
  {
    Food f = foods2.get(i);
    f.drawFoodEllipse();
    if (bag.isTouching(f))
    {
      bag.shitOut(f);
      foods2.remove(f);
    }
  }
}


void mousePressed()
{
  bag.applyForce(new PVector(13, 0));
}