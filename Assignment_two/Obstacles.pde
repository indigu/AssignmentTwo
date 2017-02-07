class Obstacle
{
  Body obstacle;
  float w;
  float h;
  
  Obstacles(float x, float y)
  {
    this.w = random(5, 20);
    this.h = random(5, 20);
  }
    createObstacle(new Vec2(x, y), w, h);
    obstacle.setUserData(this);
  }
}