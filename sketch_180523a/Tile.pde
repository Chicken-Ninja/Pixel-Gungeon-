public class Tile 
{
    Boolean hasPlayer,hasMonster,isWall,isExit,isStart,hasPotion,isDoor;
    int row;
    int col; 
    Monster monsterStore = null; 
    Player playerStore = null;
    Potion potionStore = null;
    
    
    

    public Tile(int x , int y , Boolean Wall, Boolean start, Boolean Exit ,boolean door) 
    {
  row = x; 
  col = y; 
  isWall = Wall;
  hasPlayer = false;
  hasMonster = false;
  potionStore = null;
  isStart = start;
  isExit = Exit; 
  isDoor = door; 
    }
    
    public Boolean isWall() 
    {
  return isWall;
    }
    public Boolean isDoor()
    {
      return isDoor;
    }
      
    public Boolean isExit() 
  {
    return isExit;
  }
    public Boolean isStart() 
  {
    return isStart;
  }
        
    public Boolean hasPotion() 
    {
      if(potionStore == null ) 
      {
        return false;
      }
      else { return true;
      }
    }
    
    public void potionOn(Potion a) 
    {
      potionStore = a;
      hasPotion = true;
    }
    
    public void removePotion() 
    {
      if(hasPotion())
      {
        Potion a = potionStore; 
        potionStore = null;
        hasPotion = false;
       
      }
    }
    public void setDoor(boolean value) 
    {
      isDoor = value; 
    }
    
    public Potion getPotion() 
    {
      return potionStore;
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
  
  public Player getPlayer(){
    return playerStore;
  }
  
  public Monster getMonster(){
    return monsterStore;
  }
}
