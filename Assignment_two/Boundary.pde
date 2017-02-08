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
    this.x = x_;
    this.y = y_;
    this.w = w_;
    this.h = h_;
    
    col = color(#0850C1);
    
    //Defining our shape
    PolygonShape a = new PolygonShape();
  
    float box2dW = box2d1.scalarPixelsToWorld(w/2);
    float box2dH = box2d1.scalarPixelsToWorld(h/2);
  
    a.setAsBox(box2dW, box2dH);
  
    //Defining the body to go for the shape
    BodyDef b = new BodyDef();
    b.type = BodyType.STATIC;
    b.position.set(box2d1.coordPixelsToWorld(x,y));
    body = box2d1.createBody(b);
    body.createFixture(a,1);
    
    body.setUserData(this);
  }
  
  //Defining the fixture in order to attach our shape into the body
  void show() 
  {
    Vec2 pos = box2d1.getBodyPixelCoord(body);
    
    fill(col);
    noStroke();
    rectMode(CENTER);
     
    pushMatrix();
    translate(pos.x, pos.y);
    rect(0,0,w,h);
    popMatrix();
  }
}