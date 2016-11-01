package classes;

import flash.desktop.Clipboard;
import flixel.FlxObject;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Hero_Shoot extends Shoot
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, dir:Bool) 
	{
		super(X, Y, SimpleGraphic, dir);
		
	}
	
	public function Tcollision(object:FlxObject):Void{
		FlxG.collide(this, object, destruction);
	}
	
	private function destruction(object1:FlxObject,object2:FlxObject):Void{
		object1.kill();
		object2.destroy();
	}
}