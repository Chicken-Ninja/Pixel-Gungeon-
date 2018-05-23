public class PixelGungeon{
    private char[][] map;

    public PixelGungeon(){
	map = new char[10][10];
	mapGen();
    }

    public void mapGen(){
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
    }

    public String toString(){
	String dump = "";
	if (map.length==0){
	    return "[]";
	}
	for (int r=0; r<map.length; r++){
	    for (int c=0; c<map[0].length; c++){
		dump += map[r][c];
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
