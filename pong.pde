float x, y, speedX, speedY;
float diam = 20; //size of the ball
int scoreLeft=0;
int scoreRight=0;

void setup() {
  size(800,600);
  fill(255);
  frameRate(144);
  restart();
}

void restart() {
  x = width/2;
  y = height/2;
  speedX = random(-2,2);
  speedY = 1;
}

void gameOver(){
  x = width/2;
  y = height/2;
  speedX =0;
  speedY=0;
  println("Click to restart !");
}

void mousePressed() {
  restart();
}

void draw() { 
  background(0);
  textSize(21);
  text("PONG",370,20);
  text(scoreLeft, 360, 40);
  text("|", 395, 40);
  text(scoreRight, 420, 40);
  ellipse(x, y, diam, diam);
  x += speedX;
  y += speedY;

  rect(30, mouseY-50, 10, 100);//rec left
  rect(width-30, mouseY-50, 10, 100);//rec right
  
   if ( x > width-30 && x < width - 20  && y > mouseY-50 && y < mouseY+50 ) {//if ball hit bar right
      speedX *= -1; //Reverse direction for bounce
      speedY*=1.1; //Increase speed to be fast as ...
    } 
    
    if ( x > 30 && x < 50  && y > mouseY-50  && y < mouseY+50 ) {//if ball hit bar left
      speedX *= -1;
      speedY*=1*1;
    }
  
    if ( y > height || y < 0 ) {//if ball hit top
      speedY *= -1;
    }
    
    if ( x > width ) {//gameover
      scoreLeft++;
      gameOver();
    }
    if(x < 0) {
      scoreRight++;
      gameOver();
    }
}
