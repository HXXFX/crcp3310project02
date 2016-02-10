class Bag 
{
  //CONTROL PANLE
  final float NOISE_DELTA = 0.04;
  final int MAX_VELOCITY = 1;
  final float Tendency_TO_RIGHT = 1.6;
  final int BAG_DIAMETER = 40;
  final int BAG_FOOD_DIAMETER = 10;

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector tendency; //wind to right

  float xOffset;

  ArrayList<Food> data = new ArrayList<Food>();

  public Bag(PVector initialLocation)  //constr intoalize var ... initiallocation is var pass in 
  {
    this.location  = initialLocation;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    tendency = new PVector(Tendency_TO_RIGHT, 0);
    xOffset = 0.0;
  }

  public void bagMotion()
  {
    acceleration = PVector.fromAngle(noise(xOffset) * TWO_PI); //noise need give a number
    velocity.add(acceleration);
    velocity.add(tendency);
    location.add((velocity));
    velocity.limit(MAX_VELOCITY); //limit is limit the mag of the vector

    xOffset += NOISE_DELTA;

    //Boundary reaction
    if (location.y < 0) location.y = height;
    if (location.y > height)location.y = 0;
    if (location.x < 0) location.x = width;
    if (location.x > width)location.x = 0;
  }


  public void drawBag() 
  {
    //draw Bag itself
    ellipse(bag.location.x, bag.location.y, BAG_DIAMETER, BAG_DIAMETER);

    //draw Bag's food
    for (Food f : data)
    {
      fill(f.foodColor);
      ellipse(f.foodLocation.x, f.foodLocation.y, BAG_FOOD_DIAMETER, BAG_FOOD_DIAMETER);
    }
  }

  public void applyForce(PVector f)
  {
    velocity.add(f);
  }

  boolean isTouching (Food f)
  {
    return dist(location.x, location.y, f.foodLocation.x, f.foodLocation.y ) < (BAG_DIAMETER/2 +f.diameter/2);
  }

  void eat(Food f)
  {
    data.add(f);
    f.foodLocation.x = random(0, 200);
    f.foodLocation.y = random(height - 200, height);
  }
} //end Walker class