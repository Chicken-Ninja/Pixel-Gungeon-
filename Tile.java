public class Tile 
{
    Boolean hasPlayer,hasMonster,isWall;
    int row;
    int col; 
    Monster monsterStore = null; 
    Player playerStore = null;
    
    

    public Tile(int x , int y , Boolean Wall) 
    {
	row = x; 
	col = y; 
	isWall = Wall;
	hasPlayer = false;
	hasMonster = false;
    }
    
    public Boolean isWall() 
    {
	return isWall;
    }
    
    
    public Boolean isTile() 
    {
	if(!(isWall && hasPlayer && hasMonster))
	    {
		return true ; 
	    }
	else { return false;}
    }
    
    public void PlayerOn(Player a) 
    {
	if(!(hasMonster) && playerStore == null && !(isWall))
	    {
		hasPlayer = true;
		playerStore = a;
	    }
	
    }
    
    public void MonsterOn(Monster a) 
    {
	if(!(hasPlayer) && monsterStore == null && !(isWall))
	    {
		hasMonster = true; 
		monsterStore = a;
	    }
    }
    
    
    public void removePlayer() 
    {
	if(!(isWall) && playerStore != null && hasPlayer)
	    {
		playerStore = null;
		hasPlayer = false;
	    }
    }
    
    public void removeMonster() 
    {
	if(!(isWall) && monsterStore != null && hasMonster)
	monsterStore = null;
	hasMonster = false; 
    }
    
    public Boolean checkPlayer()
    {
	if(!(isWall))
	    {
		return hasPlayer;
	    }
	else{ return false;}
    }

    
    public Boolean checkMonster()
    {
	if(!(isWall))
	    {
		return hasMonster;
	    }
	else{ return false;}
    }
	
	public Player player(){
		return playerStore;
	}
	
	public Monster monster(){
		return monsterStore;
	}
}

	