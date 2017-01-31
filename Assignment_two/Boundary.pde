class Boundary {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;
  
  color col;
  
  Body body;
  
  Boundary(float x_,float y_, float w_, float h_) 
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
    col = color(#0850C1);
    
  //Defining our shape
  PolygonShape a = new PolygonShape();
  
  float box2dW = box2d.scalarPixelsToWorld(w/2);
  float box2dH = box2d.scalarPixelsToWorld(h/2);
  
  a.setAsBox(box2dW, box2dH);
  
  //Defining the body to go for the shape
  BodyDef b = new BodyDef();
  b.type = BodyType.STATIC;
  b.position.set(box2d.coordPixelsToWorld(x,y));
  body = box2d.createBody(b);
  
  }
  
  //Defining the fixture in order to attach our shape into the body
  void show() 
  {
    fill(col);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}