public class PixelGungeon{
    private Tile[][] map;
    private Player playerStore;
    public PixelGungeon(){
    public Character[] turnOrder;
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
  b.setPos(0 , 1);
  Monster m = new Monster(10,10,"Bob",4,3,'W');
  map[4][3].MonsterOn(m);
    }


    public String toString(){
  String dump = "";
  if (map.length==0){
      return "[]";
  }
  for (int r=0; r<map.length; r++){
      for (int c=0; c<map[0].length; c++){
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
        
    public void MoveRight() 
      {
          int row = playerStore.getX();
          int col = playerStore.getY();
          if(col + 1 < map[0].length && !(map[row][col + 1].checkMonster()))
            {
               map[row][col].removePlayer();
               map[row][col+1].PlayerOn(playerStore);
            }
      }
      
    public void MoveLeft() 
      {
          int row = playerStore.getX();
          int col = playerStore.getY();
          if(col - 1 >= 0 && !(map[row][col - 1].checkMonster()))
          {
              map[row][col].removePlayer();
              map[row][col - 1].PlayerOn(playerStore);
          }
      }
      
    public void MoveUp()
      {
          int row = playerStore.getX();
          int col = playerStore.getY();
          if(row  - 1 >= 0 && !(map[row - 1][col].checkMonster()))
            {
                map[row][col].removePlayer();
                map[row - 1][col];
            }
      }
    public void MoveDown() 
      {
          int row = playerStore.getX();
          int col = playerStore.getY();
          if(row + 1 < map.length && !(map[row + 1][col].checkMonster()))
            {
                map[row][col].removePlayer();
                map[row + 1][col].PlayerOn(playerStore);
            }
      }
      
      
      
    
    public void display(){
      for (int r=0; r<map.length; r++){
        for (int c=0; c<map[0].length; c++){
          if(map[r][c].isWall)
          {
            fill(150);
            rect(r*50, c*50, 50, 50);
          }
          else if(map[r][c].checkPlayer())
          {
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
          else if(map[r][c].isTile())
          {
            fill(255,255,255);
            rect(r*50, c*50, 50, 50);
          }
        }
      }
    }
}

PixelGungeon a;

  void setup(){
    size(500,500);
    a = new PixelGungeon();
  }
  
  void draw(){
    background(255);
    fill(0);
    text(frameRate, 20, 20);
    a.display();
  }