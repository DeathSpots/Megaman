package classes;

import flixel.group.FlxGroup;

/**
 * ...
 * @author ...
 */
class EnemyGroup extends FlxGroup
{
	private var Enemigo:Array<Enemy> = [];

	public function new(X:Int,Y:Int) 
	{
		super();
		for (i in 0...5){
		
		var enemy:Enemy = new Enemy(X, Y);
		Enemigo[i] = enemy; 
		Enemigo.push(enemy);
		add(enemy);
			
		}
		
	}
}
	