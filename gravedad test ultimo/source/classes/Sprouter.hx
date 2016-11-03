package classes;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Sprouter extends Enemy
{
	private var _disparo:EnemyShoot;
	
	
	private var D:Bool = true;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (D)
		{
			_relojDisparo -= elapsed; 
		}
		
		if(_relojDisparo <= 0){
			
			reloj();
			for(i in 0...5){
			_disparo = new EnemyShoot();
			_disparo.reset(x + width*i / 2 - _disparo.width*i/ 2, y/i);
			_disparo.velocity.x = 200;
			FlxG.state.add(_disparo);
			}
		}
	}
}