package {	import flash.display.*;	import flash.events.*;	import flash.ui.*;		public class Main extends MovieClip	{		private var score:Number;		private var speed:Number;
		private var pipes:Array;		private var gotoWin, gotoLose, playerClicked:Boolean;
						public function Main()		{			
					}				//All Start Functions		public function startMenu()		{			stop();			btnStartGame.addEventListener(MouseEvent.CLICK, gotoStartGame);					}						public function startWin()		{			btnBack.addEventListener(KeyboardEvent.KEY_DOWN, gotoMenu);		}
						public function startLose()		{			btnBack.addEventListener(KeyboardEvent.KEY_DOWN, gotoMenu);		}				public function startGame()		{	
		this.gotoAndStop("game");			score = 0;			speed = 0;
						gotoWin = false;
			gotoLose = false;
			playerClicked = false;
			
			pipes = new Array(	"pipe1a","pipe1b","pipe2a","pipe2b","pipe3a","pipe3b",
								"pipe4a","pipe4b","pipe5a","pipe5b","pipe6a","pipe6b",
								"pipe7a","pipe7b","pipe8a","pipe8b");						addEventListener(Event.ENTER_FRAME,update);			stage.addEventListener(KeyboardEvent.KEY_DOWN,clicked);						stage.focus = this;
			
				for (var i = 0; i < pipes.length; i++){
					trace("Ron");
					var currPipeName = pipes[i];
					var currPipe = this[currPipeName];
					currPipe.x -= 8;
					
					
				}		}						private function gotoStartGame(evt:MouseEvent)		{			btnStartGame.removeEventListener(MouseEvent.CLICK, gotoStartGame);			gotoAndStop("game");		}								private function gotoMenu(evt:KeyboardEvent)		{			btnBack.removeEventListener(KeyboardEvent.KEY_DOWN, gotoMenu);			gotoAndStop("menu");		}				private function clicked(evt:KeyboardEvent)		{			playerClicked = true;		}				public function update(evt:Event)		{			//handleUserInput();			//handleGameLogic();			//handleDraw();						if (gotoWin)				triggerGoToWin();			else if (gotoLose)				triggerGoToLose();		}				private function handleUserInput()		{						if (playerClicked)
			{
				speed = -16;	
				playerClicked = false;	
			}		}				private function handleGameLogic()		{			this.y += speed;						
			speed += 1.4;
						if (this.y <= 0)			{				gotoLose = true;			}			else if (this.y >= 600)			{				gotoLose = true;			}
			
		
			for (var i in pipes)
			{
				var currPipeName = pipes[i];
				var currPipe = this[currPipeName];
				
			
				currPipe.x -= 8;
				
		
				if (currPipe.hitTestPoint(this.x, this.y))
				{
					gotoLose = true;
				}
				
				
				if (currPipe.visible && currPipe.x <= 0)
				{
					score+=0.5;
					currPipe.visible = false;
				}
			}			 						if (score >= 8)				gotoWin = true;		}				private function handleDraw()		{			txtScore.text = String(score);		}				private function triggerGoToWin()		{			removeEventListener(Event.ENTER_FRAME, update);			gotoAndStop("winnen");		}
		
		private function triggerGoToLose()		{			removeEventListener(Event.ENTER_FRAME, update);			gotoAndStop("lose");		}			}}