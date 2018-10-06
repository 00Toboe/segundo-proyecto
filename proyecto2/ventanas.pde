class Ventanas
{
  void inicio ()
  {
    background(0);
    fill(255);
   textSize(40);
   text("Atraccion de fluidos", 250,150); 
   textSize(15);
   text("preciona Z para continuar", 700,370);     
   if (key == 'z' || key == 'Z')
   {
     pant = 1;
   }
  }
  
  
  void grab ()
  {
    background(255);    
    
    if (random(1) < 0.2) {
    if (agua.size() < 100) {      
    Agua p = new Agua(width/2,30);
    agua.add(p);
    }
}

for (Agua b: agua) {
    b.display();
  }
  
  for (int i = agua.size()-1; i >= 0; i--) {
    Agua b = agua.get(i);
    if (b.done()) {
      agua.remove(i);
    }
  }
  
  for (Obstaculos wall: limite) 
  {
    wall.display();
  }
  for (Obsta wall: limite2) 
  {
    wall.display();
  }
  
  if (mouseButton == LEFT) 
  {
    for (Agua b: agua) 
    {
     b.attract(mouseX,mouseY);
    }
  }
    if (mouseButton == RIGHT){
      for (Agua b: agua) 
      {
      b.repulcion(mouseX,mouseY);
      }
    }
    
  
    textSize(15);
   text("Clic izquierdo actraccion", 15,30);
   text("Clic derecho repulsion", 15,43);
   text("preciona x para salir", 700,370);
   if (key == 'x' || key == 'X')
   {
     pant = 2;
   }
  }
  
  
  void fin ()
  {
    background(255);
    textSize(40);
   text("Fin", 300,100);
   textSize(15);
   text("Ya puede cerrar el programa.", 440,200);   
  }
}
