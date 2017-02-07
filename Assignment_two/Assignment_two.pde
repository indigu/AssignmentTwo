import shiffman.box2d.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
PFont font;

float timeDelta = 1.0f/60.0f;
float posX = 225;
float posY = 500;
int text1 = -300;
int text2 = -400;
boolean startMenu = false;

//A list we'll use to track fixed objects
boolean[] keys = new boolean[1000];
ArrayList<Boundary> blockage;
ArrayList<Menu> men;
Player one;

void setup()
{
  size(450, 600);
  background(0);
  smooth();
  
  font = loadFont("Power_Clear_Bold-48.vlw");
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  box2d.setGravity(0, -10);
  
  box2d.listenForCollisions();

  //Created the player into the world
  blockage = new ArrayList<Boundary>();
  men = new ArrayList<Menu>();
  one = new Player(posX, posY);
  
  for(int i = 0; i < 15; i++)
  {
    men.add(new Menu(random(50,400), random(10, 500)));
  }
  
  //Stage One
  blockage.add(new Boundary(0, height-5, width*2 ,10));
  blockage.add(new Boundary(5, height, 10 , height*6));
  blockage.add(new Boundary(width-5, height, 10 ,height*6));
  blockage.add(new Boundary(0, 540, 300, 10));
  blockage.add(new Boundary(0, 480, 340, 10));
  blockage.add(new Boundary(0, 420, 380, 10));
  blockage.add(new Boundary(0, 360, 420, 10));
  blockage.add(new Boundary(0, 300, 460, 10));
  blockage.add(new Boundary(0, 240, 520, 10));
}

void draw()
{
  background(0);
  box2d.step();
  
  if (startMenu == true)
  {
    for (Boundary wall: blockage) 
    {
      wall.show();
    }
  
    one.display();
    one.update();
  }
  else
  {
    for (Menu box: men) 
    {
      fill(random(0,255), random(0,255), random(0,255));
      box.display();
      box.menuUpdate();
    }
    fill(255);
    menuText();
    updateText();
  }
}


void beginContact(Contact cp) 
{
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  
  if (o1.getClass() == Player.class && o2.getClass() == Boundary.class) 
  {
     Player p1 = (Player) o1;
     p1.jumpReset = true;
  }
  else if (o1.getClass() == Boundary.class && o2.getClass() == Player.class) 
  {
    Player p1 = (Player) o2;
    p1.jumpReset = true;
  }
}

void endContact(Contact cp) 
{
}

void menuText()
{
  textSize(22);
  text("Your Typical Platformer Game", text1, 200);
  
  textSize(16);
  text("Created by Ogaco Games", text2, 260);
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

void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];  
  }
  return false;
}