public class Weapon {
    float damage;
    float accuracy; 
    float tier; 
    String name; 
    
    public Weapon (float ouchies , float accuracies , float level ,String nickname) 
    {
       damage = ouchies; 
       accuracy = accuracies;
       tier = level;
       name = nickname;
    }
    
    public float getDamage() 
    {
        return damage; 
    }
    
    public float getAccuracy() 
    {
          return accuracy;
    }
     public float getTier() 
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
       
