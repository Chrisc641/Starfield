Particle [] stars;
int j;

void setup()
{
	size(500, 500);
  noStroke();
	stars = new Particle[150];
    stars[0] = new OddballParticle();
    stars[1] = new JumboParticle();
	for(int i = 2; i < stars.length; i++)
 	{
 		stars[i] = new NormalParticle();
 	} 
}
void draw()
{
  background(0);
	for(j = 1; j < stars.length; j++)
 	{
 		stars[j].move();
 		stars[j].show();
 	}
    fill(0);
    ellipse(250, 250, 250, 250);
    stars[0].move();
    stars[0].show();
}
class NormalParticle implements Particle
{
	double x, y, speed, angle;
	float size;
	NormalParticle()
	{
		x = 250;
 		y = 250;
 		size = 2;
    	angle = Math.random() * 2 * Math.PI;
    	speed = Math.random() * 2;
	}
	public void show()
 	{
 		fill(255);
 		ellipse((float)x, (float)y , size, size);
 	}  
 	public void move()
 	{
 		if(x < 0 || x > 500 || y < 0 || y > 500)
    	{
	      x = 250;
	      y = 250;
	      angle = Math.random() * 2 * Math.PI;
	      speed = Math.random() * 2;
    	}
 		x = x + Math.cos(angle) * speed;
 		y = y + Math.sin(angle) * speed;
 	} 
}
interface Particle
{
  public void show();
  public void move();
}
class OddballParticle implements Particle
{
  double x, y, speed, angle;
  OddballParticle()
  {
    x = Math.random() * 501;
    y = Math.random() * 501;
    angle = Math.random() * 2 * Math.PI;
	speed = Math.random() * 2.5 + 0.5;
  }
  public void show()
  {
    fill(109, 225, 240);
    ellipse((float)x, (float)y, 8, 10);  
    fill(99, 47, 245);
    ellipse((float)x, (float)(y + 3), 20, 8);
  }
    void resetSpeed()
    {
    	speed = Math.random() * 2.5 + 0.5;
    }
  public void move()
  {
    if(x < 0)
    {
	    angle = Math.random() * Math.PI - Math.PI/2;
		resetSpeed();
	}
	if(x > 500) 
	{
		angle = Math.random() * Math.PI + Math.PI/2;
		resetSpeed();
	}
	if(y < 0) 
	{
		angle = Math.random() * Math.PI;
		resetSpeed();
	}
	if(y > 500)
	{
		angle = Math.random() * Math.PI * -1;
		resetSpeed();
	}
	x = x + Math.cos(angle) * speed;
 	y = y + Math.sin(angle) * speed;
  }
}
class JumboParticle extends NormalParticle
{
	JumboParticle()
	{
		size = 10;
	}
}