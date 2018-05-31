public class Player extends Character{
  public Player(int h, int m, String n, int _x, int _y){
    health = h;
    mana = m;
    name = n;
    x = _x;
    y = _y;
    dir = 'S';
  }
  
  public void Attack(){
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