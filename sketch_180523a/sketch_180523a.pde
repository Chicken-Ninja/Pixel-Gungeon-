public class PixelGungeon{
    private Tile[][] map;
    private Player playerStore;
    private ArrayList<Monster> enemies = new ArrayList();
    private char[] dirs = {'w','d','s','a'};
    
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
  Monster m = new Monster(10,10,"Bob",4,3);
  enemies.add(m);
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
        
    public void moveRight(Character character) 
      {
        System.out.println("Move right");
          int row = character.getX();
          int col = character.getY();
          if(row + 1 < map.length && !(map[row+1][col].checkMonster() || map[row+1][col].checkPlayer()) && !(map[row+1][col].isWall()))
            {
              if (character instanceof Player){
               map[row][col].removePlayer();
               map[row+1][col].PlayerOn((Player)character);
               character.move('d');
               System.out.println("Player loc: " + row + ", " + col);
              }
              else {
               map[row][col].removeMonster();
               map[row+1][col].MonsterOn((Monster)character);
               character.move('d');
               System.out.println("Monster loc: " + row + ", " + col);
              }
            }
      }
      
     public void moveLeft(Character character) 
      {
        System.out.println("Move left");
          int row = character.getX();
          int col = character.getY();
          if(row - 1 < map.length && !(map[row-1][col].checkMonster() || map[row-1][col].checkPlayer()) && !(map[row-1][col].isWall()))
            {
              if (character instanceof Player){
               map[row][col].removePlayer();
               map[row-1][col].PlayerOn((Player)character);
               character.move('a');
               System.out.println("Player loc: " + row + ", " + col);
              }
              else {
               map[row][col].removeMonster();
               map[row-1][col].MonsterOn((Monster)character);
               character.move('a');
               System.out.println("Monster loc: " + row + ", " + col);
              }
            }
      }
      
     public void moveUp(Character character) 
      {
        System.out.println("Move up");
          int row = character.getX();
          int col = character.getY();
          if(col - 1 < map.length && !(map[row][col-1].checkMonster() || map[row][col-1].checkPlayer()) && !(map[row][col-1].isWall()))
            {
              if (character instanceof Player){
               map[row][col].removePlayer();
               map[row][col-1].PlayerOn((Player)character);
               character.move('w');
               System.out.println("Player loc: " + row + ", " + col);
              }
              else {
               map[row][col].removeMonster();
               map[row][col-1].MonsterOn((Monster)character);
               character.move('w');
               System.out.println("Monster loc: " + row + ", " + col);
              }
            }
      }
      
    public void moveDown(Character character) 
      {
        System.out.println("Move down");
          int row = character.getX();
          int col = character.getY();
          if(col + 1 < map.length && !(map[row][col+1].checkMonster() || map[row][col+1].checkPlayer()) && !(map[row][col+1].isWall()))
            {
              if (character instanceof Player){
               map[row][col].removePlayer();
               map[row][col+1].PlayerOn((Player)character);
               character.move('s');
               System.out.println("Player loc: " + row + ", " + col);
              }
              else {
               map[row][col].removeMonster();
               map[row][col+1].MonsterOn((Monster)character);
               character.move('s');
               System.out.println("Monster loc: " + row + ", " + col);
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
      char dir = dirs[floor(random(4))];
      moveMain(dir, m);
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
    
  void playerMove(char dir) {
    moveMain(dir, playerStore);
  }
}

PixelGungeon a;
int oldTime = millis();

   void keyPressed(){
     a.playerMove(key);
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
    if (millis()-oldTime >= 1000){
      a.monsterMove();
      oldTime = millis();
    }
    //System.out.println(a);
  }
