package classes;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;
/**
 * ...
 * @author ...
 */
class Shoot extends FlxSprite
{
	private var dir:Bool = false;
	private var velX:Int;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, dir:Bool ) 
	{
		super(X, Y, SimpleGraphic);
		velocity.x = dir?-400:400;
		
	}
	
	public function ColD(entity:FlxGroup){
		FlxG.collide(this, entity, stuffHitStuff);
	}
	
	private function stuffHitStuff(Object1:FlxObject, Object2:FlxObject):Void
	{
		Object1.kill();
		Object2.kill();
	}
	
	override public function update(elapsed : Float):Void{
		
		super.update(elapsed);
		
		if (this.x > FlxG.camera.scroll.x + FlxG.camera.width){	
			this.kill();
		}
	}

}