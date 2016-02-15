import java.util.*;

//Big bad motherfucker

PImage myBackground;

ArrayList<Food> bagData = new ArrayList<Food>();
//Set<Food> setData = new HashSet<Food>();
ArrayList<Food> setData = new ArrayList<Food>();
Stack<Food> stackData = new Stack<Food>();
Queue<Food> queueData = new LinkedList<Food>();

final int NUMBER_OF_FOOD = 15;
final int NUMBER_OF_COLORS = 5;

final int FOOD_LEFT_BOUNDARY = 200;
final int FOOD_RIGHT_BOUNDARY = 335;
final int FOOD_TOP_BOUNDARY = 110;
final int FOOD_BOTTOM_BOUNDARY = 335;

final int BAG_MOTION_INITAL_LOCX = 133;
final int BAG_MOTION_INITAL_LOCY = 135;
final int SET_MOTION_INITAL_LOCX = 133;
final int SET_MOTION_INITAL_LOCY = 180;
final int STACK_MOTION_INITAL_LOCX = 133;
final int STACK_MOTION_INITAL_LOCY = 301;
final int QUEUE_MOTION_INITAL_LOCX = 133;
final int QUEUE_MOTION_INITAL_LOCY = 247;

final int  FUCKERS_MOTION_LEFT_BOUNDARY = 200;
final int  FUCKERS_MOTION_RIGHT_BOUNDARY = 1000;
final int  FUCKERS_MOTION_TOP_BOUNDARY = 140;
final int  FUCKERS_MOTION_BOTTOM_BOUNDARY = 341;

Bag bag;
SexySet set;
SexyStack stack;
SexyQueue queue;

ArrayList <Food> foods = new ArrayList<Food>();  //eat
ArrayList <Food> foods1 = new ArrayList<Food>(); //delete
ArrayList <Food> foods2 = new ArrayList<Food>(); //eat
ArrayList <Food> foods3 = new ArrayList<Food>(); //delete
ArrayList <Food> foods4 = new ArrayList<Food>(); //eat

color[] colorPalette = new color[NUMBER_OF_COLORS];

void setup() 
{
  size(1080, 791);
  myBackground = loadImage("DataStructureSafariConceptLow2.jpg");
  bag = new Bag(new PVector(BAG_MOTION_INITAL_LOCX, BAG_MOTION_INITAL_LOCY)); // pass in a pvec to Bag class
  set = new SexySet(new PVector(SET_MOTION_INITAL_LOCX, SET_MOTION_INITAL_LOCY));
  stack = new SexyStack(new PVector(STACK_MOTION_INITAL_LOCX, STACK_MOTION_INITAL_LOCY));
  queue = new SexyQueue(new PVector(QUEUE_MOTION_INITAL_LOCX, QUEUE_MOTION_INITAL_LOCY));

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

  pushMatrix();
  drawFood2();
  popMatrix();

  pushMatrix();
  drawFood3();
  popMatrix();

  pushMatrix();
  drawFood4();
  popMatrix();

  bag.bagMotion();
  bag.drawBag();

  set.setMotion();
  set.drawSet();

  stack.stackMotion();
  stack.drawStack();

  queue.queueMotion();
  queue.drawQueue();
} //end draw