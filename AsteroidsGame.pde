SpaceShip pacman = new SpaceShip(); //your variable declarations here
boolean goUP = false;
boolean goDOWN = false;
boolean goLEFT = false;
boolean goRIGHT = false;
Star[] bleh;
ArrayList <Asteroid> asteroidList;
int blah;
public void setup() //Draws things out
{
bleh = new Star[400];
blah = 13;
  size(700,700); 
  for(int i = 0; i < bleh.length; i++){
    bleh[i] = new Star();
  }
  asteroidList = new ArrayList <Asteroid>();

 for (int i=0; i< blah; i++)
 {
  asteroidList.add(new Asteroid());
 }
}
public void draw() //Controls and Draw things out
{
  background(0);
  pacman.show();
  pacman.move();
  if(goUP == true){
    pacman.accelerate(.1);
  }
  if(goDOWN == true){
    pacman.accelerate(-.1);
  }
  if(goLEFT == true){
    pacman.rotate(-9);
  }
  if(goRIGHT == true){
    pacman.rotate(9);
  }
  for (int i=0; i< bleh.length; i++)
  {
    stroke(1);
    bleh[i].show();
  }
  for (int a=0; a< asteroidList.size() -1; a++)
  {
    asteroidList.get(a).show();
    asteroidList.get(a).move();
  }
  for(int i = 0; i < asteroidList.size(); i++)
  {
    if( dist(asteroidList.get(i).getX(), asteroidList.get(i).getY(), pacman.getX(),pacman.getY())<20 )
      asteroidList.remove(i);
  }
}


public void keyPressed() //ensured that the things pressed works
{
  if(key == 'a'){
    pacman.setX((int)(Math.random()*700));
    pacman.setY((int)(Math.random()*700));
    pacman.setDirectionX(0);
    pacman.setDirectionY(0);
    pacman.setPointDirection((int)(Math.random()*700));
  }
  if(keyCode == UP){
    goUP = true;
  }
  if(keyCode == DOWN){
    goDOWN = true;
  }
  if(keyCode == LEFT){
    goLEFT = true;
  }
  if(keyCode == RIGHT){
    goRIGHT = true;
  }
}
public void keyReleased(){
  if(keyCode == UP )
  {
    goUP = false;
  }
  if(keyCode == DOWN)
  {
    goDOWN = false;
  }
  if(keyCode == LEFT)
  {
    goLEFT = false;
  }
  if(keyCode == RIGHT)
  {
    goRIGHT = false;
  }
}
class Star //what a star looks like or where it goes
{
  private int myX, myY;
  public Star()
  {

    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*700);
  }
  public void show()
  {
    fill(255);
    ellipse(myX, myY, 3, 3);
  }
}

class Asteroid extends Floater
{
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return (int)myDirectionX;}  
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return (int)myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return (int)myPointDirection;}

  public Asteroid()
  {
  
    corners = 12;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 0;
    yCorners[0] = 10;
    xCorners[1] = 6;
    yCorners[1] = 8;
    xCorners[2] = 10;
    yCorners[2] = 5;
    xCorners[3] = 12;
    yCorners[3] = 0;
    xCorners[4] = 12;
    yCorners[4] = -7;
    xCorners[5] = 6;
    yCorners[5] = 0;
    xCorners[6] = 0;
    yCorners[6] = -7;
    xCorners[7] = -6;
    yCorners[7] = 0;
    xCorners[8] = -12;
    yCorners[8] = -7;
    xCorners[9] = -12;
    yCorners[9] = 0;
    xCorners[10] = -10;
    yCorners[10] = 5;
    xCorners[11] = -6;
    yCorners[11] = 8;

    myColor = color(0,0,255);
    myCenterX = (int)(Math.random()*700);
    myCenterY = (int)(Math.random()*700);
    myDirectionX = ((int)(Math.random()*5)-2);
    myDirectionY = ((int)(Math.random()*5)-2);
    myPointDirection = 180;
  }
  public void move()
  {
    super.move();
    if(myCenterX > -1)
    {
      myCenterX=myCenterX+2;
      myCenterY++;
    }
  }

}
class SpaceShip extends Floater  
{      
  public SpaceShip(){
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -2;
    yCorners[0] = 0;
    xCorners[1] = 10;
    yCorners[1] = 9;
    xCorners[2] = 0;
    yCorners[2] = 12;
    xCorners[3] = -7;
    yCorners[3] = 9;
    xCorners[4] = -11;
    yCorners[4] = 0;
    xCorners[5] = -7;
    yCorners[5] = -9;
    xCorners[6] = 0;
    yCorners[6] = -12;
    xCorners[7] = 10;
    yCorners[7] = -9;
    myColor = color(255,255,0);
    myCenterX = 250;
    myCenterY = 250;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
}
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return (int)myDirectionX;}  
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return (int)myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return (int)myPointDirection;} //your code here
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
