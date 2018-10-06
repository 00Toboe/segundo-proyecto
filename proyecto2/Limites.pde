class Obstaculos
{
  
  float x;
  float y;
  float w;
  float h;
  Body b;
  
  Obstaculos (float x_, float y_, float w_, float h_)
  {
    x=x_;
    y=y_;
    w=w_;
    h=h_;    
     
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);

    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);     
    b.createFixture(sd,1);
    
  }
  
  void display() {
    fill(0);
    stroke(0);
    rectMode(CENTER);    
    rect(x,y,w,h);     
  }
  
}


class Obsta 
{
 int x;
 int y;
 float r;
 Body body;
  Obsta (int x,int y,float r_)
  {
    r = r_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.world.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    body.createFixture(cs,1);
  }
  void display() 
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    pushMatrix();
    translate(pos.x,pos.y);
    fill(0);
    stroke(0);
    rectMode(CENTER);    
    ellipse(x,y,r*2,r*2);  
    popMatrix();
  }
  
}
