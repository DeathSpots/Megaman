package classes;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import classes.StaticReferences;
import flixel.util.FlxColor;
import flixel.FlxObject;

/**
 * ...
 * @author ...
 */
class Crawler extends Enemy
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(10, 10,FlxColor.RED);
	}
	
	public function reverse(mapa:FlxTilemap):Void{
		trace("colisionando");
		FlxG.collide(mapa, this);
		if(this.isTouching(FlxObject.RIGHT)){
			velocity.x = -400;
			makeGraphic(10, 10,FlxColor.BLUE);
		}
		
		if(this.isTouching(FlxObject.LEFT)){
			velocity.x = 400;
			
		}
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		reverse(StaticReferences._mapa);
		
		/*
		if (x < _originalX - 8)
		{
			x = _originalX - 8;
			velocity.x = -velocity.x;
			
		}
		
		if (x > _originalX + 8) 
		{
			x = _originalX + 8;
			velocity.x = -velocity.x;
		}
		*/
	}
	
}
