public class PixelGungeon{
    private Tile[][] map;
    private Player playerStore;
    public PixelGungeon(){
  map = new Tile[10][10];
  mapGen();
    }

    public void mapGen(){
  for (int r = 0; r<map.length; r++){
      for (int c = 0; c<map[0].length; c++){
    map[r][c] = new Tile(r , c , false);
      }
  }
  for (int n=0; n<map[0].length; n++){
      map[0][n] = new Tile(0 , n , true);
      map[map.length-1][n] = new Tile( map.length - 1 , n , true);
  }
  for (int n=0; n<map.length; n++){
      map[n][0] = new Tile(n , 0 , true) ;
      map[n][map[0].length-1] = new Tile( n  , map[0].length - 1 , true);
  }
  map[0][1] = new Tile(0,1, false);
  map[8][9] = new Tile(8,9, false);
  Player b = new Player(10,10,"Jeff",0,1);
  map[0][1].PlayerOn(b);
  playerStore = b; 
  //b.setPos(0 , 1);
  Monster m = new Monster(10,10,"Bob",4,3,'W');
  map[4][3].MonsterOn(m);
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
        
    public void moveRight() 
      {
        System.out.println("Move right");
          int row = playerStore.getX();
          int col = playerStore.getY();
          if(row + 1 < map.length )
             {if(map[row + 1][col].checkMonster()) 
               {
                   map[row + 1][col].getMonster().setHealth(map[row + 1][col].getMonster().getHealth() - playerStore.Attack());
                   
                   if(map[row + 1][col].getMonster().getHealth() <= 0)
                     {
                         map[row + 1][col].removeMonster();
                     }
               }
               else if(!(map[row+1][col].isWall()))
            {
               map[row][col].removePlayer();
               map[row+1][col].PlayerOn(playerStore);
               playerStore.setPos(row+1, col);
               System.out.println("Player loc: " + row + ", " + col);
            }
      }
      }
      
    public void moveLeft() //row - 1 
      {
        System.out.println("Move left");
          int row = playerStore.getX();
          int col = playerStore.getY();
          if(row - 1 >= 0 )
             {if(map[row - 1][col].checkMonster()) 
               {
                   map[row - 1][col].getMonster().setHealth(map[row - 1][col].getMonster().getHealth() - playerStore.Attack());
                   
                   if(map[row - 1][col].getMonster().getHealth() <= 0)
                     {
                         map[row - 1][col].removeMonster();
                     }
               }
               else if(!(map[row - 1][col].isWall()))
            {
               map[row][col].removePlayer();
               map[row-1][col].PlayerOn(playerStore);
               playerStore.setPos(row-1, col);
               System.out.println("Player loc: " + row + ", " + col);
            }
      }
      }
      
    public void moveUp() //col - 1
      {
        System.out.println("Move up");
          int row = playerStore.getX();
          int col = playerStore.getY();
          if(col - 1 >= 0 )
             {if(map[row][col - 1].checkMonster()) 
               {
                   map[row][col - 1].getMonster().setHealth(map[row][col - 1].getMonster().getHealth() - playerStore.Attack());
                   
                   if(map[row][col - 1].getMonster().getHealth() <= 0)
                     {
                         map[row][col - 1].removeMonster();
                     }
               }
               else if(!(map[row ][col - 1].isWall()))
            {
               map[row][col].removePlayer();
               map[row][col - 1].PlayerOn(playerStore);
               playerStore.setPos(row, col - 1);
               System.out.println("Player loc: " + row + ", " + col);
            }
      }
      }
    public void moveDown() 
      {
          System.out.println("Move down");
          int row = playerStore.getX();
          int col = playerStore.getY();
         if(col + 1 < map.length )
             {if(map[row][col + 1].checkMonster()) 
               {
                   map[row][col + 1].getMonster().setHealth(map[row][col + 1].getMonster().getHealth() - playerStore.Attack());
                   
                   if(map[row][col + 1].getMonster().getHealth() <= 0)
                     {
                         map[row][col + 1].removeMonster();
                     }
               }
               else if(!(map[row][col + 1].isWall()))
            {
               map[row][col].removePlayer();
               map[row][col + 1].PlayerOn(playerStore);
               playerStore.setPos(row, col + 1);
               System.out.println("Player loc: " + row + ", " + col);
            }
      }
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
          else
          {
            fill(255,255,255);
            rect(r*50, c*50, 50, 50);
          }
        }
      }
    }
}

PixelGungeon a;

  void keyPressed() {
    System.out.println("Key: " + key);
    if (key == 'w'){
      a.moveUp();
    }
    else if (key == 'd'){
      a.moveRight();
    }
    else if (key == 's'){
      a.moveDown();
    }
    else if (key == 'a'){
      a.moveLeft();
    }
  }
    
  void setup(){
    size(500,500);
    a = new PixelGungeon();
  }
  
  void draw(){
    background(255);
    fill(0);
    text(frameRate, 20, 20);
    a.display();
    //System.out.println(a);
  }
