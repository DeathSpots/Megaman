package classes;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Enemy extends FlxSprite
{
	private var Vida:Int;
	
	private var _originalX:Float;
	private var _relojDisparo:Float;
	

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16);
		_originalX = X;
		velocity.x = 15;
		reloj();
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		
		super.update(elapsed);
		
		
	
	}
	private function reloj():Void{
		_relojDisparo = 1 + FlxG.random.float() * 10;
	}
	
}