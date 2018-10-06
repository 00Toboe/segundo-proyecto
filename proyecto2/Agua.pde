class Agua 
{
  Body body;
  PVector[] trail;
  Agua (float x_, float y_) 
 {
    float x = x_;
    float y = y_;
    trail = new PVector[6];
    for (int i = 0; i < trail.length; i++) 
    {
      trail[i] = new PVector(x,y);
    }
    makeBody(new Vec2(x,y),0.2f);
 }
 void killBody() 
  {
    box2d.destroyBody(body);
  }
  boolean done() 
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height+20) 
    {
      killBody();
      return true;
    }
    return false;
}

void attract(float x,float y) 
{    
    Vec2 worldTarget = box2d.coordPixelsToWorld(x,y);   
    Vec2 bodyVec = body.getWorldCenter();
    worldTarget.subLocal(bodyVec);
    worldTarget.normalize();
    worldTarget.mulLocal((float) 0.5);
    body.applyForce(worldTarget, bodyVec);
  }
  
  void repulcion(float x,float y) 
{    
    Vec2 worldTarget = box2d.coordPixelsToWorld(x,y);   
    Vec2 bodyVec = body.getWorldCenter();
    worldTarget.subLocal(bodyVec);
    worldTarget.normalize();
    worldTarget.mulLocal((float) -0.5);
    body.applyForce(worldTarget, bodyVec);
  }

void display() 
{
  Vec2 pos = box2d.getBodyPixelCoord(body);
  
    for (int i = 0; i < trail.length-1; i++) {
      trail[i] = trail[i+1];
    }
    trail[trail.length-1] = new PVector(pos.x,pos.y);
    
    beginShape();
    noFill();
    strokeWeight(2);
    stroke(0,0,255);
    for (int i = 0; i < trail.length; i++) {
      vertex(trail[i].x,trail[i].y);
    }
    endShape();
}

void makeBody(Vec2 center, float r) 
{
  BodyDef bd = new BodyDef();
        bd.type = BodyType.DYNAMIC;

    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);
    
    body.setLinearVelocity(new Vec2(random(-1,1),random(-1,1)));
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
  
    fd.density = 3;
    fd.friction = 0;  
    fd.restitution = 0.2;
    
    body.createFixture(fd);

  }
} 
