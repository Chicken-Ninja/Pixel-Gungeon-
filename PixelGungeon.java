public class PixelGungeon{
    private Tile[][] map;

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
	Tile a = new Tile( 0 , 1 , false);
	Player b = new Player();
	a.PlayerOn(b);
	map[0][1] = a;
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

    public static void main(String[] args)
    {
	PixelGungeon a = new PixelGungeon();
	System.out.println(a.toString());
    }
}
