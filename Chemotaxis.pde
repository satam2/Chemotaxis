Zombie[] test = new Zombie[10];
Player you = new Player();
void setup(){
  background(#808076);
  textAlign(CENTER);
  size(500,500);
  for(int i = 0; i < test.length; i ++)
    test[i] = new Zombie(0,500); 
}

void draw(){
  backdrop();
  you.update();
  if(you.myX < 18)
    you.myX = 18;
  if(you.myX > 482)
    you.myX = 482;
  if(you.myY < 18)
    you.myY = 18;
  if(you.myY > 482)
    you.myY = 482;
  you.show();  
    
  for(int i = 0; i < test.length; i++){
    test[i].show();
    test[i].move();
    if(dist(you.myX,you.myY, test[i].myX, test[i].myY)<40)
      you.hurt();
    // bounds
    if(test[i].myX < 20)
      test[i].myX = 20;
    if(test[i].myX > 480)
      test[i].myX = 480;
    if(test[i].myY < 20)
      test[i].myY = 20;
    if(test[i].myY > 480)
      test[i].myY = 480;
  } // end of bounds
}

void backdrop(){
  background(#808076);
}

class Zombie{
  int myX, myY;
  Zombie(int x, int y){
    myX = x;
    myY = y;
  }
  void show(){
    stroke(#36A753);
    fill(#54C571);
    ellipse(myX,myY,40,40);
    noStroke();
    // eyes
    fill(0);
    arc(myX-8,myY-5,12,12,radians(0),radians(180));
    arc(myX+8,myY-5,12,12, radians(0),radians(180));
    fill(255,255,0);
    ellipse(myX-8,myY-4,3,3);
    ellipse(myX+8,myY-4,3,3);
    // mouth
    fill(0);
    arc(myX,myY+12,22,15,radians(180),radians(360));
    // brain
    fill(#C454A8);
    arc(myX,myY-9,38,25,radians(180),radians(360));
    stroke(#A6368A);
    line(myX,myY-10,myX,myY-22);
  }
  void move(){
    detect();
  }
  void detect(){
    if(mouseX > myX) // if player to the right
      myX += (int)(Math.random()*15)-6;
    if(mouseX < myX) // if player to the left
      myX += (int)(Math.random()*15)-8;
    if(mouseY > myY) // if player at bottom
      myY += (int)(Math.random()*15)-6;
    if(mouseY < myY) // if player on top
      myY += (int)(Math.random()*15)-8;
  }
} // end of Zombie class

class Player{
   int myX, myY;
   Player(){
     myX = mouseX;
     myY = mouseY;
   }
   void show(){
     noStroke();
     fill(#FFE7D0);
     ellipse(myX,myY,35,35);
     // eyes
     fill(255);
     ellipse(myX-7,myY-5,10,10);
     ellipse(myX+7,myY-5,10,10);
     fill(0);
     ellipse(myX-7,myY-5,5,5);
     ellipse(myX+7,myY-5,5,5);
     // mouth
     stroke(0);
     noFill();
     arc(myX,myY+7,20,10,radians(180),radians(360));
   }
   void hurt(){
     noStroke();
     fill(#FF7F7F);
     ellipse(myX,myY,35,35);
     // eyes
     stroke(0);
     line(myX-8,myY-5, myX,myY-5);
     line(myX-8,myY-10, myX,myY-5);
     line(myX-8,myY, myX,myY-5);
     line(myX+8,myY-5, myX,myY-5);
     line(myX+8,myY-10, myX,myY-5);
     line(myX+8,myY, myX,myY-5);
     // mouth
     noStroke();
     fill(0);
     ellipse(myX,myY+6,7,12);
     // exclaim
     noFill();
     stroke(0);
     text("YOWCH!",myX+3, myY-25);
   
   }
   void update(){
     myX = mouseX;
     myY = mouseY;
   }
}
