abstract class Character 
{
    int health , mana;
    String name;

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

    abstract void Attack();
    
    abstract void move();
    
    






}