char[][] mapGen(){
  char[][] map = new char[10][10];
  for (int r=0; r<map.length; r++){
      for (int c=0; c<map[0].length; c++){
    map[r][c] = ' ';
      }
  }
  for (int n=0; n<map[0].length; n++){
      map[0][n] = 'W';
      map[map.length-1][n] = 'W';
  }
  for (int n=0; n<map.length; n++){
      map[n][0] = 'W';
      map[n][map[0].length-1] = 'W';
  }
  map[0][1] = 'S';
  map[8][9] = 'E';
  return map;
}

  void setup(){
    size(500,500);
  }
  
  void draw(){
    char[][] map = mapGen();
    for (int r=0; r<map.length; r++){
      for (int c=0; c<map[0].length; c++){
        if (map[r][c] == 'W'){
          rect(r*50, c*50, 50, 50);
        }
      }
    }
  }