class Player
{
  Body player;
  
  float w;
  float h;
  
  //Constructor
  Box(float x_, float y_)
  {
    float x = x_;
    float y = y_;
    
    w = 24;
    h = 24;
    
    //confused about what to add, i think i need to learn some more
  }
  
  
  //After many trials, I decided to create a different function and call it
  //to the constructor later
  void createPlayer(Vec2 center, float w_, float h_) {
    // Define and create the body
    BodyDef play = new BodyDef();
    play.type = BodyType.DYNAMIC;
    play.position.set(box2d.coordPixelsToWorld(center));
    player = box2d.createBody(play);
  }
}
  