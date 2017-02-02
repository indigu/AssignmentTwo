class Player
{
  Body player;
  Body lowPlayer;
  
  float w;
  float h;
  float r;
  
  color col;
  
  //Constructor
  Player(float x_, float y_)
  {
    float x = x_;
    float y = y_;
    
    w = 15;
    h = 15;
    
    //created the player
    createPlayer(new Vec2(x, y), w, h);
    player.setUserData(this);
  }
  
  lowerPlayer(float x, float y)
  {
    r = 8;
    
    //Making the body and setting it's position
    BodyDef cir = new BodyDef();
    cir.position = box2d.coordPixelsToWorld(x,y);
    cir.type = BodyType.DYNAMIC;
    lowPlayer = box2d.world.createBody(cir);
    
    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters for physics
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 0.3;
    
    //Adding my fixture to the lowPlayer
    lowPlayer.createFixture(fd);
    lowPlayer.setLinearVelocity(new Vec2(random(-3,3), random(3, 6)));
    
    col = color(200);
  }
  
  void display() 
  {
    //Getting the player's position
    Vec2 pos = box2d.getBodyPixelCoord(player);

    float posX = 0;
    float posY = 250;
    
    rectMode(PConstants.CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    fill(#FEFF34);
    stroke(0);
    rect(posX, posY, w, h);
    popMatrix();
    
    
    
    
  }
  
  //After many trials, I decided to create a different function and call it
  //to the constructor later
  void createPlayer(Vec2 center, float w_, float h_) 
  {
    // Define and create the body
    BodyDef play = new BodyDef();
    play.type = BodyType.DYNAMIC;
    play.position.set(box2d.coordPixelsToWorld(center));
    player = box2d.createBody(play);
    
    //Definining my player, I made it a box to make it easier for myself    
    PolygonShape box = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    box.setAsBox(box2dW, box2dH);
    
    // Defining fixture
    FixtureDef fix1 = new FixtureDef();
    fix1.shape = box;
    
    // Parameters that affect physics
    fix1.density = 1;
    fix1.friction = 0.3;
    fix1.restitution = 0.5;
    
    player.createFixture(fix1);
  }
}
  