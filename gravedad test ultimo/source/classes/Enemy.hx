package classes;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Enemy extends FlxSprite
{
	private var Vida:Int;
	private var counter:Float;
	private var Me:Bool=true;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16);
		counter = 0;
		//velocity.x = Me?10: -10;
	}
	
	override public function update(elapsed:Float):Void 
	{
		
		super.update(elapsed);
		/*
		counter = counter + 1;
		
		if(counter >= 100){
			counter = 1;
		}
		
		if(counter<=250){
			Me = true;
		}
		
		else if(counter>=250){
			Me = false;
			
		}
		*/
	}
	
}