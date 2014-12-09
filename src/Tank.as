package
{
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Tank extends tankBase
	{
		//private var tankBody:tank_body;//verplaatsen naar tankbase
		//private var tankturret:tankTurret;
		
		private var controlDir:Point;
		private var speed:Number = 0;
		
		//public var turretAngle:Number = 0;//verplaatsen naar tankbase
		
		public function Tank()
		{ //constructor, begin punt van nieuw object
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
			/*tankBody = new tank_body();//verplaatsen naar tankbase
			   this.addChild(tankBody);
			   tankturret = new tankTurret();
			 this.addChild(tankturret);*/
			
			controlDir = new Point(0, 0);
		
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			//this.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void
		{
			
			dispatchEvent(new Event("onShoot"));
		}
		
		override public function loop(e:Event):void
		{
			//this.x += controlDir.x * 5;
			//this.y += controlDir.y * 5;
			
			speed = controlDir.y * -5;
			this.rotation += controlDir.x * 3;
			var radian:Number = this.rotation * Math.PI / 180;
			//van graden naar radians
			//angle * Math.PI / 180;
			var xMove:Number = Math.cos(radian);
			var yMove:Number = Math.sin(radian);
			this.x += xMove * speed;
			this.y += yMove * speed;
			
			super.loop(e);
		
		/*var dx:Number = mouseX; verplaatst naar tankbase
		   var dy:Number = mouseY;
		
		   radian = Math.atan2(dy, dx);
		   var angle:Number = radian * 180 / Math.PI
		
		   tankturret.rotation = angle;
		 turretAngle = tankturret.rotation;*/
		
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.W)
			{
				//speler drukt op w
				controlDir.y = 0;
				
			}
			
			if (e.keyCode == Keyboard.A)
			{
				//speler drukt op w
				controlDir.x = 0;
				
			}
			
			if (e.keyCode == Keyboard.S)
			{
				//speler drukt op w
				controlDir.y = 0;
				
			}
			
			if (e.keyCode == Keyboard.D)
			{
				//speler drukt op w
				controlDir.x = 0;
			}
		
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.W)
			{
				//speler laat w los
				controlDir.y = -1;
			}
			
			if (e.keyCode == Keyboard.A)
			{
				//speler laat w los
				controlDir.x = -1;
			}
			
			if (e.keyCode == Keyboard.S)
			{
				//speler laat w los
				controlDir.y = 1;
			}
			
			if (e.keyCode == Keyboard.D)
			{
				//speler laat w los
				controlDir.x = 1;
			}
		
		}
	
	}

}