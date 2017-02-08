class Obstacle
{
  Body obstacle;
  float w;
  float h;
  
  color col;
  
  Obstacle(float x, float y)
  {
    this.w = random(5, 20);
    this.h = random(5, 20);

    createObstacle(new Vec2(x, y), w, h);
    obstacle.setUserData(this);
    col = color(#FC190D);
  }
  
  void createObstacle(Vec2 center, float w_, float h_) {

    PolygonShape obs = new PolygonShape();
    float box2dW = box2d1.scalarPixelsToWorld(w_/2);
    float box2dH = box2d1.scalarPixelsToWorld(h_/2);
    obs.setAsBox(box2dW, box2dH);

    FixtureDef fd = new FixtureDef();
    fd.shape = obs;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d1.coordPixelsToWorld(center));

    obstacle = box2d1.createBody(bd);
    obstacle.createFixture(fd);

    obstacle.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    obstacle.setAngularVelocity(random(-5, 5));
  }
  
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d1.getBodyPixelCoord(obstacle);
    // Get its angle of rotation
    float a = obstacle.getAngle();

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(col);
    stroke(0);
    rect(0, 0, w, h);
    popMatrix();
  }
  
  void killBody() {
    box2d1.destroyBody(obstacle);
  }
  boolean done() {
    Vec2 pos = box2d1.getBodyPixelCoord(obstacle);
    if (pos.y > height-20) 
    {
      killBody();
      return true;
    }
    return false;
  }
  
  void colorChange()
  {
    col = color(0, 255, 0);
  }
}