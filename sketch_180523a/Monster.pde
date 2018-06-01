public class Monster extends Character{
    
  public Monster(float h, float m, String n, float _x, float _y, char direction){
    health = h;
    mana = m;
    name = n;
    x = _x;
    y = _y;
    dir = direction;
  }

  public void behavior(){
    char[] dirs = {'N', 'E', 'S', 'W'};
    move(dirs[floor(random(4)) + 1]);
  }
  
  public void Attack(){
  }
    
    public void move(char direction){
    dir = direction;
    if (direction == 'N'){
      setPos(getX()-1, getY());
    }
    else if (direction == 'E'){
      setPos(getX(), getY()+1);
    }
    else if (direction == 'S'){
      setPos(getX()+1, getY());
    }
    else if (direction == 'W'){
      setPos(getX(), getY()-1);
    }
    else {
      System.out.println("Not a direction");
    }
  }
}
