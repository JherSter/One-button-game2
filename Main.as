package
{
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	import flash.media.*;


	public class Main extends MovieClip
	{
		private var score: Number;
		private var speed: Number;
		private var pipes: Array;
		private var gotoWin, gotoLose, playerClicked: Boolean;
		var my_sound: SoundId = new SoundId();
		var channel: SoundChannel = my_sound.play();




		public function Main()
		{


		}

		//All Start Functions
		public function startMenu()
		{
			stop();
			btnStartGame.addEventListener(MouseEvent.CLICK, gotoStartGame);

		}

		public function startWin()
		{
			btnBack.addEventListener(MouseEvent.CLICK, gotoMenu);
		}


		public function startLose()
		{
			btnBack.addEventListener(MouseEvent.CLICK, gotoMenu);
		}

		public function startGame()
		{
			mcPlayer.gotoAndPlay("right");
			score = 0;
			speed = 0;



			gotoWin = false;
			gotoLose = false;
			playerClicked = false;

			pipes = new Array("pipe1a", "pipe1b", "pipe2a", "pipe2b", "pipe3a", "pipe3b",
				"pipe4a", "pipe4b", "pipe5a", "pipe5b", "pipe6a", "pipe6b",
				"pipe7a", "pipe7b", "pipe8a", "pipe8b");

			addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(MouseEvent.CLICK, clicked);

			stage.focus = this;
			trace("IPAOBDW");



		}


		private function gotoStartGame(evt: MouseEvent)
		{
			btnStartGame.removeEventListener(MouseEvent.CLICK, gotoStartGame);
			gotoAndStop("game");
			trace("Ron");
		}



		private function gotoMenu(evt: MouseEvent)
		{
			btnBack.removeEventListener(MouseEvent.CLICK, gotoMenu);
			gotoAndStop("menu");
			trace("peter");
		}

		private function clicked(evt: MouseEvent)
		{
			
			playerClicked = true;
		}

		public function update(evt: Event)
		{
			handleUserInput();
			handleGameLogic();
			handleDraw();

			if (gotoWin)
				triggerGoToWin();
			else if (gotoLose)
				triggerGoToLose();
		}

		private function handleUserInput()
		{

			if (playerClicked == true)
			{

				my_sound.play();
				speed = -16;

				playerClicked = false;
			}
		}






		private function handleGameLogic()
		{

			mcPlayer.y += speed;


			speed += 1.4;

			if (mcPlayer.y <= 0)
			{
				gotoLose = true;
			}
			else if (mcPlayer.y >= 600)
			{
				gotoLose = true;
			}


			for (var i in pipes)
			{
				var currPipeName = pipes[i];
				var currPipe = this[currPipeName];


				currPipe.x -= 8;


				if (currPipe.hitTestPoint(mcPlayer.x, mcPlayer.y))
				{
					gotoLose = true;
				}


				if (currPipe.visible && currPipe.x <= 0)
				{
					score += 0.5;
					currPipe.visible = false;
				}
			}


			if (score >= 8)
			{
				gotoWin = true;
			}

		}



		private function handleDraw()
		{

			txtScore.text = String(score);
		}

		private function triggerGoToWin()
		{
			removeEventListener(Event.ENTER_FRAME, update);
			gotoAndStop("winnen");
		}

		private function triggerGoToLose()
		{
			removeEventListener(Event.ENTER_FRAME, update);
			gotoAndStop("lose");
		}

	}
}