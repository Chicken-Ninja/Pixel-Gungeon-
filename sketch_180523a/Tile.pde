public class Tile 
{
    boolean hasPlayer = false;
    boolean hasMonster = false;
    boolean isWall = false;
    boolean isExit = false;
    boolean isStart = false;
    boolean hasPotion = false;
    boolean isDoor = false;
    int row;
    int col; 
    Monster monsterStore = null; 
    Player playerStore = null;
    Potion potionStore = null;
    
    
    

    public Tile(int x , int y , char type) 
    {
  row = x; 
  col = y; 
  if (type == '#'){
    isWall = true;
  }
  else if (type == 'S'){
    isStart = true;
  }
  else if (type == 'E'){
    isExit = true;
  }
  else if (type == 'D'){
    isDoor = true;
  }
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
