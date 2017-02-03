class Player
{
  Body player;
  
  float w;
  float h;
  
  color col;
  
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
    float a = player.getAngle();
    
    rectMode(CENTER);
    pushMatrix();
    rotate(-a);
    translate(pos.x, pos.y);
    fill(#FEFF34);
    stroke(0);
    rect(0, 0, w, h);
    popMatrix();
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
    fix1.density = 1;
    fix1.friction = 0.3;
    fix1.restitution = .75;
    
    player.createFixture(fix1);
    
    
    
    Vec2 vel = player.getLinearVelocity();
    
    if (key == CODED)
    {
      if (key == LEFT)
      {
        vel.x = vel.x--;
      }
    }
    
    player.setLinearVelocity( vel );
  }
}
  