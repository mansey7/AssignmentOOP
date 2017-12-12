//intialise the variables for my stars
float starX= 425;
float starY = 125;
float star1X = 275;
float star1Y = 125;
float starH = 6;
float starW = 6;
float starSpeed = .5;
PImage img;
void setup()
{
  size(750,500);
  noStroke();
  img = loadImage("stars.jpg");
}

void draw()
{
  //Draw the Ship outline
  strokeWeight(4);
  background(img);
  stroke(255);
  fill(96,96,96);
  quad(0,500,125,400,625,400,750,500);
  fill(32,32,32);
  triangle(0,500,125,400,0,100);
  triangle(750,500,625,400,750,100);
  rect(0,0,750,100);
  //draws the radar
  fill(0,160,0);
  stroke(0);
  rect(175,425,80,50);
  line(175,450,255,450);
  line(215,425,215,475);
//draws the blue control panel on bottom right
  fill(0,0,255);
  stroke(255);
  rect(540,445,75,25);
  rect(565,420,25,25);
  line(565,445,590,445);
  line(565,445,565,470);
  line(590,445,590,470);
 //draws my working speedometer in the middle control panel
  fill(0);
  rect(350,425,25,60);
  float y = map(starSpeed,0,3.5,480,425);
  line(350,y,375,y);
 
 
  
 // Draw the stars
  star1X = star1X - starSpeed;
  for (int i =0; i<3; i++)
  {
   noStroke();
  fill(255 , 255 , 120);
  ellipse(star1X,star1Y,starH,starW);
  ellipse(star1X+20,star1Y+40,starH,starW);
  ellipse(star1X+30,star1Y+80,starH,starW);
  ellipse(star1X+40,star1Y+120,starH,starW);
  ellipse(star1X+50,star1Y+160,starH,starW);
  ellipse(starX,starY,starH,starW);
  ellipse(starX+20,starY+40,starH,starW);
  ellipse(starX+30,starY+80,starH,starW);
  ellipse(starX+40,starY+120,starH,starW);
  ellipse(starX+50,starY+160,starH,starW);
  //moves the stars position according to starSpeed
  starX += starSpeed;
  starY += starSpeed/2;
  star1X -= starSpeed;
  star1Y += starSpeed/2;
  }
  if(star1X < 55)//resets the stars to the middle of the screen whilst moving through space
  {
  starX = 425;
  starY = 125;
  star1X = 275;
  star1Y = 125;
  }
  //sets the starSpeed back once it reaches maximum velocity
  if(starSpeed <=0)
  {
    starSpeed =0.1;
  }
  if(starSpeed >=4)
  {
    starSpeed=3.5;
  }
}
//allows the movement of the ships speed 
void keyPressed() { 
    if (keyCode == UP)
    {
      starSpeed += 1;
    }
    if(keyCode == DOWN)
    {
      starSpeed -= .5;
    }
  }
  // this draws the position of the mouse being clicked on the radar in the control panel
void mousePressed(){
  stroke(255,0,0);
  line(375,400,mouseX,mouseY);
  fill(255,0,0);
  float x = map(mouseX,0,750,175,255);
  float y = map(mouseY,0,500,425,475);
  ellipse(x,y,8,8);
}