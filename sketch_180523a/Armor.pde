public class Armor
{
    int defense;
    int tier;
    String name ;
      
  public Armor (int buffness , int level, String nickname )
  {
      defense = buffness;
      tier = level;
      name = nickname;
  }
  
  public void setName (String a )
  {
     name = a ;
  }
       
  
  
  public String getName( )
  {
      return name; 
  }
  public int getTier ()  
  {
    return tier; 
  }
    
  public int getDefense()
  {
    return defense; 
  }
    
}