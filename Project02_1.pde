//CRCP3310 Project2
//Zongxian Huang

/**********************************************************************************
README: You do need to do anything, just watch. 
***********************************************************************************/

import java.util.*;

//GLOBAL JUNK########################################################################
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
//####################################################################################

void setup() 
{
  size(1080, 791);
  myBackground = loadImage("DataStructureSafariConceptLow2.jpg");
  bag = new Bag(new PVector(BAG_MOTION_INITAL_LOCX, BAG_MOTION_INITAL_LOCY)); // pass in a pvec to Bag class
  set = new SexySet(new PVector(SET_MOTION_INITAL_LOCX, SET_MOTION_INITAL_LOCY));
  stack = new SexyStack(new PVector(STACK_MOTION_INITAL_LOCX, STACK_MOTION_INITAL_LOCY));
  queue = new SexyQueue(new PVector(QUEUE_MOTION_INITAL_LOCX, QUEUE_MOTION_INITAL_LOCY));

  prepareColor();
  prepareFood();
} //end setup

void draw()
{
  //background(0, 255, 0);
  image(myBackground, 0, 0);

  drawAllFood();
  drawAllFucker();
} //end draw