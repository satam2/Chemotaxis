Bacteria[] test = new Bacteria[5];
void setup(){
  background(225);
  size(500,500);
  for(int i = 0; i < test.length; i ++)
    test[i] = new Bacteria(250,250); 
}

void draw(){
  background(225);
  for(int i = 0; i < test.length; i++){
    test[i].show();
    test[i].move();
    // bounds
    if(test[i].myX < 25)
      test[i].myX = 25;
    if(test[i].myX > 475)
      test[i].myX = 475;
    if(test[i].myY < 25)
      test[i].myY = 25;
    if(test[i].myY > 475)
      test[i].myY = 475;
      
    if(dist(test[i].myX, test[i].myY, test[i].myX, test[i].myY) < 25)
      
  }
}

void mousePressed(){
  
}

class Bacteria{
  int myX, myY;
  Bacteria(int x, int y){
    myX = x;
    myY = y;
  }
  void show(){
    fill(200);
    ellipse(myX,myY,50,50);
  }
  void move(){
    myX += (int)(Math.random()*7)-3;
    myY += (int)(Math.random()*7)-3;
  }
  

}
