public class Monster extends Character{
  int tier; 
  
  
  
  public Monster(int _x, int _y, int level){
    health = 40;
    mana = 10;
    name = "Red Boy";
    tier = level;
    x = _x;
    y = _y;
  }
  
  public int Attack() 
    {
      int a = (int)random (0 , 2) + tier;
      return a;
    }
  
  
  
    
  public Monster(int h, int m, String n, int _x, int _y){
    health = h;
    mana = m;
    name = n;
    x = _x;
    y = _y;
  }
  public void move(char direction){
    dir = direction;
    if (direction == 'w'){
      setPos(getX(), getY()-1);
    }
    else if (direction == 'd'){
      setPos(getX()+1, getY());
    }
    else if (direction == 's'){
      setPos(getX(), getY()+1);
    }
    else if (direction == 'a'){
      setPos(getX()-1, getY());
    }
    else {
      System.out.println("Not a direction");
    }
  }
}