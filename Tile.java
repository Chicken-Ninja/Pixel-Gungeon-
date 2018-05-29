public class Tile 
{
    Boolean hasPlayer,hasMonster,isWall;
    int row;
    int col; 
    Monster monsterStore; 
    Player playerStore;
    
    

    public Tile(int x , int y , Boolean Wall) 
    {
	x = row; 
	y = col; 
	isWall = Wall;
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
    }
    
    public void PlayerOn(Player a) 
    {
	if(!(monsterStore) && playerStore == null && !(isWall))
	    {
		hasPlayer = true;
		playerStore = a;
	    }
	
    }
    
    public void MonsterOn(Monster a) 
    {
	if(!(playerStore) && monsterStore == null && !{isWall))
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
	monster = null;
	hasMonster = false; 
    }
    
    public Boolean checkPlayer()
    {
	if(!(isWall))
	    {
		return hasPlayer();
	    }
    }

    
    public Boolean checkMonster()
    {
	if(!(isWall))
	    {
		return hasMonster();
	    }
    }
}

	