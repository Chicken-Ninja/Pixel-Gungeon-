public class Monster extends Character{
	public Monster(int h, int m, String n, int _x, int _y){
		health = h;
		mana = m;
		name = n;
		x = _x;
		y = _y;
	}

	public void Attack(char direction){
		
	}
    
    public void move(char direction){
		if (direction == 'N'){
			setPos(getX(), getY()-1);
		}
		else if (direction == 'E'){
			setPos(getX()+1, getY());
		}
		else if (direction == 'S'){
			setPos(getX(), getY()+1);
		}
		else if (direction == 'N'){
			setPos(getX()-1, getY());
		}
		else {
			System.out.println("Not a direction");
		}
	}
}