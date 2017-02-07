int text1 = -300;
int text2 = -400;

float bx;
float by;
int SizeY = 50;
int SizeX = 80;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 





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
  
  void killBody() {
    box2d.destroyBody(player);
  }

  // Is the particle ready for deletion?
  boolean done() {

    if (gameState == 1) 
    {
      killBody();
      return true;
    }
    return false;
  }
}






void menuText()
{
  textSize(22);
  text("Your Typical Platformer Game", text1, 100);
  
  textSize(16);
  text("Created by Ogaco Games", text2, 160);
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
}

void boxDisplay()
{
  rect(bx, by, SizeX, SizeY);
}

void mousePressed()
{
  if (mouseX > bx-SizeX && mouseX < bx+SizeX && 
      mouseY > by-SizeY && mouseY < by+SizeY) {
    overBox = true;  
    if(!locked) { 
      stroke(255); 
      fill(255);
      gameState = 1;
    } 
  } else {
    stroke(153);
    fill(100);
    overBox = false;
  }
}

void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}

void mouseReleased() {
  locked = false;
}