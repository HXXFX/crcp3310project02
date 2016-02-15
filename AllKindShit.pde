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