class SexyQueue 
{
  //CONTROL PANLE
  final float NOISE_DELTA = 0.04;
  final int MAX_VELOCITY = 1;
  final float Tendency_TO_RIGHT = 1.6;
  final int QUEUE_DIAMETER = 25;
  final int QUEUE_FOOD_DIAMETER = 10;
  final int QUEUE_FOOD_LEFT_BOUNDARY = 773;
  final int QUEUE_FOOD_RIGHT_BOUNDARY = 990;
  final int QUEUE_FOOD_TOP_BOUNDARY = 525;
  final int QUEUE_FOOD_BOTTOM_BOUNDARY = 685; 

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector tendency; //wind to right
  float xOffset;

  public SexyQueue(PVector initialLocation)  //constr intoalize var ... initiallocation is var pass in 
  {
    this.location  = initialLocation;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    tendency = new PVector(Tendency_TO_RIGHT, 0);
    xOffset = 0.0;
  }

  public void queueMotion()
  {
    acceleration = PVector.fromAngle(noise(xOffset) * TWO_PI); //noise need give a number
    velocity.add(acceleration);
    velocity.add(tendency);
    location.add((velocity));
    velocity.limit(MAX_VELOCITY); //limit is limit the mag of the vector

    xOffset += NOISE_DELTA;

    //Boundary reaction
    if (location.x < FUCKERS_MOTION_LEFT_BOUNDARY) location.x = FUCKERS_MOTION_RIGHT_BOUNDARY;
    if (location.x > FUCKERS_MOTION_RIGHT_BOUNDARY)location.x = FUCKERS_MOTION_LEFT_BOUNDARY;
    if (location.y < FUCKERS_MOTION_TOP_BOUNDARY) location.y = FUCKERS_MOTION_BOTTOM_BOUNDARY;
    if (location.y > FUCKERS_MOTION_BOTTOM_BOUNDARY)location.y = FUCKERS_MOTION_TOP_BOUNDARY;
  }


  public void drawQueue() 
  {
    //draw Queue itself
    ellipse(queue.location.x, queue.location.y, QUEUE_DIAMETER, QUEUE_DIAMETER);

    //draw Queue's food
    for (Food f : queueData)
    {
      fill(f.foodColor);
      ellipse(f.foodLocation.x, f.foodLocation.y, QUEUE_FOOD_DIAMETER, QUEUE_FOOD_DIAMETER);
    }
  }

  public void applyForce(PVector f)
  {
    velocity.add(f);
  }

  boolean isTouching (Food f)
  {
    return dist(location.x, location.y, f.foodLocation.x, f.foodLocation.y ) < (QUEUE_DIAMETER/2 +f.diameter/2);
  }

  void eat(Food f)
  {//600 600
    println("queue is eating");
    queueData.add(f);
    f.foodLocation.y = 600;
    //f.foodLocation.y = random(QUEUE_FOOD_TOP_BOUNDARY, QUEUE_FOOD_BOTTOM_BOUNDARY);
    for (int i = 0; i < queueData.size(); i++)
    {
      f.foodLocation.x = 600 + i*15;
    }
  }

  void shitOut(Food f)
  {
    queueData.remove(f);
    f.foodLocation.x = random(QUEUE_FOOD_LEFT_BOUNDARY, QUEUE_FOOD_RIGHT_BOUNDARY);
    f.foodLocation.y = random(QUEUE_FOOD_TOP_BOUNDARY, QUEUE_FOOD_BOTTOM_BOUNDARY);
  }
} //end Walker class