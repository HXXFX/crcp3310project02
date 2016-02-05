class Walker {

  PVector location;
  PVector velocity;

  
float noiseScale = 0.1;

  public Walker(PVector initialLocation) 
  {
    this.location  = initialLocation;
    velocity = new PVector(1, 1);
  }

  public void walk()
  {
    location.add((velocity));
  }
}