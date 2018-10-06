//Edwin Jonathan Lizcano Vazquez. grupo A2.

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;


Box2DProcessing box2d;


ArrayList<Obstaculos> limite;
ArrayList<Obsta> limite2;
ArrayList<Agua> agua;

Ventanas ve;
int pant =0;
void setup ()
{
  size (900,400);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -25);
  ve = new Ventanas();
  limite = new ArrayList<Obstaculos>();
  agua = new ArrayList<Agua>();
  limite2 = new ArrayList<Obsta>();
  //bordes
  limite.add(new Obstaculos(width-5,height/2,10,height));
  limite.add(new Obstaculos(5,height/2,10,height));
  limite.add(new Obstaculos(width/2,5,width,10));
  limite.add(new Obstaculos(width/2,height-5,width,10));
  // obstaculos    
  limite.add(new Obstaculos(100,height/2+100,20,height/2));
  limite.add(new Obstaculos(680,280,140,10));
  limite.add(new Obstaculos(640,300,20,40));
  limite.add(new Obstaculos(800,300,20,40));
  limite.add(new Obstaculos(640,340,180,20));
  limite.add(new Obstaculos(width/2,60,40,10));
  limite.add(new Obstaculos(width/2-25,80,40,10));
  limite.add(new Obstaculos(width/2+25,80,40,10));
  limite.add(new Obstaculos(width/2-55,130,50,10));
  limite.add(new Obstaculos(width/2+55,130,50,10));  
  limite.add(new Obstaculos(width/2,height/2,150,10));
  limite2.add(new Obsta(width/2,height/2,15));
  limite2.add(new Obsta(width/2,height-20,30));
  limite2.add(new Obsta(100,height,30));
 } 

void draw ()
{ 
  box2d.step();  
  
  switch (pant)
  {
    case 0:    
      ve.inicio();   
      break;
      
      case 1:    
      ve.grab();    
      break;
      
      case 2:    
      ve.fin();   
      break;      
      
  }
}
