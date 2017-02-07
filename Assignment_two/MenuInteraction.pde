class Menu extends Player
{
  Menu(float _x, float _y)
  {
    super(_x, _y);
  }
  
  void menuUpdate()
  {
    Vec2 vel = player.getLinearVelocity();
    
    if(mousePressed)
    {
      vel.y = 10;
    }
  }
}