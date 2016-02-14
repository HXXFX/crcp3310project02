class Shit
{
  //CONTROL PANLE
  float diameter = 20.0;

  PVector shitLocation = new PVector(0, 0);
  color shitColor;

  public Shit(PVector shitLoc, color shitCol)
  {

    this.shitLocation = shitLoc;
    this.shitColor = shitCol;
  }

  void drawShitEllipse()
  {
    fill(shitColor);
    ellipse(shitLocation.x, shitLocation.y, diameter, diameter);
  }
}//end Shit class