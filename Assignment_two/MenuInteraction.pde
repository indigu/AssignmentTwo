int text1 = -300;
int text2 = -400;
int text3 = -300;

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
    
    player.setLinearVelocity( vel );
  }
  
}

void menu()
{
  menuText();
  updateText();
  updateGame();
}

void menuText()
{
  textSize(22);
  text("Your Typical Platformer Game", text1, 100);
  
  textSize(16);
  text("Created by Ogaco Games", text2, 160);
  
  textSize(22);
  text("Press SPACE to start!", text3, 220);
}

void updateText()
{
  if(text1 < 65)
  {
    text1 = text1 + 3; 
  }
  
  if(text2 < 125)
  {
    text2 = text2 + 5; 
  }
  
  if(text3 < 110)
  {
    text3 = text3 + 3;
  }
}

void updateGame()
{
  if((gameState == 0) && (checkKey(' ')))
  {
    gameState = 1;
  }
}