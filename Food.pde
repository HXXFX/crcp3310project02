class Food
{
  //CONTROL PANLE
  final int FOOD_LEFT_BOUNDARY = 0;
  final int FOOD_RIGHT_BOUNDARY = width;
  final int FOOD_TOP_BOUNDARY = 0;
  final int FOOD_BOTTOM_BOUNDARY = height;
  final int FOOD_DIAMETER = 20;
  
  PVector location = new PVector(0, 0);
  float diameter;

  public Food()
  {
    this.location.x = random(FOOD_LEFT_BOUNDARY, FOOD_RIGHT_BOUNDARY);
    this.location.y = random(FOOD_TOP_BOUNDARY, FOOD_BOTTOM_BOUNDARY);
    this.diameter = FOOD_DIAMETER;
  }

  //public Food(PVector location, float diameter)
  //{
  //  this.location = location;
  //  this.diameter = diameter;
  //}
  
  
  void drawFoodEllipse()
  {
   ellipse(location.x, location.y, diameter, diameter); 
  }
  
}//end Food class