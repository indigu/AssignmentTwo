class Boundary {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;
  
  Body b;
  
  Boundary(float x_,float y_, float w_, float h_) 
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
  //Defining our shape
  PolygonShape ar = new PolygonShape();
  
  float box2dW = box2d.scalarPixelsToWorld(w/2);
  float box2dH = box2d.scalarPixelsToWorld(h/2);
  
  ar.setAsBox(box2dW, box2dH);
  
}