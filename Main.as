﻿
		private var pipes:Array;
		
			
		
		this.gotoAndStop("game");
			
			gotoLose = false;
			playerClicked = false;
			
			pipes = new Array(	"pipe1a","pipe1b","pipe2a","pipe2b","pipe3a","pipe3b",
								"pipe4a","pipe4b","pipe5a","pipe5b","pipe6a","pipe6b",
								"pipe7a","pipe7b","pipe8a","pipe8b");
			
				for (var i = 0; i < pipes.length; i++){
					trace("Ron");
					var currPipeName = pipes[i];
					var currPipe = this[currPipeName];
					currPipe.x -= 8;
					
					
				}
			{
				speed = -16;	
				playerClicked = false;	
			}
			speed += 1.4;
			
			
		
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
			}
		
		private function triggerGoToLose()