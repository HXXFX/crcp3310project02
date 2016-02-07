class Walker 
{
  //CONTROL PANLE
  final float NOISE_DELTA = 0.04;
  final int MAX_VELOCITY = 1;
  final float Tendency_TO_RIGHT = 1.6;

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector tendency; //wind to right

  float xOffset;

  public Walker(PVector initialLocation)  //constr intoalize var ... initiallocation is var pass in 
  {
    this.location  = initialLocation;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    tendency = new PVector(Tendency_TO_RIGHT, 0);
    xOffset = 0.0;
  }

  public void walk()
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

  public void applyForce(PVector f)
  {
    velocity.add(f);
  }
} //end Walker class