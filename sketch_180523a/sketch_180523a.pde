import java.util.*;

public class PixelGungeon{
    private Tile[][] map;
    private String[] files = {"data1.txt","data2.txt","data3.txt","data4.txt","data5.txt",
                              "data6.txt","data7.txt","data8.txt","data9.txt","data10.txt"};
                              
    private String[][] maps = new String[5][0];
    private Player playerStore;
    private ArrayList<Monster> enemies = new ArrayList();
    private PImage playerModel, monsterModel, wallModel, stairModel, tileModel, doorModel;
    private PImage hurtPlayer, hurtMonster;
    private PImage healthBar, keyModel;//swordModel;
    private boolean gameOver;
    private int roomNumber = 0;
    private boolean initialRoom = true; 
    private int exitX, exitY;
    private ArrayList<Potion> potionStore;
    private final char[] dirs = {'w','d','s','a'};
    
    public PixelGungeon(){
      //String [][] maps = new String[5][];
      int counter = 0;
      while(counter < maps.length)      
      {
        int num = floor(random(files.length));
        //System.out.println("File: " + files[num]);
        maps[counter] = loadStrings(files[num]);
        counter++;
      }
      gameOver = false;
      potionStore = new ArrayList<Potion>();
      playerModel = loadImage("PlayerModel.png");
      hurtPlayer = loadImage("HurtPlayer.png");
      monsterModel = loadImage("MonsterModel.png");
      hurtMonster = loadImage("HurtMonster.png");
      tileModel = loadImage("FloorTile.png");
      wallModel = loadImage("Wall.png");
      stairModel = loadImage("staircase.png");
      healthBar = loadImage("HealthBar.png");
      //swordModel = loadImage("sword.png");
      map = new Tile[maps[roomNumber][0].length()][maps[roomNumber].length];
      mapGen(maps[roomNumber]);
    }


    
  public void nextRoom() 
    {
      
       initialRoom = false;
       roomNumber++;
       int x = playerStore.getX();
       int y = playerStore.getY();
       System.out.println(map[x][y].checkPlayer());
       map[x][y].removePlayer();
       if (roomNumber<maps.length){
         map = new Tile[maps[roomNumber][0].length()][maps[roomNumber].length];
         enemies = new ArrayList();
         mapGen(maps[roomNumber]);
         surface.setSize(getRows() * 50, getCols() * 50);
       }
       else {
         gameOver = true;
       }
       System.out.println(map.length);
       System.out.println(map[0].length);
    }



  public int getPlayerHealth() 
  {
    return playerStore.getHealth();
  }
      
      
      
  public boolean getGameOver(){
    return gameOver;
  }



  public void mapGen(String[] file){
      System.out.println("mapGen()");
      for (int c=0; c<file.length; c++){
        for (int r=0; r<file[0].length(); r++){
          if (file[c].charAt(r) == '#'){
            map[r][c] = new Tile(r,c,true,false , false ,false );
          }
          else if (file[c].charAt(r) == 'M'){
            map[r][c] = new Tile(r,c,false,false, false , true);
            Monster m = new Monster(r,c , 1);
            enemies.add(m);
            map[r][c].MonsterOn(m);
          }
          else if(file[c].charAt(r) == 'S'){
            map[r][c] = new Tile(r,c,false, true, false , true);
            if(initialRoom == true)
            {
              Player b = new Player(r,c);
              map[r][c].PlayerOn(b);
              playerStore = b;
            }
            else if(initialRoom == false)
            {
              map[r][c].PlayerOn(playerStore);
              playerStore.setPos( r, c) ;
              
            }
          }
          else if(file[c].charAt(r) == 'E'){
            map[r][c] = new Tile(r,c,false,false,true , true);
            exitX = r;
            exitY = c;
          }
          else{
            map[r][c] = new Tile(r,c,false, false , false , false);
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
  
  
  
  public void moveMain(char dir, Character character){
      int x = 0;
      int y = 0;
      if (dir == 'w'){
        y = -1;
      }
      else if (dir == 'd'){
        x = 1;
      }
      else if (dir == 's'){
        y = 1;
      }
      else if (dir == 'a'){
        x = -1;
      }
      int row = character.getX();
      int col = character.getY();
      boolean sameTurn = false;
      if(row + x < map.length && row + x >=0 && col + y <map[0].length && col + y >=0 && !gameOver){
        if (character instanceof Player){
          if(map[row + x][col + y].checkMonster()) 
            {
              map[row + x][col + y].getMonster().setHealth(map[row + x][col + y].getMonster().getHealth() - ((Player)character).Attack());
              image(hurtMonster, (row+x)*50+1, (col+y)*50+1, 49, 49);
              if(map[row + x][col + y].getMonster().getHealth() <= 0)
                {
                  if(map[row + x][col + y].getMonster().lootChance())
                  {
                    map[row + x][col + y].potionOn(map[row + x][col + y].getMonster().dropPotion());
                    sameTurn = true;
                  }
                  enemies.remove(map[row+x][col + y].getMonster());
                  map[row + x][col + y].removeMonster();
                }
            }
          else if(map[row + x][col + y].isExit())
            {
              nextRoom();
            }
           
             
          else if(!(map[row+x][col+y].isWall()))
            {
              map[row][col].removePlayer();
              map[row+x][col+y].PlayerOn((Player)character);
              character.move(dir);
            
            if(map[row + x][col + y].hasPotion() && sameTurn == false)
           {
             Potion a = map[row + x][col + y].getPotion();
             potionStore.add(a);
             map[row + x][col + y].removePotion();
             System.out.println("HELLO MOTO");
           }
            }
        }
        else {
          if (map[row+x][col+y].checkPlayer()){
            map[row+x][col+y].getPlayer().setHealth(map[row+x][col+y].getPlayer().getHealth() - ((Monster)character).Attack());
            image(hurtPlayer, (row+x)*50+1, (col+y)*50+1, 49, 49);
            if(map[row+x][col+y].getPlayer().getHealth() <= 0 )
              {
                map[row+x][col+y].removePlayer();
                System.out.println("OOF");
                gameOver = true;
              }
          }
          else if (!map[row+x][col+y].checkMonster() && !map[row+x][col+y].isWall()){
            map[row][col].removeMonster();
            map[row+x][col+y].MonsterOn((Monster)character);
            character.move(dir);
          }
        }
      }
  }
  
  public Boolean PotionInv()
  {
    for(int counter = 0; counter < potionStore.size(); counter ++ )
    {
      if(potionStore.get(counter) != null)
      {
        return true;
      }
    }
    return false;
  }
  
  
  public void usePotion() 
  {
    if(PotionInv())
    {
      
    playerStore.setHealth(playerStore.getHealth() + potionStore.get(0).getRestore());
    potionStore.remove(0);
    if(playerStore.getHealth() > 50)
    {
      playerStore.setHealth(50);
    }
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
      //System.out.println(upDist);
      //System.out.println(sideDist);
      if (abs(upDist) + abs(sideDist)<8){
      if(abs(upDist) > abs(sideDist)){
        if(upDist > 0) 
          {
            moveMain('w',m);
          }
        else{
          moveMain('s',m);
        }
      }
      else if(abs(upDist) < abs(sideDist)) {
        if(sideDist > 0)
          {
            moveMain('a',m);
          }
        else {
          moveMain('d',m);
        }
      }
      else {
        if (floor(random(2)) == 0){
          if(upDist > 0) 
            {
              moveMain('w',m);
            }
          else{
            moveMain('s',m);
          }
        }
        else {
          if(sideDist > 0)
            {
              moveMain('a',m);
            }
          else {
            moveMain('d',m);
          }
        }
      }
      }
      else {
        char dir = dirs[floor(random(4))];
        moveMain(dir,m);
      }
    }
  }
       
        
        
        
  void playerMove(char dir) {
      //System.out.println("playerMove()");
      moveMain(dir, playerStore);
      if (playerStore.getX() == exitX && playerStore.getY() == exitY){
        nextRoom();
      }
  }
    
    
    
    
  public void display(){
      //System.out.println("display()");
      for (int r=0; r<map.length; r++){
        for (int c=0; c<map[0].length; c++){
          if(map[r][c].isWall())
          {
            image(wallModel, r*50, c*50, 50, 50);
          }
          
          else if(map[r][c].checkPlayer())
          {
            if (map[r][c].isStart() || map[r][c].isExit()){
              image(stairModel, r*50, c*50, 50, 50);
            }
            else{
              image(tileModel, r*50, c*50, 50, 50);
            }
            image(playerModel, r*50+1, c*50+1, 49, 49);
          }
         
          else if(map[r][c].checkMonster())
          {
            image(tileModel, r*50, c*50, 50, 50);
            image(monsterModel, r*50+1, c*50+1, 49, 49);
            fill(255);
            rect(r*50, c*50-15,50,10);
            fill(255,0,0);
            rect(r*50,c*50-15,map[r][c].getMonster().getHealth()/40.0*50,10);
          }
          else if(map[r][c].isExit() || map[r][c].isStart()){
            image(stairModel, r*50, c*50, 50, 50);
          }
          else{
            image(tileModel, r*50, c*50, 50, 50);
          }
        }
      }
      fill(255);
      rect(0.20294*healthBar.width/4,0.21056*healthBar.height/4,0.72769*healthBar.width/4,0.57545*healthBar.height/4);
      fill(255,0,0);
      rect(0.20294*healthBar.width/4,0.21056*healthBar.height/4,playerStore.getHealth()/50.0*0.72769*healthBar.width/4,0.57545*healthBar.height/4);
      image(healthBar,0,0,healthBar.width/4, healthBar.height/4);
      //image(swordModel, playerStore.getX()*50, playerStore.getY()*50+35, swordModel.width/2, swordModel.height/2);
  }
}
    

PixelGungeon a;
boolean nextTurn;

   void keyPressed(){
     if(key == 'f')
     {
       System.out.println(a.getPlayerHealth());
       a.usePotion();
       System.out.println(a.getPlayerHealth());
       
     }
     else {
     a.playerMove(key);
     if (key == 'w' || key == 'd' || key == 's' || key == 'a'){
       nextTurn = true;
     
   }
   }
   }
   
  void setup(){
    size(500,500);
    a = new PixelGungeon();
    surface.setSize(a.getRows() * 50, a.getCols() * 50);
  }
  
  void draw(){
    background(255);
    a.display();
    if (nextTurn){
      a.monsterMove();
      nextTurn = false;
    }
    if(a.getGameOver() && a.getPlayerHealth() <= 0 )
    {
      PFont f = createFont("Arial" , 16 , true);
      textFont(f, 72);
      fill(255, 0 , 0);
      text("YOU LOSE!" ,a.getRows()/ 2 * 50 - 150 , a.getCols() / 2 * 50);
    }
    else if (a.getGameOver()){
      PFont f = createFont("Arial",16,true);
      textFont(f,72);
      fill(0,0,255);
      text("YOU WON!",a.getRows()/2 * 50 - 150,a.getCols()/2 * 50);
    }
    
  }
