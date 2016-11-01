package classes;

import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class BigShoot extends Hero_Shoot
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, dir:Bool) 
	{
		super(X, Y, SimpleGraphic, dir);
		makeGraphic(20, 20);
	}
	
}