package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Main extends Sprite
	{
		private var tank1:Tank;
		public var enemies:Array;
		private var bullets:Vector.<Bullet>;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			enemies = new Array();
			for (var i:int = 0; i < 3; i++)
			{
				var enemy:Enemy = new Enemy();
				enemies.push(enemy);
				addChild(enemy);
				enemy.x = Math.random() * stage.stageWidth;
				enemy.y = Math.random() * stage.stageHeight;
			}
			
			tank1 = new Tank(); // niet meer hier
			this.addChild(tank1); //maar wel hier
			
			tank1.x = 300;
			tank1.y = 300;
			
			tank1.addEventListener("onShoot", createBullet);
			
			bullets = new Vector.<Bullet>();
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void
		{
			for (var i:int = 0; i < bullets.length; i++)
			{
				bullets(i).update();
				
				if (bullets(i).x > stage.stageWidth || bullets(i).x < 0 || bullets(i).y > stage.stageHeight || bullets(i).y < 0)
				{
					removeChild(bullets(i));
					bullets.splice(i, 1);
				}
			}
		}
		
		private function createBullet(e:ShootEvent):void
		{
			var r:Number = e.Shooter.turretAngle + e.Shooter.rotation;
			var b:Bullet = new Bullet(r, tPos);
			var tPos:Point = new Point(e.Shooter.x, e.Shooter.y);
			
			bullets.push(b);
			addChild(b);
			b.scaleX = b.scaleY = tank1.scaleX;
			b.rotation = tank1.turretAngle + tank1.rotation;
		
		}
	
	}

}