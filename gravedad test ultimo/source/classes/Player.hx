package classes;

import classes.BigShoot;
import classes.SmallShoot;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxBasic;
import flixel.group.FlxGroup;
 

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{
	private var JumpPower:Int = 800;
	private var JumpTimes:Int ;
	private var stopJ:Bool = true;
	private var contD:Int;
	
	private var _disparo:BigShoot;
	private var _disparo2:SmallShoot;
	
	private var object:FlxGroup;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16);
		loadGraphic(AssetPaths.RunningSmall__png,true,60,60);
		maxVelocity.set(200, 200);
		acceleration.y = 400;
		drag.set(1600, 1600);
		_disparo = new BigShoot(flipX);
		_disparo2 = new SmallShoot(flipX);
		animation.add("running", [0, 1, 2, 3], 10, true);
		
		contD = 0;
	}
	
	
	public function isJumping(TG:Bool){
		if(TG){
			JumpTimes = 0;
			stopJ = false;
		}
	}
	
	public function colD(object){
		_disparo.ColD(object);
		_disparo2.ColD(object);
	}
	
	public function collG(G:FlxGroup){
		FlxG.collide(G, this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		acceleration.x = 0;
		//MOVIMIENTO
		if (FlxG.keys.pressed.RIGHT){
			velocity.x += 55;
			flipX = false;
			animation.play("running");
			}
			//animation.play("run");
			
		if (FlxG.keys.pressed.LEFT){
			velocity.x -= 55;
			flipX = true;
		}
			
		if (FlxG.keys.justPressed.UP && !stopJ){
			JumpTimes += 1;
			velocity.y -=  JumpPower;
		}
		if (FlxG.keys.pressed.DOWN)
			velocity.y += 555;
		
		if(JumpTimes>=2){
			stopJ = true;
		}
		//FINAL MOVIMIENTO
		
		//DISPARO
		if(FlxG.keys.pressed.SPACE){
			contD = ++contD;
		}
		
		if(FlxG.keys.justReleased.SPACE && contD >= 100){
			var _disparo:BigShoot = new BigShoot(x + (width) / 2, y + height / 2, flipX);
			FlxG.state.add(_disparo);
			
			
			contD = 0;
		}
		else if(FlxG.keys.justReleased.SPACE && contD < 150){
			var _disparo2: SmallShoot = new SmallShoot(x + (width) / 2, y + height / 2, flipX);
			FlxG.state.add(_disparo2);
			contD = 0;
		}
		//FINAL DISPARO
	    
		//Col Disparo
		
		super.update(elapsed);
	}
	
	
}