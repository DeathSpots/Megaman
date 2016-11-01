package classes;

import classes.Hero_Shoot;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class SmallShoot extends Hero_Shoot
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, dir:Bool) 
	{
		super(X, Y, SimpleGraphic, dir);
		makeGraphic(4, 4);
		
	}
	
}