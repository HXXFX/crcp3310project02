class Set 
{
  //CONTROL PANLE
  final float NOISE_DELTA = 0.04;
  final int MAX_VELOCITY = 1;
  final float Tendency_TO_RIGHT = 1.6;
  final int SET_DIAMETER = 40;
  final int SET_FOOD_DIAMETER = 10;
  final int SET_FOOD_LEFT_BOUNDARY = 220;
  final int SET_FOOD_RIGHT_BOUNDARY = 400;
  final int SET_FOOD_TOP_BOUNDARY = height - 200;
  final int SET_FOOD_BOTTOM_BOUNDARY = height; 

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector tendency; //wind to right
  float xOffset;
  ArrayList<Food> data = new ArrayList<Food>();

  public Set(PVector initialLocation)  //constr intoalize var ... initiallocation is var pass in 
  {
    this.location  = initialLocation;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    tendency = new PVector(Tendency_TO_RIGHT, 0);
    xOffset = 0.0;
  }

  public void setMotion()
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


  public void drawSet() 
  {
    //draw Set itself
    ellipse(set.location.x, set.location.y, SET_DIAMETER, SET_DIAMETER);

    //draw Set's food
    for (Food f : data)
    {
      fill(f.foodColor);
      ellipse(f.foodLocation.x, f.foodLocation.y, SET_FOOD_DIAMETER, SET_FOOD_DIAMETER);
    }
  }

  public void applyForce(PVector f)
  {
    velocity.add(f);
  }

  boolean isTouching (Food f)
  {
    return dist(location.x, location.y, f.foodLocation.x, f.foodLocation.y ) < (SET_DIAMETER/2 +f.diameter/2);
  }

  void eat(Food f)
  {
    data.add(f);
    f.foodLocation.x = random(SET_FOOD_LEFT_BOUNDARY, SET_FOOD_RIGHT_BOUNDARY);
    f.foodLocation.y = random(SET_FOOD_TOP_BOUNDARY, SET_FOOD_BOTTOM_BOUNDARY);
  }
} //end Walker class