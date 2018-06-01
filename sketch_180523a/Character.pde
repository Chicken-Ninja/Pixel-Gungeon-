abstract class Character 
{
    float health , mana;
    String name;
    float x, y;
    char dir;
      
    public float getHealth () 
    {
  return health; 
    }
    
    public void setHealth(float a) 
    {
  health = a;
    }

    public float getmana() 
    {
  return mana; 
    }
    
    public void setmana( float a )
    {
  mana = a ;
    }
    
    public String getName()
    {
  return name;
    }
    
    public void setName(String a)
    {
  name = a; 
    }

    public float getX()
    {
  return x;
    }
    
    public float getY()
    {
  return y;
    }

    public void setPos(float _x, float _y)
    {
    x = _x;
    y = _y;
    }
  
  public char getDir(){
    return dir;
  }
  
  public void setDir(char direction){
    dir = direction;
  }

    abstract float Attack();
    
    abstract void move(char direction);
}
