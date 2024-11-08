star[] galaxy;

public void setup(){
  size(1000, 1000);
  galaxy = new star[100];
  for(int i = 0; i < galaxy.length; i++){
  if(i%10 == 0){
    galaxy[i] = new squareStar();
  }
  else galaxy[i] = new star();
  }

}

public void draw(){
  background(0);
  for (int i = 0; i < galaxy.length; i++){
  if(i%10 == 0){
  galaxy[i].starMoving();
  galaxy[i].starReappear();
  }
  else
  galaxy[i].starMoving();
  galaxy[i].starReappear();
  }
}

class star{
  double startX, startY, starAngle, starSpeed;
  private double starRadius;
  int starColor;
  star(){
   startX = 500;
   startY = 500;
    starAngle = (float)(Math.random()*2*Math.PI)-(float)Math.PI;
    starSpeed = (float)(Math.random()*10)+5;
    starColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    starRadius = 0;
  }
  
 void starMoving(){
   if(dist((float)startX, (float)startY, 500, 500) > 100){
   fill(starColor);
   starRadius++;
   }
  else fill(0);
   ellipse((float)startX, (float)startY, (float)starRadius, (float)starRadius);
   startX = startX + (Math.cos(starAngle)*starSpeed);
   startY = startY + (Math.sin(starAngle)*starSpeed);
   }
   
 void starReappear(){
      if(dist((float)startX, (float)startY, 500, 500) >= 750){
  startX = 500;
  startY = 500;
  starAngle = (float)(Math.random()*2*Math.PI)-(float)Math.PI;
  starRadius = 0;
      }
 }
}

class squareStar extends star{
  private int squareStarSide;
  squareStar(){
   startX = 500;
   startY = 500;
    starAngle = (float)(Math.random()*2*Math.PI)-(float)Math.PI;
    starSpeed = (float)(Math.random()*10)+5;
    starColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    squareStarSide = 0;
  }
  
 public void starMoving(){
   if(dist((float)startX, (float)startY, 500, 500) > 100){
   fill(starColor);
   squareStarSide+=2;
   }
  else fill(0);
   rect((float)startX-squareStarSide, (float)startY-squareStarSide, squareStarSide, squareStarSide);
   startX = startX + (Math.cos(starAngle)*starSpeed);
   startY = startY + (Math.sin(starAngle)*starSpeed);
  }
  
  void starReappear(){
      if(dist((float)startX-squareStarSide, (float)startY-squareStarSide, 500, 500) >= 750){
  startX = 500;
  startY = 500;
  starAngle = (float)(Math.random()*2*Math.PI)-(float)Math.PI;
  squareStarSide = 0;
}
}
}
