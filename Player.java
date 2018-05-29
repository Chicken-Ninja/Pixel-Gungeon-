public class Player extends Character{
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