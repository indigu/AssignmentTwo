import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import ddf.minim.*;

Minim minim;
AudioPlayer soundOne;
AudioPlayer soundTwo;

Box2DProcessing box2d;
Box2DProcessing box2d1;

PFont font;

float timeDelta = 1.0f/60.0f;
float posX = 225;
float posY = 500;
int gameState = 0;

boolean[] keys = new boolean[1000];

ArrayList<Boundary> blockage;
ArrayList<Menu> men;
ArrayList<Obstacle> obstacle;

Player one;

void setup()
{
  size(450, 600);
  background(0);
  smooth();
  
  minim = new Minim(this);
  soundOne = minim.loadFile("jump.mp3");
  soundTwo = minim.loadFile("game.mp3");
  
  makeWorld();
  box2d1 = new Box2DProcessing(this);
  box2d1.createWorld();
  box2d1.listenForCollisions();
  font = loadFont("Power_Clear_Bold-48.vlw");
  
  //Created the player into the world
  blockage = new ArrayList<Boundary>();
  one = new Player(posX, posY);
  obstacle = new ArrayList<Obstacle>();
  
  soundTwo.rewind();
  soundTwo.play();
  
  if(gameState == 0)
  { 
    /*
    men = new ArrayList<Menu>();
    
    for(int i = 0; i < 300; i++)
    {
      men.add(new Menu(random(50,400), random(10, 500)));
    }
    */
  }
  
    blockage.add(new Boundary(0, height-5, width*2 ,10));
    blockage.add(new Boundary(5, height, 10 , height*6));
    blockage.add(new Boundary(width-5, height, 10 ,height*6));
    blockage.add(new Boundary(0, 540, 300, 10));
    blockage.add(new Boundary(0, 480, 340, 10));
    blockage.add(new Boundary(0, 420, 380, 10));
    blockage.add(new Boundary(0, 360, 420, 10));
    blockage.add(new Boundary(0, 300, 460, 10));
    blockage.add(new Boundary(0, 240, 520, 10));
    blockage.add(new Boundary(0, 180, 580, 10));
    blockage.add(new Boundary(0, 100, 640, 10));
  
}

void draw()
{
  background(0);
  box2d.step();
  box2d1.step();
  
  if (gameState == 0)
  {
    /*
    for (Menu box: men) 
    {
      fill(random(0,255), random(0,255), random(0,255));
      box.display();
      box.menuUpdate();
    }
    */
    fill(255);
    menu();
  }
  
  
  if (gameState == 1)
  {
    
    for (Boundary wall: blockage) 
    {
      wall.show();
    }
   
   if (random(1) < 0.1) 
   {
    Obstacle a = new Obstacle(360,100);
    obstacle.add(a);
   }

   for (Obstacle a: obstacle) 
   {
    a.display();
   } 
  
  for (int i = obstacle.size()-1; i >= 0; i--) {
    Obstacle a = obstacle.get(i);
    if (a.done()) {
      obstacle.remove(i);
    }
  }
    one.display();
    one.update();
    one.done();
  }
}

/*
void beginContact(Contact cp) 
{
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  
  if (o1.getClass() == Player.class) 
  {
     Obstacle p1 = (Obstacle) o2;
     p1.colorChange();
  }
  else if (o2.getClass() == Player.class) 
  {
    Obstacle p1 = (Obstacle) o1;
    p1.colorChange();
  }
}
*/

void endContact(Contact cp) 
{ 
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

void makeWorld()
{
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
}

void destroyWorld()
{
  box2d = null;
}