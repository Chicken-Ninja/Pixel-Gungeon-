public class Armor
{
    float defense;
    float tier;
    String name ;
      
  public Armor (float buffness , float level, String nickname )
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
  public float getTier ()  
  {
    return tier; 
  }
    
  public float getDefense()
  {
    return defense; 
  }
    
}
      
    
