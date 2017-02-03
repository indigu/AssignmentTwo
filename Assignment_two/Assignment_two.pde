import shiffman.box2d.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

Player one;
float posX = 0;
float posY = 250;


//A list we'll use to track fixed objects
ArrayList<Boundary> blockage;

void setup()
{
  size(450, 600);
  background(0);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  //Created the player into the world
  one = new Player(width/2,height/2);
  
  blockage = new ArrayList<Boundary>();
  
  blockage.add(new Boundary(0, height-5, width*2 ,10));
  blockage.add(new Boundary(5, height, 10 , height*6));
  blockage.add(new Boundary(width-5, height, 10 ,height*6));
}

void draw()
{
  box2d.step();
  
  for (Boundary wall: blockage) {
    wall.show();
  }
  
  one.display();
}