public class Weapon {
    int damage;
    int accuracy; 
    int tier; 
    String name; 
    
    public Weapon (int ouchies , int accuracies , int level ,String nickname) 
    {
       damage = ouchies; 
       accuracy = accuracies;
       tier = level;
       name = nickname;
    }
    
    public int getDamage() 
    {
        return damage; 
    }
    
    public int getAccuracy() 
    {
          return accuracy;
    }
     public int getTier() 
    {
           return tier;
    }
    public void setName( String a )
    {
      name = a; 
    }
    
    public String getName()
    {
      return name ;
    }
        
         
    
}