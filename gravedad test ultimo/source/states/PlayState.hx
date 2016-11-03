package states;

import classes.Crawler;
import classes.Enemy;
import classes.EnemyGroup;
import classes.Player;
import classes.Sprouter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTile;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import classes.StaticReferences;

class PlayState extends FlxState
{
	
	private var floor:FlxSprite;
	private var P:classes.Player;
	private var TouchG:Bool = false;
	
	private var loader:FlxOgmoLoader;
	private var map:FlxTilemap;
	private var map2:FlxTilemap;
	
	
	private var Enemies:FlxTypedGroup<Enemy> = new FlxTypedGroup<Enemy>();
	
	
	override public function create():Void
	{
		
		super.create();
		
		loader = new FlxOgmoLoader(AssetPaths.Mega_level1__oel);
		map = loader.loadTilemap(AssetPaths.MegaTiles__png, 16, 16, "Tiles");
		map2 = loader.loadTilemap(AssetPaths.MegaTiles__png, 16, 16, "death_tiles");
		
		StaticReferences._mapa = map;
		
		FlxG.worldBounds.set(0, 0, loader.width, loader.height);
		
		map.setTileProperties(3, FlxObject.ANY);
		map.setTileProperties(5, FlxObject.ANY);
		map.setTileProperties(7, FlxObject.ANY);
		map.setTileProperties(4, FlxObject.ANY);
		map2.setTileProperties(6, FlxObject.ANY);
		
		add(map);
		add(map2);
		loader.loadEntities(placeEntities, "Megaman");
		/*
		floor = new FlxSprite(0, 200);
		floor.makeGraphic(400, 50,0xFF008080);
		floor.immovable = true;
		*/
		FlxG.camera.setScrollBounds(0, loader.width, 0, loader.height);
		camera.follow(P);
		
		//add(floor);
		
		add(P);
		add(Enemies);
		
		FlxG.debugger.visible = true;
		FlxG.debugger.drawDebug = true;
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var X:Int = Std.parseInt(entityData.get("x"));
		var Y:Int = Std.parseInt(entityData.get("y"));
			
		if (entityName == "Megaman")
		{
			P = new Player(X,Y);
		}
		
		if(entityName == "enemies"){
			var enemy:Sprouter = new Sprouter(X, Y);
			enemy.immovable = true;
			Enemies.add(enemy);	
		}
		
		if(entityName == "enemies2"){
			var enemy2:Crawler = new Crawler(X, Y);
			Enemies.add(enemy2);	
		}
		
	}

	override public function update(elapsed:Float):Void
	{
		trace("funciona");
		//personaje
		FlxG.collide(map, P);
		//FlxG.collide(Enemies, P);
		for( i in 0... Enemies.members.length){
			if(FlxG.pixelPerfectOverlap(Enemies.members[i], P)){
				P.kill();
			}
		} 
		
		
		if(FlxG.collide(P, map2)){
			P.kill();
		}
		P.isJumping(P.isTouching(FlxObject.FLOOR));
		
		//enemigos
		
		super.update(elapsed);
		
	}
}
