public class PixelGungeon{
    private Tile[][] map;
    private Player playerStore;
    private ArrayList<Monster> enemies = new ArrayList();
    private String[] file;
    
    public PixelGungeon(String data){
      file = loadStrings(data);
      /*for (int n=0; n<file.length; n++){
        System.out.println(file[n]);
      }*/
      map = new Tile[file[0].length()][file.length];
      mapGen();
    }

    public void mapGen(){
      for (int c=0; c<file.length; c++){
        for (int r=0; r<file[0].length(); r++){
          if (file[c].charAt(r) == '#'){
            map[r][c] = new Tile(r,c,true);
          }
          else if(file[c].charAt(r) == 'S'){
            map[r][c] = new Tile(r,c,false);
            Player b = new Player(20,10,"Jeff",r,c);
            map[r][c].PlayerOn(b);
            playerStore = b;
          }
          else if (file[c].charAt(r) == 'M'){
            map[r][c] = new Tile(r,c,false);
            Monster m = new Monster(r,c);
            enemies.add(m);
            map[r][c].MonsterOn(m);
          }
          else{
            map[r][c] = new Tile(r,c,false);
          }
        }
      }
    }

  public int getRows(){
    return map.length;
  }
  
  public int getCols(){
    return map[0].length;
  }
  



  public String toString(){
  String dump = "";
  if (map.length==0){
      return "[]";
  }
  for (int c=0; c<map.length; c++){
     for (int r=0; r<map[0].length; r++){
        if(map[r][c].isWall)
        {
        dump += "W";
        }
        else if(map[r][c].checkPlayer())
        {
        dump += "P";
        }
        else if(map[r][c].checkMonster())
        {
        dump += "M";
        }
        else if(map[r][c].isTile())
        {
        dump += " ";
        }
     }
     dump += "\n";
  }
  return dump;
  }
        
    public void moveRight(Character character) 
      {
        System.out.println("Move right");
          int row = character.getX();
          int col = character.getY();
          if(row + 1 < map.length){
              if (character instanceof Player){
              if(map[row + 1][col].checkMonster()) 
               {
                   map[row + 1][col].getMonster().setHealth(map[row + 1][col].getMonster().getHealth() - ((Player)character).Attack());
                   
                   if(map[row + 1][col].getMonster().getHealth() <= 0)
                     {
                         enemies.remove(map[row+1][col].getMonster());
                         map[row + 1][col].removeMonster();
                     }
               }
              else if(!(map[row+1][col].isWall()))
               {
               map[row][col].removePlayer();
               map[row+1][col].PlayerOn((Player)character);
               character.move('d');
               System.out.println("Player loc: " + row + ", " + col);
               }
              }
              else {
                if (!map[row + 1][col].checkMonster() && !map[row+1][col].checkPlayer() && !map[row+1][col].isWall()){
                 map[row][col].removeMonster();
                 map[row+1][col].MonsterOn((Monster)character);
                 character.move('d');
                 System.out.println("Monster loc: " + row + ", " + col);
                }
              }
            }
      }
     
     public void moveLeft(Character character) 
      {
        System.out.println("Move left");
          int row = character.getX();
          int col = character.getY();
          if(row - 1 >=0){
              if (character instanceof Player){
              if(map[row - 1][col].checkMonster()) 
               {
                   map[row - 1][col].getMonster().setHealth(map[row - 1][col].getMonster().getHealth() - ((Player)character).Attack());
                   
                   if(map[row - 1][col].getMonster().getHealth() <= 0)
                     {
                         enemies.remove(map[row-1][col].getMonster());
                         map[row - 1][col].removeMonster();
                     }
               }
              else if(!(map[row-1][col].isWall()))
               {
               map[row][col].removePlayer();
               map[row-1][col].PlayerOn((Player)character);
               character.move('a');
               System.out.println("Player loc: " + row + ", " + col);
               }
              }
              else {
                if (!map[row - 1][col].checkMonster() && !map[row-1][col].checkPlayer() && !map[row-1][col].isWall()){
                 map[row][col].removeMonster();
                 map[row-1][col].MonsterOn((Monster)character);
                 character.move('a');
                 System.out.println("Monster loc: " + row + ", " + col);
                }
              }
            }
      }
      
    public void moveUp(Character character) 
      {
        System.out.println("Move up");
          int row = character.getX();
          int col = character.getY();
          if(col-1>=0){
              if (character instanceof Player){
              if(map[row][col-1].checkMonster()) 
               {
                   map[row][col-1].getMonster().setHealth(map[row][col-1].getMonster().getHealth() - ((Player)character).Attack());
                   
                   if(map[row][col-1].getMonster().getHealth() <= 0)
                     {
                         enemies.remove(map[row][col-1].getMonster());
                         map[row][col-1].removeMonster();
                     }
               }
              else if(!(map[row][col-1].isWall()))
               {
               map[row][col].removePlayer();
               map[row][col-1].PlayerOn((Player)character);
               character.move('w');
               System.out.println("Player loc: " + row + ", " + col );
               }
              }
              else {
                if (!map[row][col-1].checkMonster() && !map[row][col-1].checkPlayer() && !map[row][col-1].isWall()){
                 map[row][col].removeMonster();
                 map[row][col-1].MonsterOn((Monster)character);
                 character.move('w');
                 System.out.println("Monster loc: " + row + ", " + col );
                }
              }
            }
      }
      
    public void moveDown(Character character) 
      {
        System.out.println("Move down");
          int row = character.getX();
          int col = character.getY();
          if(col+1<map[0].length){
              if (character instanceof Player){
              if(map[row][col+1].checkMonster()) 
               {
                   map[row][col+1].getMonster().setHealth(map[row][col+1].getMonster().getHealth() - ((Player)character).Attack());
                   
                   if(map[row][col+1].getMonster().getHealth() <= 0)
                     {
                         enemies.remove(map[row][col+1].getMonster());
                         map[row][col+1].removeMonster();
                     }
               }
              else if(!(map[row][col+1].isWall()))
               {
               map[row][col].removePlayer();
               map[row][col+1].PlayerOn((Player)character);
               character.move('s');
               System.out.println("Player loc: " + row + ", " + col);
               }
              }
              else {
                if (!map[row][col+1].checkMonster() && !map[row][col+1].checkPlayer() && !map[row][col+1].isWall()){
                 map[row][col].removeMonster();
                 map[row][col+1].MonsterOn((Monster)character);
                 character.move('s');
                 System.out.println("Monster loc: " + row + ", " + col);
                }
              }
            }
      }
      
        
      
      
      
      
    public void moveMain(char dir, Character character){
      if (dir == 'w'){
        moveUp(character);
      }
      else if (dir == 'd'){
        moveRight(character);
      }
      else if (dir == 's'){
        moveDown(character);
      }
      else if (dir == 'a'){
        moveLeft(character);
      }
    }
    
    public void monsterMove(){
    for (Monster m : enemies){
      int x = m.getX();
      int y = m.getY();
      int a = playerStore.getX();
      int b = playerStore.getY();
      
      int upDist = y - b;
      int sideDist = x- a;

      
      System.out.println(upDist);
      System.out.println(sideDist);

      
      if(abs(upDist) >= abs(sideDist)) 
        {
            
             if(upDist > 0) 
              {
                 moveUp(m);
              }
             else{
                 moveDown(m);
             }
        }
        
        else {
            
               if(sideDist > 0)
              {
                moveLeft(m);
              }
              else {
                moveRight(m);
              }
        }
    }
             
              
             
      
     
    
          
        
    
      
      
      
      
      //char dir = dirs[floor(random(4))];
      //moveMain(dir, m);
    }

      
    void playerMove(char dir) {
      moveMain(dir, playerStore);
    }
    
    public void display(){
      for (int r=0; r<map.length; r++){
        for (int c=0; c<map[0].length; c++){
          if(map[r][c].isWall())
          {
            fill(150);
            rect(r*50, c*50, 50, 50);
          }
          else if(map[r][c].checkPlayer())
          {
            //System.out.println("player draw: " + r + ", " + c);
            ellipseMode(CORNER);
            fill(50,140,200);
            ellipse(r*50, c*50, 50, 50);
          }
          else if(map[r][c].checkMonster())
          {
            ellipseMode(CORNER);
            fill(255,0,0);
            ellipse(r*50, c*50, 50, 50);
          }
          //Makes floor gridded
          /*else
          {
            fill(255,255,255);
            rect(r*50, c*50, 50, 50);
          }*/
        }
      }
    }
    }
    

PixelGungeon a;
boolean nextTurn;

   void keyPressed(){
     a.playerMove(key);
     if (key == 'w' || key == 'd' || key == 's' || key == 'a'){
       nextTurn = true;
     }
   }
   
  void setup(){
    size(500,500);
    a = new PixelGungeon("data.txt");
    surface.setSize(a.getRows() * 50, a.getCols() * 50);
  }
  
  void draw(){
    background(255);
    fill(0);
    text(frameRate, 20, 20);
    a.display();
    if (nextTurn){
      a.monsterMove();
      nextTurn = false;
    }
    //System.out.println(a);
  }
