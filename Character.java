abstract class Character 
{
    int health , mana;
    String name;
	int x, y;
	char dir;

    public int getHealth () 
    {
	return health; 
    }
    
    public void setHealth(int a) 
    {
	health = a;
    }

    public int getmana() 
    {
	return mana; 
    }
    
    public void setmana( int a )
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

    public int getX()
    {
	return x;
    }
    
    public int getY()
    {
	return y;
    }

    public void setPos(int _x, int _y)
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

    abstract void Attack();
    
    abstract void move(char direction);
}