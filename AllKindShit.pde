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

    if (queue.isTouching(f))
    {
      queue.eat(f);
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

    //forbag
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

    //forset
    for (int j = 0; j < setData.size(); j ++)
    {
      Food d = setData.get(j);
      if (set.isTouching(f))
      {
        foods1.remove(f);
        if (f.foodColor == d.foodColor)
        {
          setData.remove(d);
          println("set is shiting");
        }
      }
    }

    //forstack
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

    //forqueue
    for (int j = 0; j < queueData.size(); j ++)
    {
      Food dQueue = queueData.peek();
      if (queue.isTouching(f))
      {
        foods1.remove(f);
        if (f.foodColor == dQueue.foodColor)
          //if (f.foodColor == dStack.foodColor)
        {
          queueData.remove(dQueue);
          println("queue is shiting");
        }
      }
    }
    //
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
      bag.eat(f);
      foods2.remove(f);
    }

    if (set.isTouching(f))
    {
      set.eat(f);
      foods2.remove(f);
    }

    if (stack.isTouching(f))
    {
      stack.eat(f);
      foods2.remove(f);
    }

    if (queue.isTouching(f))
    {
      queue.eat(f);
      foods2.remove(f);
    }
  }
}

void drawFood3()
{
  for (int i = foods3.size() - 1; i >= 0; --i)
  {

    Food f = foods3.get(i);
    f.drawFoodEllipse();

    //forbag
    for (int j = 0; j < bagData.size(); j ++)
    {
      Food d = bagData.get(j);
      if (bag.isTouching(f))
      {
        foods3.remove(f);
        if (f.foodColor == d.foodColor)
        {
          bagData.remove(d);
          println("bag is shiting");
        }
      }
    }

    //forset
    for (int j = 0; j < setData.size(); j ++)
    {
      Food d = setData.get(j);
      if (set.isTouching(f))
      {
        foods3.remove(f);
        if (f.foodColor == d.foodColor)
        {
          setData.remove(d);
          println("set is shiting");
        }
      }
    }

    //forstack
    for (int j = 0; j < stackData.size(); j ++)
    {
      Food dStack = stackData.peek();
      if (stack.isTouching(f))
      {
        foods3.remove(f);
        if (f.foodColor == dStack.foodColor)
          //if (f.foodColor == dStack.foodColor)
        {
          stackData.remove(dStack);
          println("stack is shiting");
        }
      }
    }

    //forqueue
    for (int j = 0; j < queueData.size(); j ++)
    {
      Food dQueue = queueData.peek();
      if (queue.isTouching(f))
      {
        foods3.remove(f);
        if (f.foodColor == dQueue.foodColor)
          //if (f.foodColor == dStack.foodColor)
        {
          queueData.remove(dQueue);
          println("queue is shiting");
        }
      }
    }
    //
  }
}

void drawFood4()
{
  for (int i = foods4.size() - 1; i >= 0; --i)
  {
    Food f = foods4.get(i);

    f.drawFoodEllipse();
    if (bag.isTouching(f))
    {
      bag.eat(f);
      foods4.remove(f);
    }

    if (set.isTouching(f))
    {
      set.eat(f);
      foods4.remove(f);
    }

    if (stack.isTouching(f))
    {
      stack.eat(f);
      foods4.remove(f);
    }

    if (queue.isTouching(f))
    {
      queue.eat(f);
      foods4.remove(f);
    }
  }
}

void mousePressed()
{
  bag.applyForce(new PVector(13, 0));
}

void prepareColor()
{
  for (int i = 0; i < NUMBER_OF_COLORS; i++)
  {
    colorPalette[i] = color(random(100, 250), random(100, 250), random(100, 250));
  }
}

void prepareFood()
{
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
}

void drawAllFood()
{
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
}

void drawAllFucker()
{
  bag.bagMotion();
  bag.drawBag();

  set.setMotion();
  set.drawSet();

  stack.stackMotion();
  stack.drawStack();

  queue.queueMotion();
  queue.drawQueue();
}