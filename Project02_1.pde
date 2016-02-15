import java.util.*;

//Big bad motherfucker

PImage myBackground;

ArrayList<Food> bagData = new ArrayList<Food>();
Set<Food> setData = new HashSet<Food>();
//ArrayList<Food> stackData = new ArrayList<Food>();
Stack<Food> stackData = new Stack<Food>();



final int NUMBER_OF_FOOD = 30;
final int NUMBER_OF_COLORS = 5;

final int FOOD_LEFT_BOUNDARY = 200;
final int FOOD_RIGHT_BOUNDARY = 335;
final int FOOD_TOP_BOUNDARY = 104;
final int FOOD_BOTTOM_BOUNDARY = 341;

final int BAG_MOTION_INITAL_LOCX = 133;
final int BAG_MOTION_INITAL_LOCY = 135;
final int SET_MOTION_INITAL_LOCX = 133;
final int SET_MOTION_INITAL_LOCY = 180;
final int STACK_MOTION_INITAL_LOCX = 133;
final int STACK_MOTION_INITAL_LOCY = 301;
final int TREE_MOTION_INITAL_LOCX = 50;
final int TREE_MOTION_INITAL_LOCY = 490;

final int  FUCKERS_MOTION_LEFT_BOUNDARY = 200;
final int  FUCKERS_MOTION_RIGHT_BOUNDARY = 1000;
final int  FUCKERS_MOTION_TOP_BOUNDARY = 140;
final int  FUCKERS_MOTION_BOTTOM_BOUNDARY = 341;

Bag bag;
SexySet set;
SexyStack stack;
Tree tree;

//Set <Food> adsfasdfasdf = new Set<Food>();

ArrayList <Food> foods = new ArrayList<Food>();  //eat
ArrayList <Food> foods1 = new ArrayList<Food>(); //delete
ArrayList <Food> foods2 = new ArrayList<Food>(); //eat
ArrayList <Food> foods3 = new ArrayList<Food>(); //delete
ArrayList <Food> foods4 = new ArrayList<Food>(); //eat

color[] colorPalette = new color[NUMBER_OF_COLORS];

void setup() 
{
  size(1080, 791);
  myBackground = loadImage("DataStructureSafariConceptLow.jpg");
  bag = new Bag(new PVector(BAG_MOTION_INITAL_LOCX, BAG_MOTION_INITAL_LOCY)); // pass in a pvec to Bag class
  set = new SexySet(new PVector(SET_MOTION_INITAL_LOCX, SET_MOTION_INITAL_LOCY));
  stack = new SexyStack(new PVector(STACK_MOTION_INITAL_LOCX, STACK_MOTION_INITAL_LOCY));
  //tree = new Tree(new PVector(TREE_MOTION_INITAL_LOCX, TREE_MOTION_INITAL_LOCY));

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

    PVector foodLoc1 = new PVector(random(358, 509), random(FOOD_TOP_BOUNDARY, FOOD_BOTTOM_BOUNDARY));
    color foodCol1 = colorPalette[(int)random(0, NUMBER_OF_COLORS)];
    foods1.add( new Food(foodLoc1, foodCol1) );

    PVector foodLoc2 = new PVector(random(523, 670), random(FOOD_TOP_BOUNDARY, FOOD_BOTTOM_BOUNDARY));
    color foodCol2 = colorPalette[(int)random(0, NUMBER_OF_COLORS)];
    foods2.add( new Food(foodLoc2, foodCol2) );

    PVector foodLoc3 = new PVector(random(688, 834), random(FOOD_TOP_BOUNDARY, FOOD_BOTTOM_BOUNDARY));
    color foodCol3 = colorPalette[(int)random(0, NUMBER_OF_COLORS)];
    foods3.add( new Food(foodLoc3, foodCol3) );

    PVector foodLoc4 = new PVector(random(850, 985), random(FOOD_TOP_BOUNDARY, FOOD_BOTTOM_BOUNDARY));
    color foodCol4 = colorPalette[(int)random(0, NUMBER_OF_COLORS)];
    foods4.add( new Food(foodLoc4, foodCol4) );
  }
} //end setup

void draw()
{
  //background(0, 255, 0);
  image(myBackground, 0, 0);
  
  pushMatrix();
  drawFood();
  popMatrix();
  
  pushMatrix();
  drawFood1();
  popMatrix();

  //pushMatrix();
  //drawFood2();
  //popMatrix();

  //pushMatrix();
  //drawFood3();
  //popMatrix();

  //pushMatrix();
  //drawFood4();
  //popMatrix();

  bag.bagMotion();
  //bag.applyForce(new PVector(-0.1, 0));
  bag.drawBag();

  set.setMotion();
  set.drawSet();

  stack.stackMotion();
  stack.drawStack();

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
    //if (tree.isTouching(f))
    //{
    //  tree.eat(f);
    //  foods.remove(f);
    //}
  }
}



void drawFood1()
{
  for (int i = foods1.size() - 1; i >= 0; --i)
  {

    Food f = foods1.get(i);
    f.drawFoodEllipse();
    for (int j = 0; j < bagData.size(); j ++)
    {
      Food d = bagData.get(j);
      if (bag.isTouching(f))
      {
        foods1.remove(f);
        if (f.foodColor == d.foodColor)
        {
          bagData.remove(d);
          println("bag is shiting");
        }
      }
    }


    //for (int j = 0; j < stackData.size(); j ++)
    //{
    //  //Food dStack = stackData.search(in j);
    //  //Food topDStack = stackData.get(stackData.size());
    //  if (stack.isTouching(f))
    //  {
    //    foods1.remove(f);
    //    if (f.foodColor == dStack.foodColor)
    //      //if (f.foodColor == dStack.foodColor)
    //    {
    //      println("????");
    //      stackData.remove(dStack);
    //      println("stack is shiting");
    //    }
    //  }
    //}


    for (int j = 0; j < stackData.size(); j ++)
    {
     Food dStack = stackData.peek();
     if (stack.isTouching(f))
     {
       foods1.remove(f);
       if (f.foodColor == dStack.foodColor)
         //if (f.foodColor == dStack.foodColor)
       {
         stackData.remove(dStack);
         println("stack is shiting");
       }
     }
    }
  }
}


//void drawFood2()
//{
//  for (int i = foods2.size() - 1; i >= 0; --i)
//  {
//    Food f = foods2.get(i);
//    f.drawFoodEllipse();
//    if (bag.isTouching(f))
//    {
//      bag.eat(f);
//      foods2.remove(f);
//    }

//    if (set.isTouching(f))
//    {
//      set.eat(f);
//      foods2.remove(f);
//    }
//    if (stack.isTouching(f))
//    {
//      stack.eat(f);
//      foods2.remove(f);
//    }
//    if (tree.isTouching(f))
//    {
//      tree.eat(f);
//      foods2.remove(f);
//    }
//  }
//}

//void drawFood3()
//{
//  for (int i = foods3.size() - 1; i >= 0; --i)
//  {

//    Food f = foods3.get(i);
//    f.drawFoodEllipse();
//    for (int j = 0; j < bagData.size(); j ++)
//    {
//      Food d = bagData.get(j);
//      if (bag.isTouching(f))
//      {
//        foods3.remove(f);
//        if (f.foodColor == d.foodColor)
//        {
//          bagData.remove(d);
//          println("bag is shiting");
//        }
//      }
//    }
//  }
//}

//void drawFood4()
//{
//  for (int i = foods4.size() - 1; i >= 0; --i)
//  {
//    Food f = foods4.get(i);
//    f.drawFoodEllipse();
//    if (bag.isTouching(f))
//    {
//      bag.eat(f);
//      foods4.remove(f);
//    }

//    if (set.isTouching(f))
//    {
//      set.eat(f);
//      foods4.remove(f);
//    }
//    if (stack.isTouching(f))
//    {
//      stack.eat(f);
//      foods4.remove(f);
//    }
//    if (tree.isTouching(f))
//    {
//      tree.eat(f);
//      foods4.remove(f);
//    }
//  }
//}

void mousePressed()
{
  bag.applyForce(new PVector(13, 0));
}