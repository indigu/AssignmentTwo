class Player
{
  Body player;
  
  float w;
  float h;
  boolean jumpReset = true;
  
  //Constructor
  Player(float x_, float y_)
  {
    
    this.w = 15;
    this.h = 15;
    
    //created the player
    createPlayer(new Vec2(x_, y_), w, h);
    player.setUserData(this);
  }
  
  void display() 
  {
    //Getting the player's position
    Vec2 pos = box2d.getBodyPixelCoord(player);
    //float a = player.getAngle();
    
    rectMode(CENTER);
    pushMatrix();
    //rotate(a);
    translate(pos.x, pos.y);
    fill(255);
    stroke(0);
    rect(0, 0, w, h);
    popMatrix();
  }

  void update()
  {
    Vec2 vel = player.getLinearVelocity();
    
    if (checkKey('a'))
    {
      vel.x = -15;
    }
    else if (checkKey('d'))
    {
      vel.x = 15;
    }
    
    if (checkKey('w') && jumpReset)
    {
      vel.y = 10;
      jumpReset = false;
    }
    
    if (checkKey('s'))
    {
      vel.y = -20;
      jumpReset = true;
    }
   
    player.setLinearVelocity( vel );
  }
  
  //After many trials, I decided to create a different function and call it
//to the constructor later
  void createPlayer(Vec2 center, float w_, float h_) 
  {
    
    //Definining my player, I made it a box to make it easier for myself    
    PolygonShape box = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    box.setAsBox(box2dW, box2dH);
    
    // Define and create the body
    BodyDef play = new BodyDef();
    play.type = BodyType.DYNAMIC;
    play.position.set(box2d.coordPixelsToWorld(center));
    player = box2d.createBody(play);
    
    // Defining fixture
    FixtureDef fix1 = new FixtureDef();
    fix1.shape = box;
    
    // Parameters that affect physics
    fix1.density = 2;
    fix1.friction = 5;
    fix1.restitution = 0.02;
    
    player.createFixture(fix1);
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
  
  void killBody() {
    box2d.destroyBody(player);
  }
  
  boolean done() {
    if (gameState == 1) {
      killBody();
      return true;
    }
    return false;
  }
}
  