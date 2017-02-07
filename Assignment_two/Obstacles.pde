class Obstacle
{
  Body obstacle;
  float w;
  float h;
  
  Obstacle(float x, float y)
  {
    this.w = random(5, 20);
    this.h = random(5, 20);

    createObstacle(new Vec2(x, y), w, h);
    obstacle.setUserData(this);
  }
  
  void createObstacle(Vec2 center, float w_, float h_) {

    PolygonShape obs = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    obs.setAsBox(box2dW, box2dH);

    FixtureDef fd = new FixtureDef();
    fd.shape = obs;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    obstacle = box2d.createBody(bd);
    obstacle.createFixture(fd);

    obstacle.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    obstacle.setAngularVelocity(random(-5, 5));
  }
}