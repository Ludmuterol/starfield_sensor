class Star
{
  float x, y, z;
  
  Star()
  {
    x = random(-width, width);
    y = random(-height, height);
    z = random(height);
  }
  
  void update()
  {
    z -= az;
    x += ax;
    y -= ay;
    if(z < 1)
    {
      x= random(-width, width);
      y= random(-height, height);
      z= height;
    }
    if(z > height)
    {
      x = random(-width, width);
      y = random(-height, height);
      z = 1;
    }
    if(x < -width)
    {
      x = width;
      y = random(-height, height);
      z = random(height);
    }
    if(x > width)
    {
      x= -width;
      y= random(-height, height);
      z= random(height);
    }
    if(y < -height)
    {
      x= random(-width, width);
      y= height;
      z= random(height);
    }
    if(y > height)
    {
      x= random(-width, width);
      y= -height;
      z= random(height);
    }
  }
  
  void show(){
   fill(255);
   noStroke();
   float sx=map(x / z, 0, 1, 0, width);
   float sy=map(y / z, 0, 1, 0, height);
   float r =map(z, 0, height, 16, 0);
   
   ellipse(sx, sy, r, r);
  }
}
