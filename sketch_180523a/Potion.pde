public class Potion{
  int potionRestore; 
  boolean isMana;
  
  public Potion(Boolean mana) 
  {
    potionRestore = (int) random (10,20);
    isMana = mana;
  }
  
  public int getRestore() 
    {
      return potionRestore;
    }
  public boolean isMana() 
  {
    return isMana;
  }
}
  
