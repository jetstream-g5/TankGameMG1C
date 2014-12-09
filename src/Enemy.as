package  
{
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Enemy extends tankBase
	{
		private var shootTimer:Timer;
		public function Enemy() 
		{
			shootTimer = new Timer(1500+Math.random * 1000);
			shootTimer.addEventListener(TimerEvent.TIMER, shoot);
			ShootTimer.start();
		}
		
		private function shoot(e:TimerEvent):void 
		{
			
		}
		override public function loop(e):void
		{
				targetPosition.x = Main.tank1.x - this.x;
				targetPosition.y = Main.tank1.y - this.y;
				super.loop(e);
		}
		
	}

}