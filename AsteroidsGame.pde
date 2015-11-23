SpaceShip pacman = new SpaceShip(); //your variable declarations here
boolean goUP = false;
boolean goDOWN = false;
boolean goLEFT = false;
boolean goRIGHT = false;
Star[] bleh = new Star[400];

public void setup() 
{
  size(700,700);//your code here
  bleh = new Star[100];
  for(int i = 0; i < bleh.length; i++){
    bleh[i] = new Star();
  }
}
public void draw() 
{
  background(0);
  pacman.show();//your code here
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
}

public void keyPressed()
{
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
class Star
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
    myColor = color(239,250,0);
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

