package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author lorenzo
	 */
	public class tankBase extends MovieClip
	{
		protected var tankBody:tank_body;
		protected var tankturret:tankTurret;
		public var turretAngle:Number = 0;
		
		public function tankBase()
		{
			this.addEventListener(Event.ENTER_FRAME, loop);
			
			tankBody = new tank_body();
			this.addChild(tankBody);
			tankturret = new tankTurret();
			this.addChild(tankturret);
		}
		
		public function loop(e:Event):void
		{
			var dx:Number = mouseX;
			var dy:Number = mouseY;
			
			var radian:Number = Math.atan2(dy, dx);
			var angle:Number = radian * 180 / Math.PI
			
			tankturret.rotation = angle;
			turretAngle = tankturret.rotation;
		}
	
	}

}