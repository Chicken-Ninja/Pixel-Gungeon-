public class Player extends Character{
  Weapon weaponStore;
  Armor armorStore;
  
  
  public Player(int h, int m, String n, int _x, int _y){
    health = h;
    mana = m;
    name = n;
    x = _x;
    y = _y;
    dir = 'S';
    weaponStore = new Weapon(5 , 1 , 1 , "Excalibur");
    armorStore = new Armor(3 , 1 , "Junkan");
  }
  
  public int Attack()
  {
     return 
     (int)random(0 , 10) + weaponStore.getDamage();
  }
    
    public void move(char direction){
    dir = direction;
    if (direction == 'w'){
      setPos(getX()-1, getY());
    }
    else if (direction == 'd'){
      setPos(getX(), getY()+1);
    }
    else if (direction == 's'){
      setPos(getX()+1, getY());
    }
    else if (direction == 'a'){
      setPos(getX(), getY()-1);
    }
    else {
      System.out.println("Not a direction");
    }
  }
}
